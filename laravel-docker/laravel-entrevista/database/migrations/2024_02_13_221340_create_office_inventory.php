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
        Schema::create('office_inventory', function (Blueprint $table) {
            $table->unsignedBigInteger('office_id');
            $table->unsignedBigInteger('inventory_item_id');
            $table->primary(['office_id', 'inventory_item_id']);

            //foraneas
            $table->foreign('office_id')->references('id')->on('offices');
            $table->foreign('inventory_item_id')->references('id')->on('inventory_items');

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('office_inventory');
    }
};
