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
        Schema::create('ts_product_category', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('tsp_id')->index();
            $table->foreign('tsp_id')->references('id')->on('test_series_product')->onDelete('cascade');
            $table->unsignedBigInteger('tsc_id')->index();
            $table->foreign('tsc_id')->references('id')->on('test_series_categories')->onDelete('cascade');
            $table->integer('total_set')->nullable();
            // $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('ts_product_category');
    }
};
