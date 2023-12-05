<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\TestSeriesPurchases>
 */
class TestSeriesPurchasesFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'user_id'=>rand(1,2),
            'tsp_id'=>rand(1,2),
            'valid_from'=>fake()->date('d-m-Y',now()),
            'valid_till'=>fake()->date('d-m-Y',now()),
        ];
    }
}
