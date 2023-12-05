<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class UserTestStatus extends Model
{
    use HasFactory;

    protected $table = 'user_test_status';
    public $timestamps = false;
    protected $fillable = [
        'q_id',
        'status_id',
        'test_answer',
        'uts_id',
        'test_time',
        'marks'

    ];

    protected $casts = [
        'id' => 'integer',
        'q_id' => 'integer',
        'status_id' => 'integer',
        'marks' => 'integer',
        'uts_id' => 'integer',
    ];

    protected function getTestAnswerAttribute($value)
    {
        return match ((int) $value) {
            1 => 'A',
            2 => 'B',
            3 => 'C',
            4 => 'D',
            default => $value
        };
    }

    protected function setTestAnswerAttribute($value)
    {
        dd($value);
        $this->attributes['test_answer'] = match (strtolower($value)) {
            'a' => 1,
            'b' => 2,
            'c' => 3,
            'd' => 4,
            default => $value,
        };
    }
    // public function save(array $options = [])
    // {
    //     dd('Save method called'); // Add this line for debugging
    //     parent::save($options);
    // }
    public function questions(): BelongsTo
    {
        return $this->belongsTo(Question::class, 'q_id', 'id')->with(['questionImage','extraFields']);
    }
    public function UserTestSeries(): BelongsTo
    {
        return $this->belongsTo(UserTestSeries::class, 'uts_id', 'id');
    }
}
