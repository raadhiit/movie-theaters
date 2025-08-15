<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class OrderItemTicket extends Model
{
    protected $fillable = ['order_id', 'screening_id', 'seat_id', 'unit_price'];
    public function order()
    {
        return $this->belongsTo(Order::class);
    }
    public function screening()
    {
        return $this->belongsTo(Screening::class);
    }
    public function seat()
    {
        return $this->belongsTo(Seat::class);
    }
    public function ticket()
    {
        return $this->hasOne(Ticket::class);
    }
}
