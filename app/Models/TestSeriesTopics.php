<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TestSeriesTopics extends Model
{
    use HasFactory;
    protected $table = "test_series_topics";
    public $timestamps = false;
    protected $fillable=[
        't_name',
        'topic',
        'tsc_id',
        'ts_id',
        'nv_topic',
        'status'
    ];

    protected $casts = [
        'id'=>'integer',
        'tsc_id' => 'integer',
        'ts_id' => 'integer',
        'status' => 'integer',
        'nv_topic' => 'integer',
      ];
      public function tsProduct()
      {
          return $this->HasMany(TSProductCategory::class, 'tsc_id', 'id');
      }
      public function getQuestion()
      {
          return $this->HasMany(Question::class, 'tst_id', 'id')->with(['questionImage','extraFields']);
      }

}
