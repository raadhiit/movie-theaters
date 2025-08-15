<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Seat extends Model
{
    protected $table = 'seats';
    protected $fillable = ['auditorium_id', 'row_label', 'seat_number'];
    public function auditorium()
    {
        return $this->belongsTo(Auditorium::class);
    }
}
