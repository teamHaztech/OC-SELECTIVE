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
        Schema::create('non_verbal_question', function (Blueprint $table) {
            $table->id();
            $table->text('question');
            $table->string('image',100);
            $table->string('option_1',40);
            $table->string('option_2',40);
            $table->string('option_3',40);
            $table->string('option_4',40);
            $table->string('option_5',40)->nullable();
            $table->integer('correct_option');
            $table->text('explanation');
            $table->unsignedBigInteger('tst_id')->index();
            $table->foreign('tst_id')->references('id')->on('test_series_topics')->onDelete('cascade');
            $table->string('marks')->nullable();
            $table->tinyInteger('status')->default(1);
            // $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('non_verbal_question');
    }
};
