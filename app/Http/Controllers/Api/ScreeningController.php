<?php

namespace App\Http\Controllers\Api;

use App\Models\Seat;
use App\Models\Screening;
use Illuminate\Http\Request;
use App\Models\OrderItemTicket;
use App\Http\Controllers\Controller;

class ScreeningController extends Controller
{
    public function index(Request $r)
    {
        $q = Screening::with(['movie', 'auditorium'])
            ->when($r->movie_id, fn($qq) => $qq->where('movie_id', $r->movie_id))
            ->when($r->date, fn($qq) => $qq->whereDate('start_time', $r->date))
            ->orderBy('start_time');
        return $q->paginate(20);
    }

    public function show(Screening $screening)
    {
        return $screening->load(['movie', 'auditorium']);
    }

    public function store(Request $r)
    {
        $data = $r->validate([
            'movie_id' => 'required|exists:movies,id',
            'auditorium_id' => 'required|exists:auditoriums,id',
            'start_time' => 'required|date'
        ]);
        return Screening::create($data);
    }

    public function destroy(Screening $screening)
    {
        $screening->delete();
        return response()->noContent();
    }

    public function availableSeats(Screening $screening)
    {
        // kursi auditorium yg belum dibooking pada screening ini
        $bookedSeatIds = OrderItemTicket::where('screening_id', $screening->id)->pluck('seat_id');
        return Seat::where('auditorium_id', $screening->auditorium_id)
            ->whereNotIn('id', $bookedSeatIds)->orderBy('row_label')->orderBy('seat_number')->get();
    }
}
