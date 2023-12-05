<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ReadingQuestion extends Model
{
    use HasFactory;
    public $timestamps = false;
    protected $table = 'reading_question';

    protected $fillable = [
        'question',
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
