<?php

namespace App\Http\Controllers;

use App\Models\InventoryItem;
use App\Models\OfficeInventory;
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;

class InventoryItemController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
        return response()->json(['message'=>'index']);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
        try {
            $request->validate([
                'serial' => 'required|unique:inventory_items',
                'resource_id' => 'required|exists:resources,id',
                'office_id'=>'required|exists:offices,id'
            ]);
            $item = InventoryItem::create([
                'serial' => $request->input('serial'),
                'resource_id' => $request->input('resource_id'),
            ]);
            $officeInventory = OfficeInventory::create([
                "office_id"=> $request->input('office_id'),
                "inventory_item_id"=> $item->id
            ]);
            return response()->json(['success'=>true,'message' => 'Inventory item created successfully', 'data' => $item], 201);
        } catch (ValidationException $e) {
            return response()->json(['success' => false, 'data' => $e->errors()], 422);
        }catch (\Exception $e) {
            // Manejar otras excepciones aquí
            return response()->json(['success' => false, 'data' => $e->getMessage()], 500);
        }

    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
