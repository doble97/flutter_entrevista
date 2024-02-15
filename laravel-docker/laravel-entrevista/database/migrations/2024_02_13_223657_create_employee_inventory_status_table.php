<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('employee_inventory_status', function (Blueprint $table) {
            $table->id();
            $table->boolean('status');
            $table->string('comment');
            $table->unsignedBigInteger('user_id');
            $table->unsignedBigInteger('inventory_item_id');
            //foreign key
            $table->foreign('user_id')->references('id')->on('users');
            $table->foreign('inventory_item_id')->references('id')->on('inventory_items');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('employee_inventory_status');
    }
};
