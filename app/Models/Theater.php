<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Theater extends Model
{
    protected $table = 'theaters';
    
    protected $fillable = [
        'name'
    ];

    public function auditorium()
    {
        return $this->hasMany(Auditorium::class);
    }
}
