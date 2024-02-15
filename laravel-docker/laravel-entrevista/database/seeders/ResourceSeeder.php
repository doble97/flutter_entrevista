<?php

namespace Database\Seeders;

use App\Models\Resource;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ResourceSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //
        Resource::create([
            'name' => 'extinguishers',
        ]);
        Resource::create([
            'name' => 'hoses',
        ]);
        Resource::create([
            'name' => 'alarms',
        ]);
    }
}
