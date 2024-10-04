<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class carrito extends Model
{
    use HasFactory;

    public function cliente(){
        return $this->belongsTo(usuario::class, 'id_cliente', 'id');
    }

    public function carritoProductos(){
        return $this->hasMany(carritoProducto::class, 'id_carrito', 'id');
    }
}
