<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TSPCTopics extends Model
{
    use HasFactory;
    public $timestamps = false;
    protected $table = 'ts_pc_topics';

    protected $fillable = [
       'tsps_id',
       'tst_id',
    //    'set_number'
    ];
    protected $casts = [
        'id'=>'integer',
        'tsps_id' => 'integer',
        'tst_id' => 'integer',
        // 'set_number'=> 'integer',
    ];


    public function tsTopic(){
        return $this->belongsTo(TestSeriesTopics::class, 'tst_id', 'id');
    }
}

