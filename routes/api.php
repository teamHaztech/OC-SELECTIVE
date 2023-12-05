<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::post('/imageApi', function(request $request) {

    $path = public_path($request->path);
    // echo $path;
    if (!file_exists($path)) {
        abort(404);
    }

    return response()->file($path);
});
Route::get('/optionImages/{filename}', function($filename) {

    $path = public_path('NVImages/oImage/' . $filename);
    // echo $path;
    if (!file_exists($path)) {
        abort(404);
    }

    return response()->file($path);
});
Route::get('/', function () {

    return response([
        "message"=>"working"
    ]);
});
// require __DIR__.'\adminApi.php';
// require __DIR__.'\userApi.php';

require __DIR__ . DIRECTORY_SEPARATOR . 'adminApi.php';
require __DIR__ . DIRECTORY_SEPARATOR . 'userApi.php';
