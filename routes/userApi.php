<?php

use App\Http\Controllers\ProductController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserAuthController;
use App\Http\Controllers\UserController;



Route::post('login',[UserAuthController::class,'login']);
Route::post('register',[UserAuthController::class,'register']);
Route::get('/refresh-token',[UserAuthController::class,'refresh']);
Route::get('/get-product-data/{id?}',[ProductController::class,'showProduct']);
Route::get('/one-product-data/{id}',[ProductController::class,'sProduct']);
Route::get('/get-test-series',[ProductController::class,'getTestSeries']);
Route::post('/send-otp-mail',[UserAuthController::class,'sendEmail']);
Route::post('/password-change2',[UserAuthController::class,'passwordChange2']);
Route::group(['middleware' => ['jwt.role:users','jwt.auth']],function ()
{
    // auth api
    Route::post('/password-change',[UserAuthController::class,'passwordChange']);
    Route::post('/password-check',[UserAuthController::class,'passwordCheck']);
	Route::post('/logout',[UserAuthController::class,'logout']);
    Route::get('/user',[UserAuthController::class,'user']);
    Route::post('/profile-change/{user_id}',[UserAuthController::class,'profileChange']);
    // cart api
    Route::post('/add-to-cart',[ProductController::class,'addCart']);
    Route::get('/get-cart-data/{id}',[ProductController::class,'showCart']);
    Route::get('/remove-from-cart/{id}',[ProductController::class,'removeCart']);

    //Product api
    Route::post('/add-user-purchase',[ProductController::class,'addTSPurchases']);
    Route::get('/get-user-purchases-id',[ProductController::class,'getTSPurchasesId']);
    Route::get('/get-user-purchases/{ts_id}',[ProductController::class,'getTSPurchases']);
    Route::get('/get-user-test-details/{ps_id}',[ProductController::class,'getTSDetails']);
    Route::get('/check-user-purchase-expire/{user_id}',[ProductController::class,'checkUserPurchaseExpire']);
    Route::get('/get-latest-product',[ProductController::class,'getLatestProduct']);

    //user test schedule
    Route::post('/post-user-test-status',[UserController::class,'userTestStatus']);
    Route::get('/generate-question/{id}',[UserController::class,'generateRandomQuestion']);
    Route::post('/update-test-status/{status_id}',[UserController::class,'updateTestStatus']);
    Route::post('/update-test-timer/{id}',[UserController::class,'updateTimer']);
    Route::post('/submit-test/{id}',[UserController::class,'submitTest']);
    Route::get('/get-test-result/{id}',[UserController::class,'getTestResult']);
    Route::get('/get-user-purchases-limit/{user_id}',[UserController::class,'getTSPurchasesLimit']);
    Route::get('/get-remaining-product/{user_id}',[UserController::class,'getRProduct']);

    //User Test Result
    Route::get('/get-user-set-data/{user_id}',[UserController::class,'UserSetData']);
    Route::get('/get-user-all-results/{user_id}/{ts_id}',[UserController::class,'get_user_all_result']);
    Route::get('/get-user-result-limit/{user_id}',[UserController::class,'get_user_result_limit']);
    Route::get('/get-user-result/{uts_id}',[UserController::class,'get_user_result']);
    Route::get('/get-user-set-result/{uts_id}',[UserController::class,'get_user_set_result']);
    Route::post('/get-topic-question',[UserController::class,'getTopicQuestion']);
    Route::get('/get-marks-Distribution/{uts_id}',[UserController::class,'get_marks_Distribution']);
    Route::get('/get-question-time/{uts_id}',[UserController::class,'get_question_time']);
    Route::get('/get-user-rank/{set_id}/{user_id}',[UserController::class,'get_user_rank']);
    Route::get('/get-percentage-rank/{set_id}/{user_id}',[UserController::class,'get_percentage_rank']);
    Route::get('/get_overAll_percentage_limit/{user_id}',[UserController::class,'get_overAll_percentage_limit']);
    Route::get('/get-user-set-question/{status_id}',[UserController::class,'get_user_set_question']);
});
