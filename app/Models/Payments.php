<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Payments extends Model
{
    protected $fillable = [
        'order_id',
        'method',
        'amount'
    ];

    public function order()
    {
        return $this->belongsTo(Order::class);
    }
}
