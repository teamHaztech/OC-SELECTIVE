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
        Schema::disableForeignKeyConstraints();

        Schema::create('test_series_purchases', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('tsp_id')->index();
            $table->foreign('tsp_id')->references('id')->on('test_series_product')->onDelete('cascade');
            $table->unsignedBigInteger('user_id')->index();
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->string('valid_from',50);
            $table->string('valid_till',50);
            $table->string('order_id',200);
            $table->tinyInteger('status')->default('1');
            // $table->timestamps();
        });

        Schema::enableForeignKeyConstraints();
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('test_series_purchases');
    }
};
