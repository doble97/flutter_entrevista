<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class InventoryItem extends Model
{
    use HasFactory;

    protected $fillable = ['serial', 'resource_id'];

    public function resource()
    {
        return $this->belongsTo(Resource::class);
    }
}
