<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OfficeInventory extends Model
{
    use HasFactory;

    protected $table = 'office_inventory';
    protected $primaryKey = ['office_id', 'inventory_item_id'];
    public $incrementing = false;
    protected $fillable = ['office_id', 'inventory_item_id'];

    public function office()
    {
        return $this->belongsTo(Office::class);
    }

    public function inventoryItem()
    {
        return $this->belongsTo(InventoryItem::class);
    }
}
