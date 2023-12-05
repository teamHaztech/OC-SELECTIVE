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
        Schema::create('tspc_set', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('tspc_id')->index();
            $table->foreign('tspc_id')->references('id')->on('ts_product_category')->onDelete('cascade');
            $table->integer('set_number')->nullable();
            $table->string('set_name',40);
            $table->tinyInteger('status')->default(1);


        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tspc_set');
    }
};
