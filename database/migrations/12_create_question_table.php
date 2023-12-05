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
        Schema::create('question', function (Blueprint $table) {
            $table->id();
            $table->mediumText('question');
            $table->string('option_1',255);
            $table->string('option_2',255);
            $table->string('option_3',255);
            $table->string('option_4',255);
            $table->string('option_5',255)->nullable();
            $table->string('correct_option',11);
            $table->mediumText('explanation')->nullable();
            $table->unsignedBigInteger('tst_id')->index();
            $table->foreign('tst_id')->references('id')->on('test_series_topics')->onDelete('cascade');
            $table->string('marks')->nullable();
            $table->tinyInteger('nvq')->default(0);
            $table->tinyInteger('status')->default(1);
            // $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('verbal_question');
    }
};
