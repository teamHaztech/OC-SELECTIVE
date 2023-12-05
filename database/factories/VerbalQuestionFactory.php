<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\VerbalQuestion>
 */
class VerbalQuestionFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $array = array('A','B','C','D');
        $answer=$array[rand(0, 3)];
        return [
            'question'=>fake()->sentence,
            'option_1'=> fake()->numberBetween(10, 50),
            'option_2'=> fake()->numberBetween(10, 50),
            'option_3'=> fake()->numberBetween(10, 50),
            'option_4'=> fake()->numberBetween(10, 50),
            'correct_option'=> $answer,
            'explanation'=>fake()->sentence,
            'tst_id'=> rand(1, 4),
            'marks'=>1,
        ];
    }
}
