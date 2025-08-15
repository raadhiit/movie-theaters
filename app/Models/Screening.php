<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Screening extends Model
{
    protected $table = 'screenings';
    protected $fillable = ['movie_id', 'auditorium_id', 'start_time'];
    protected $casts = ['start_time' => 'datetime'];
    public function movie()
    {
        return $this->belongsTo(Movie::class);
    }
    public function auditorium()
    {
        return $this->belongsTo(Auditorium::class);
    }
    public function orderItems()
    {
        return $this->hasMany(OrderItemTicket::class);
    }
}
