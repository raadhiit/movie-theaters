<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    protected $fillable = ['customer_id', 'status'];
    public function customer()
    {
        return $this->belongsTo(Customer::class);
    }
    public function items()
    {
        return $this->hasMany(OrderItemTicket::class);
    }
    public function payments()
    {
        return $this->hasMany(Payments::class);
    }
    public function tickets()
    {
        return $this->hasManyThrough(Ticket::class, OrderItemTicket::class);
    }
}
