<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OfficeUser extends Model
{
    use HasFactory;

    protected $table = 'office_user';

    // Nombre de la llave primaria
    protected $primaryKey = ['office_id', 'user_id'];

    // Define si los IDs son autoincrementales
    public $incrementing = false;

    // Indica los tipos de datos de las llaves primarias
    protected $keyType = ['integer', 'integer'];

    // Indica si se debe registrar la fecha de creación y actualización
    public $timestamps = false;

    // Relación muchos a muchos con la tabla users
    public function users()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    // Relación muchos a muchos con la tabla offices
    public function offices()
    {
        return $this->belongsTo(Office::class, 'office_id');
    }
}
