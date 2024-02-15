<?php

namespace Database\Seeders;

use App\Models\OfficeUser;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class OfficeUserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //
        OfficeUser::create([
            'office_id' => 1,
            'user_id' => 1,
        ]);
        OfficeUser::create([
            'office_id' => 3,
            'user_id' => 1,
        ]);
    }
}
