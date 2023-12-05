<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use App\Models\Admin;
use App\Models\TestSeriesPurchases;
use App\Models\TestSeriesTopics;
use App\Models\User;
use App\Models\TestSeries;
use App\Models\TestSeriesCategories;
use App\Models\TestSeriesProduct;
use App\Models\VerbalQuestion;
use Illuminate\Database\Seeder;
use App\Models\TestStatus;
class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        User::factory(1)->create();
        Admin::factory(1)->create();

        $tsc =  TestSeries::factory()->create([
            'test_type' => 'OC',
        ])
        ->create([
            'test_type' => 'Selective',
        ]);

        $tsc = TestSeriesCategories::factory()->create([
            'tsc_type' => 'Maths',
            'duration'=>30
        ])
        ->create([
            'tsc_type' => 'Reading',
            'duration'=>45
        ])
        ->create([
            'tsc_type' => 'Thinking',
            'duration'=>35
        ]);

        // $p = TestSeriesProduct::factory(2)->create();

        TestStatus::query()->create([
            'type' => 'Answered',
        ])
        ->create([
            'type' => 'Not Answered',
        ])
        ->create([
            'type' => 'Not Visited',
        ])
        ->create([
            'type' => 'Marked for Review',
        ])
        ->create([
            'type' => 'Answered & Marked for
            Review',
        ]);

        // TestSeriesPurchases::factory(2)->create();
        // TestSeriesTopics::factory()->create([
        //     't_name'=>'age',
        //     'tsc_id'=>3,
        // ])->create([
        //     't_name'=>'ratio',
        //     'tsc_id'=>3,
        // ])->create([
        //     't_name'=>'averages',
        //     'tsc_id'=>3,
        // ])->create([
        //     't_name'=>'multiple operation',
        //     'tsc_id'=>3,
        // ]);

        // foreach ($p as $key => $value) {
        //     $value->tsProductCategory()->sync([1,2,3]);
        // }



        // VerbalQuestion::factory(200)->create();



        // \App\Models\Admin::factory()->create([
        //     'name' => 'Test admin',
        //     'email' => 'admin@example.com',
        // ]);
    }
}
