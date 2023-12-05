<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TestStatus extends Model
{
    public $timestamps = false;
    use HasFactory;
    protected $table='test_status';

    protected $fillable=[
        'id'=>'integer',
        'type'
    ];
}
