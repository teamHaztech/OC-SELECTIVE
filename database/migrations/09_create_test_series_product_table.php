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
        // Schema::disableForeignKeyConstraints();

        Schema::create('test_series_product', function (Blueprint $table) {
            $table->id();
            $table->string('p_name',40);
            $table->text('p_description');
            $table->string('p_price',11);
            $table->string('p_image',100)->nullable();
            $table->unsignedBigInteger('ts_id')->index();
            $table->foreign('ts_id')->references('id')->on('test_series')->onDelete('cascade');
            // $table->unsignedBigInteger('tsc_id')->index();
            // $table->foreign('tsc_id')->references('id')->on('test_series_categories')->onDelete('cascade');
            // $table->integer('duration');
            $table->integer('test_month_limit');
            $table->integer('total_question');
            $table->string('release_date',40)->nullable();
            $table->tinyInteger('status')->default('1');
            // $table->timestamps();
        });
        // Schema::enableForeignKeyConstraints();
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('test_series_product');
    }
};
