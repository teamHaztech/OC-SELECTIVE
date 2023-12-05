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
        Schema::create('user_test_series', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('tsps_id')->index();
            $table->foreign('tsps_id')->references('id')->on('test_series_purchases')->onDelete('cascade');
            $table->unsignedBigInteger('set_id')->index();
            $table->foreign('set_id')->references('id')->on('tspc_set')->onDelete('cascade');
            $table->tinyInteger('complete_status')->default(0);
            $table->string('start_date',40);
            $table->string('end_date',40)->nullable();
            $table->string('time_taken',40)->nullable();
            $table->string('current_timer',40)->nullable();
            $table->integer('percentage')->nullable()->default(0);
            $table->tinyInteger('total_marks')->nullable()->default(0);
            $table->integer('total_answered')->nullable()->default(0);
            $table->bigInteger('q_id')->nullable();
            // $table->foreign('q_id')->references('id')->on('user_test_status')->onDelete('cascade');
            // $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('user_test_series');
    }
};
