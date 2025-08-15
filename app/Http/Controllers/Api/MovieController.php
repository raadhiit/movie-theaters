<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Movie;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class MovieController extends Controller
{
    public function index(Request $r)
    {
        $r->validate([
            'q'        => ['nullable', 'string'],
            'per_page' => ['nullable'],
            'sort'     => ['nullable', Rule::in(['name', 'duration_min', 'created_at'])],
            'order'    => ['nullable', Rule::in(['asc', 'desc'])],
        ]);

        $sort  = $r->input('sort', 'created_at');
        $order = $r->input('order', 'desc');

        $q = Movie::query()
            ->when($r->q, fn($qq) => $qq->where('name', 'like', '%' . $r->q . '%'))
            ->orderBy($sort, $order);

        if ($r->per_page === 'all') {
            return response()->json($q->get());
        }

        $perPage = (int) ($r->per_page ?? 20);
        return $q->paginate($perPage)->appends($r->query());
    }

    /**
     * POST /api/movies
     * Body:
     * { "name": "The Great Escape", "duration_min": 120 }
     */
    public function store(Request $r)
    {
        $data = $r->validate([
            'name'         => ['required'],
            'duration_min' => ['required'],
        ]);

        $movie = Movie::create([
            'name'         => $data['name'],
            'duration_min' => $data['duration_min'],
        ]);
        return response()->json($movie, 201);
    }

    /**
     * GET /api/movies/{movie}
     */
    public function show(Movie $movie)
    {
        return response()->json($movie);
    }

    /**
     * PUT/PATCH /api/movies/{movie}
     * Body (partial allowed)
     */
    public function update(Request $r, Movie $movie)
    {
        $data = $r->validate([
            'name'         => ['sometimes', 'string', 'max:255', Rule::unique('movies', 'name')->ignore($movie->id)],
            'duration_min' => ['sometimes', 'integer', 'min:1'],
        ]);

        $movie->update($data);
        return response()->json($movie);
    }

    /**
     * DELETE /api/movies/{movie}
     */
    public function destroy(Movie $movie)
    {
        $movie->delete();
        return response()->noContent(); // 204
    }
}
