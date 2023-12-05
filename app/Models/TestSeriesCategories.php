<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
class TestSeriesCategories extends Model
{
    use HasFactory;

    protected $table = "test_series_categories";
    public $timestamps = false;
    protected $fillable=[
        'id'=>'integer',
        'tsc_type',
        'duration'
    ];

    public function topics(){
        return $this->HasMany(TestSeriesTopics::class,'tsc_id','id');
    }

}
