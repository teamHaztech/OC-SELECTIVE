<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ImagesNames extends Model
{
    use HasFactory;

    protected $table = 'images_names';
    public $timestamps = false;
    protected $fillable = [
        'image_id',
        'image_name',
    ];

    public function images()
    {
        return $this->belongsTo(Images::class, 'image_id', 'id');
    }
}
