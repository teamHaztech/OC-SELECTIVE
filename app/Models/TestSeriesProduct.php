<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class TestSeriesProduct extends Model
{
    use HasFactory;
    protected $table = "test_series_product";
    public $timestamps = false;
    protected $fillable = [
        'p_name',
        'p_description',
        'p_price',
        'p_image',
        'ts_id',
        'test_month_limit',
        'total_question',
        'release_date',
        'status'
    ];

    protected $casts = [
        'id'=>'integer',
        'ts_id' => 'integer',
        'total_question' => 'integer',
        'status' => 'integer',
      ];

    public function tsProductCategory()
    {
        return $this->belongsToMany(TestSeriesTopics::class, TSProductCategory::class,'tsp_id', 'tsc_id');
    }

    public function tsPurchases(): HasMany
    {
        return $this->hasMany(TestSeriesPurchases::class, 'tsp_id', 'id');
    }

    public function getTsProductCategory()
    {
        return $this->hasMany(TSProductCategory::class, 'tsp_id', 'id');
    }
    public function getTestSeries()
    {
        return $this->belongsTo(TestSeries::class, 'ts_id', 'id');
    }
}
