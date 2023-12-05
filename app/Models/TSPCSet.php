<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TSPCSet extends Model
{
    use HasFactory;
    public $timestamps = false;
    protected $table = 'tspc_set';

    protected $fillable = [
       'tspc_id',
    //    'tst_id',
       'set_number',
       'set_name',
       'status'

    ];
    protected $casts = [
        'id'=>'integer',
        'tspc_id' => 'integer',
        // 'tst_id' => 'integer',
        'set_id'=> 'integer',
        'status'=> 'integer',
    ];

    public function tsPCTopic()
    {
        return $this->belongsToMany(TestSeriesTopics::class,TSPCTopics::class, 'tspcs_id', 'tst_id');
    }

    public function getTsPC()
    {
        return $this->belongsTo(TSProductCategory::class, 'tspc_id', 'id');
    }

    public function getTsTopic()
    {
        return $this->hasMany(TSPCTopics::class, 'tspcs_id', 'id');
    }

    public function getSetQuestion()
    {
        return $this->hasMany(SetQuestion::class, 'set_id', 'id');
    }
}
