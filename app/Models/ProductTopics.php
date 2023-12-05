<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductTopics extends Model
{
    use HasFactory;
    public $timestamps = false;
    protected $table = 'product_topics';

    protected $fillable =[
        'tsp_id' ,
        't_id' ,

    ];


    protected $casts = [
        'id'=>'integer',
        'tsp_id' => 'integer',
        't_id' => 'integer',
      ];
}
