<?php

namespace Database\Seeders;

use App\Models\Office;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class OfficeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //
        Office::create([
            'address' => 'Plaza Principal, Ciudad C',
            'client_id' => 1,
        ]);
        Office::create([
            'address' => 'Avenida 456, Ciudad B',
            'client_id' => 1,
        ]);
        Office::create([
            'address' => 'Calle 123, Ciudad A',
            'client_id' => 2,
        ]);
    }
}
