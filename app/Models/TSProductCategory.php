<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class TSProductCategory extends Model
{
    use HasFactory;
    public $timestamps = false;
    protected $table = 'ts_product_category';

    protected $fillable = [
       'tsp_id',
       'tsc_id',
       'total_set'
    ];
    protected $casts = [
        'id'=>'integer',
        'tsp_id' => 'integer',
        'tsc_id' => 'integer',
        'total_set'=> 'integer',
    ];

    public function tsPCSet()
    {
        return $this->hasMany(TSPCSet::class, 'tspc_id', 'id');
    }

    public function testSeriesProduct()
    {
        return $this->belongsTo(TestSeriesProduct::class, 'tsp_id', 'id',TestSeriesCategories::class);
    }

    public function tsPCTopics()
    {
        return $this->BelongsToMany(TestSeriesTopics::class, TSPCTopics::class, 'tspc_id','tst_id');
    }

    public function testSeriesCategories()
    {
        return $this->BelongsTo(TestSeriesCategories::class, 'tsc_id','id');
    }

    public function getTestSeriesProduct()
    {
        return $this->belongsTo(TestSeriesProduct::class, 'tsp_id', 'id');
    }
}
