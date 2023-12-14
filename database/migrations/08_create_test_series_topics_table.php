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
        Schema::disableForeignKeyConstraints();

        Schema::create('test_series_topics', function (Blueprint $table) {
            $table->id();
            $table->string('t_name',40);
            $table->string('topic',40)->nullable();
            $table->unsignedBigInteger('tsc_id')->index();
            $table->foreign('tsc_id')->references('id')->on('test_series_categories')->onDelete('cascade');
            $table->tinyInteger('status')->default('1');
            $table->tinyInteger('nv_topic')->default('0');
            $table->unsignedBigInteger('ts_id')->index();
            $table->foreign('ts_id')->references('id')->on('test_series')->onDelete('cascade');
        });

        Schema::enableForeignKeyConstraints();
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('test_series_topics');
    }
};
