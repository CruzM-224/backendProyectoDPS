<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class carritoProducto extends Model
{
    use HasFactory;

    public function carrito(){
        return $this->belongsTo(carrito::class, 'id_carrito', 'id');
    }
    public function producto(){
        return $this->belongsTo(producto::class, 'id_producto', 'id');
    }

    
}
