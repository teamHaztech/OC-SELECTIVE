<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class NonVerbalQuestion extends Model
{
    use HasFactory;

    protected $table = 'non_verbal_question';
    public $timestamps = false;
    protected $fillable = [
        'question',
        'image',
        'option_1',
        'option_2',
        'option_3',
        'option_4',
        'option_5',
        'correct_option',
        'explanation',
        'tst_id',
        'marks',
        'status'
    ];
    protected $casts = [
        'id'=>'integer',
        'ts_id' => 'integer',
        'tsc_id' => 'integer',
        'tst_id' => 'integer',
        'status' => 'integer',
        'marks' => 'integer',
    ];
}
