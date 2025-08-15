<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Ticket extends Model
{
    protected $fillable = ['order_item_ticket_id', 'barcode'];
    public function orderItem()
    {
        return $this->belongsTo(OrderItemTicket::class, 'order_item_ticket_id');
    }
}
