<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Theater;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class TheaterController extends Controller
{
    /**
     * GET /api/theaters
     */
    public function index()
    {
        return response()->json(Theater::all());
    }

    /**
     * POST /api/theaters
     * Body: { "name": "Theater 1" }
     */
    public function store(Request $request)
    {
        $data = $request->validate([
            'name' => ['required', 'string', 'max:255', 'unique:theaters,name'],
        ]);

        $theater = Theater::create($data);
        return response()->json($theater, 201);
    }

    /**
     * GET /api/theaters/{id}
     */
    public function show($id)
    {
        $theater = Theater::findOrFail($id);
        return response()->json($theater);
    }

    /**
     * PUT/PATCH /api/theaters/{id}
     * Body: { "name": "New Theater Name" }
     */
    public function update(Request $request, $id)
    {
        $theater = Theater::findOrFail($id);

        $data = $request->validate([
            'name' => [
                'required',
                'string',
                'max:255',
                Rule::unique('theaters', 'name')->ignore($theater->id)
            ],
        ]);

        $theater->update($data);
        return response()->json($theater);
    }

    /**
     * DELETE /api/theaters/{id}
     */
    public function destroy($id)
    {
        $theater = Theater::findOrFail($id);
        $theater->delete();

        return response()->noContent(); // 204
    }
}
