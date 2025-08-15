<?php

namespace App\Http\Controllers\Api;

use App\Models\Seat;
use App\Models\Order;
use App\Models\Ticket;
use App\Models\Payments;
use App\Models\Screening;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Models\OrderItemTicket;
use App\Http\Controllers\Controller;

class OrderController extends Controller
{
    public function store(Request $r)
    {
        $data = $r->validate(['customer_id' => 'required|exists:customers,id']);
        return Order::create(['customer_id' => $data['customer_id'], 'status' => 'pending']);
    }

    public function show(Order $order)
    {
        return $order->load(['customer', 'items.seat', 'items.screening', 'payments', 'tickets']);
    }

    public function addItem(Request $r, Order $order)
    {
        $data = $r->validate([
            'screening_id' => 'required|exists:screenings,id',
            'seat_id' => 'required|exists:seats,id',
            'unit_price' => 'required|numeric|min:0'
        ]);

        // Validasi seat belongs to screening auditorium
        $screening = Screening::findOrFail($data['screening_id']);
        $seat = Seat::findOrFail($data['seat_id']);
        if ($seat->auditorium_id !== $screening->auditorium_id) {
            return response()->json(['message' => 'Seat not in the same auditorium'], 422);
        }

        // Simpan, dilindungi unique index (screening_id, seat_id)
        try {
            $item = OrderItemTicket::create([
                'order_id' => $order->id,
                'screening_id' => $screening->id,
                'seat_id' => $seat->id,
                'unit_price' => $data['unit_price'],
            ]);
        } catch (\Illuminate\Database\QueryException $e) {
            return response()->json(['message' => 'Seat already booked'], 409);
        }

        return $item->load('seat', 'screening');
    }

    public function pay(Request $r, Order $order)
    {
        $data = $r->validate(['method' => 'required', 'amount' => 'required|numeric|min:0']);
        $pay = Payments::create(['order_id' => $order->id, 'method' => $data['method'], 'amount' => $data['amount']]);
        $order->update(['status' => 'paid']);

        // Terbitkan tiket untuk setiap item (barcode sederhana)
        foreach ($order->items as $it) {
            Ticket::firstOrCreate(
                ['order_item_ticket_id' => $it->id],
                ['barcode' => 'TIX-' . str_pad($it->id, 6, '0', STR_PAD_LEFT) . '-' . Str::upper(Str::random(6))]
            );
        }
        return $order->load('payments', 'tickets');
    }

    public function tickets(Order $order)
    {
        return $order->tickets()->with('orderItem.seat', 'orderItem.screening')->get();
    }
}
