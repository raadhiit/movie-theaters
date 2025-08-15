<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Auditorium;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class AuditoriumController extends Controller
{
    /**
     * GET /api/auditoriums
     */
    public function index()
    {
        return response()->json(
            Auditorium::with('theater')->get()
        );
    }
    /**
     * POST /api/auditoriums
     * Body: { "theater_id": 1, "name": "Auditorium A" }
     */
    public function store(Request $request)
    {
        $data = $request->validate([
            'theater_id' => ['required', 'exists:theaters,id'],
            'name'       => ['required', 'string', 'max:255'],
        ]);

        $auditorium = Auditorium::create($data);
        return response()->json($auditorium, 201);
    }

    /**
     * GET /api/auditoriums/{id}
     */
    public function show($id)
    {
        return response()->json(
            Auditorium::with(['theater', 'seats', 'screenings'])->findOrFail($id)
        );
    }
    /**
     * PUT/PATCH /api/auditoriums/{id}
     * Body: { "theater_id": 1, "name": "Updated Name" }
     */
    public function update(Request $request, $id)
    {
        $auditorium = Auditorium::findOrFail($id);

        $data = $request->validate([
            'theater_id' => ['required', 'exists:theaters,id'],
            'name'       => ['required', 'string', 'max:255'],
        ]);

        $auditorium->update($data);
        return response()->json($auditorium);
    }

    /**
     * DELETE /api/auditoriums/{id}
     */
    public function destroy($id)
    {
        $auditorium = Auditorium::findOrFail($id);
        $auditorium->delete();

        return response()->noContent(); // 204
    }
}
