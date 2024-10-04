<?php

namespace App\Http\Controllers;

use App\Models\compraEstado;
use App\Models\venta;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class ventasController extends Controller
{
    public function index(){
        $ventas = venta::all()->sortByDesc("id");
        return view('ventas.index',['ventas' => $ventas]);
    }

    public function edit($id){
        $venta = venta::find($id);
        $estados = compraEstado::all();

        return view('ventas.edit', ['venta' => $venta, 'estados' => $estados]);
    }

    public function update(Request $request, $id){
        $venta = venta::find($id);
        $venta->id_estado = $request->estado;
        $venta->save();

        return redirect(route('ventas.index'))->with('success', 'Registro actualizado con éxito');
    }

    public function detalles($id){
        $venta = venta::find($id);

        return view('ventas.detalles',['venta' => $venta]);
    }

    public function obtenerComprobante($id){

        $venta = venta::find($id);

        return Storage::download('public/'.$venta->comprobante);


    }
}
