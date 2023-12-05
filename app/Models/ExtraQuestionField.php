<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ExtraQuestionField extends Model
{
    use HasFactory;
    protected $table = 'extra_question_field';
    public $timestamps = false;
    protected $fillable = [
        'conversation',
        'paragraph',
        'q_id',
    ];
    protected $casts = [

        'q_id' => 'integer',
    ];
}
