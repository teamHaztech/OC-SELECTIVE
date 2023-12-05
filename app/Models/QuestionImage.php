<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class QuestionImage extends Model
{
    use HasFactory;
    protected $table = 'question_image';
    public $timestamps = false;
    protected $fillable = [
        'image_url',
        'q_id',
    ];
    protected $casts = [

        'q_id' => 'integer',
    ];
}
