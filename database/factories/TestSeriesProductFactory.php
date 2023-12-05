<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\TestSeriesProduct>
 */
class TestSeriesProductFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $r = rand(1, 2);
        $pdes = "It contains maths,logical and reading test";
        if($r==1){
            $pname = "OC TEST - ".rand(1, 5);

        }
        else{
            $pname = "SELECTIVE TEST - ".rand(1, 5);

        }

        return [
            'p_name' =>  $pname,
            'p_description' =>$pdes,
            'p_price' => fake()->numberBetween(20, 150),
            'p_image' => fake()->imageUrl,
            'ts_id' => $r,
            'duration' => 30,
            'test_month_limit'=>rand(2, 3),
            'total_question' => 35,
            'status' => 1
        ];
    }
}
