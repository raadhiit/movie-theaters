<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Movie extends Model
{
    protected $table = 'movies';
    protected $fillable = ['name', 'duration_min'];
    public function screenings()
    {
        return $this->hasMany(Screening::class);
    }
}
