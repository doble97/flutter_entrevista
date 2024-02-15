<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EmployeeInventoryStatus extends Model
{
    use HasFactory;
    protected $fillable = ['status', 'comment', 'user_id', 'inventory_item_id'];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function inventoryItem()
    {
        return $this->belongsTo(InventoryItem::class);
    }
}
