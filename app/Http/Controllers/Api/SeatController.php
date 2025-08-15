<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Seat;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\Database\QueryException;

class SeatController extends Controller
{
    public function index(Request $r)
    {
        $r->validate([
            'auditorium_id' => ['nullable', 'integer', 'min:1'],
            'row_label'     => ['nullable', 'string', 'max:50'],
            'sort'          => ['nullable', Rule::in(['row_label', 'seat_number', 'created_at'])],
            'order'         => ['nullable', Rule::in(['asc', 'desc'])],
            'per_page'      => ['nullable'],
        ]);

        $sort  = $r->input('sort');   // bisa null → kita apply default 2 kolom
        $order = $r->input('order', 'asc');

        $q = Seat::query()
            ->when($r->auditorium_id, fn($qq) => $qq->where('auditorium_id', $r->auditorium_id))
            ->when($r->row_label,     fn($qq) => $qq->where('row_label', $r->row_label));

        if ($sort) {
            $q->orderBy($sort, $order);
        } else {
            // default: urut baris lalu nomor kursi
            $q->orderBy('row_label', 'asc')->orderBy('seat_number', 'asc');
        }

        if ($r->per_page === 'all') {
            return response()->json($q->get());
        }

        $perPage = (int) ($r->per_page ?? 50);
        return $q->paginate($perPage)->appends($r->query());
    }

    public function store(Request $r)
    {
        $data = $r->validate([
            'auditorium_id' => ['required', 'integer', 'exists:auditoriums,id'],
            'row_label'     => ['required', 'string', 'max:50'],
            'seat_number'   => ['required', 'integer', 'min:1', 'max:10000'],
        ]);

        // Cek kombinasi unik per auditorium
        $exists = Seat::where('auditorium_id', $data['auditorium_id'])
            ->where('row_label', $data['row_label'])
            ->where('seat_number', $data['seat_number'])
            ->exists();

        if ($exists) {
            return response()->json([
                'message' => 'Seat already exists in this auditorium (row_label + seat_number must be unique).'
            ], 422);
        }

        $seat = Seat::create($data);
        return response()->json($seat, 201);
    }

    public function show($id)
    {
        $seat = Seat::findOrFail($id);
        return response()->json($seat);
    }

    public function update(Request $r, $id)
    {
        $seat = Seat::findOrFail($id);

        $data = $r->validate([
            'auditorium_id' => ['sometimes', 'integer', 'exists:auditoriums,id'],
            'row_label'     => ['sometimes', 'string', 'max:50'],
            'seat_number'   => ['sometimes', 'integer', 'min:1', 'max:10000'],
        ]);

        // Kalau ada field yang mengubah kombinasi, validasi unik lagi
        $auditoriumId = $data['auditorium_id'] ?? $seat->auditorium_id;
        $rowLabel     = $data['row_label']     ?? $seat->row_label;
        $seatNumber   = $data['seat_number']   ?? $seat->seat_number;

        $exists = Seat::where('auditorium_id', $auditoriumId)
            ->where('row_label', $rowLabel)
            ->where('seat_number', $seatNumber)
            ->where('id', '!=', $seat->id)
            ->exists();

        if ($exists) {
            return response()->json([
                'message' => 'Seat already exists in this auditorium (row_label + seat_number must be unique).'
            ], 422);
        }

        $seat->update($data);
        return response()->json($seat);
    }

    public function destroy($id)
    {
        $seat = Seat::findOrFail($id);
        $seat->delete();

        return response()->noContent(); // 204
    }
}
