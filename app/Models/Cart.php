<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Cart extends Model
{
    use HasFactory;
    public $timestamps = false;
    protected $table = 'cart';

    protected $fillable = [
        'tsp_id', 'user_id', 'password',
    ];

    protected $casts = [
        'id'=>'integer',
        'tsp_id' => 'integer',
        'user_id' => 'integer',
      ];
    public function tsProduct(): BelongsTo
{
    return $this->belongsTo(TestSeriesProduct::class, 'tsp_id', 'id');
}

}
