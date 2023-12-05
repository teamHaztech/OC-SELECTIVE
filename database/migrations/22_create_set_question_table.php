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
        Schema::create('set_question', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('q_id')->nullable();
            $table->foreign('q_id')->references('id')->on('question')->onDelete('cascade');
            $table->unsignedBigInteger('set_id')->index();
            $table->foreign('set_id')->references('id')->on('tspc_set')->onDelete('cascade');
            // $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('set_question');
    }
};
