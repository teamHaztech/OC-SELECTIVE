<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Relations\HasMany;
use App\Models\QuestionImage;

class Question extends Model
{
    use HasFactory;
    protected $table = 'question';
    public $timestamps = false;
    protected $fillable = [
        'question',
        'option_1',
        'option_2',
        'option_3',
        'option_4',
        'option_5',
        'option_6',
        'option_7',
        'option_8',

        'correct_option',
        'explanation',
        'tst_id',
        'marks',
        'status',
        'nvq'
    ];
    protected $casts = [
        'id' => 'integer',
        'tst_id' => 'integer',
        'status' => 'integer',
        'marks' => 'integer',
    ];

    protected function correctOption(): Attribute
    {
        return Attribute::make(
            set: fn($value) => match (strtolower($value)) {
                // dd($value),
                'a' => 1,
                'b' => 2,
                'c' => 3,
                'd' => 4,
                'e' => 1,
                'f' => 2,
                'g' => 3,
                'h' => 4,
                default => $value
            }
        );
    }
    protected function option1(): Attribute
    {
        return Attribute::make(
            set: fn(string $value) => rtrim($value, ',') ?? null

        );
    }
    protected function getCorrectOptionAttribute($value)
    {
        return match ((int) $value) {
            1 => 'A',
            2 => 'B',
            3 => 'C',
            4 => 'D',
            5 => 'E',
            6 => 'F',
            7 => 'G',
            8 => 'H',
            default => $value
        };
    }


    protected function option2(): Attribute
    {
        return Attribute::make(
            set: fn(string $value) => rtrim($value, ',') ?? null
        );
    }
    // protected function option3(): Attribute
    // {
    //     return Attribute::make(
    //         set: fn(string $value) => rtrim($value, ',') ?? null
    //     );
    // }

    // protected function option4(): Attribute
    // {
    //     return Attribute::make(
    //         set: fn(string $value) => rtrim($value, ',') ?? null
    //     );
    // }

    public function questionImage()
    {
        return $this->HasMany(QuestionImage::class, 'q_id', 'id');
    }
    public function extraFields()
    {
        return $this->hasOne(ExtraQuestionField::class, 'q_id', 'id');
    }

    public function qTopic()
    {
        return $this->belongsTo(TestSeriesTopics::class, 'tst_id', 'id');
    }

    public function sets()
    {
        return $this->belongsTo(TSPCSet::class, 'set_id', 'id');
    }
}
