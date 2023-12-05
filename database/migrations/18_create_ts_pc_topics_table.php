<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('ts_pc_topics', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('tspcs_id')->index();
            $table->foreign('tspcs_id')->references('id')->on('tspc_set')->onDelete('cascade');
            $table->unsignedBigInteger('tst_id')->index();
            $table->foreign('tst_id')->references('id')->on('test_series_topics')->onDelete('cascade');
            // $table->integer('set_number')->nullable();
            // $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('ts_pc_topics');
    }
};
