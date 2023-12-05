<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TestSeries extends Model
{
    use HasFactory;
    protected $table = "test_series";
    public $timestamps = false;
    protected $fillable=[
        'id'=>'integer',
        'test_type'
    ];
}
