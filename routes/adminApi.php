<?php


use App\Http\Controllers\ProductController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AdminAuthController;
use App\Http\Controllers\AdminController;


Route::post('/admin/login', [AdminAuthController::class, 'login']);
Route::post('/test-image-upload', [AdminController::class, 'saveImage']);
Route::group(['prefix' => 'admin', 'middleware' => ['jwt.role:admin', 'jwt.auth']], function () {
    //Auth
    Route::post('/logout', [AdminAuthController::class, 'logout']);
    Route::get('/user', [AdminAuthController::class, 'user']);

    //product
    Route::get('/show-product-details/{p_id}', [AdminController::class, 'showProductDetails']);
    Route::post('/add-test-series-product', [AdminController::class, 'addProduct']);
    Route::post('/update-product-status/{p_id}', [AdminController::class, 'productStatus']);
    Route::post('/add-test-series-topics', [AdminController::class, 'addTSTopic']);
    Route::post('/update-test-series-product/{p_id}', [AdminController::class, 'updateProduct']);
    Route::delete('/delete-product/{p_id}', [AdminController::class, 'deleteProduct']);
    Route::get('/show-product/{ts_id}', [ProductController::class, 'showAdminProduct']);
    Route::get('/get-test-series', [ProductController::class, 'getAdminTestSeries']);

    //topic
    Route::get('/show-topics/{tsc_id}/{ts_id}', [AdminController::class, 'showTopics']);
    Route::get('/show-topics-details/{tst_id}', [AdminController::class, 'showTopicsDetails']);
    Route::get('/check-topic/{tst_id}', [AdminController::class, 'topicCheck']);
    Route::post('/add-test-series-product-topics', [AdminController::class, 'addTSProductTopic']);
    Route::post('/show-set-topics', [AdminController::class, 'showSetTopics']);
    Route::put('/update-test-series-topics/{tst_id}', [AdminController::class, 'updateTSTopic']);
    Route::delete('/delete-topic/{tst_id}', [AdminController::class, 'deleteTopic']);
    Route::get('/get-test-series-topics/{id}', [ProductController::class, 'getTestSeriesTopics']);
    Route::get('/get-topic-question/{tst_id}', [AdminController::class, 'getTopicQuestion']);
    Route::get('/get-reading-topic', [AdminController::class, 'getReadingTopic']);
    Route::post('/add-reading-topic', [AdminController::class, 'addReadingTopic']);
    Route::post('/add-reading-question', [AdminController::class, 'addReadingQuestion']);
    Route::get('/get-reading-question/{tst_id}', [AdminController::class, 'getReadingQuestion']);
    Route::put('/update-reading-question', [AdminController::class, 'updateReadingQuestion']);
    Route::get('/get-reading-question-id/{q_id}', [AdminController::class, 'getQuestionWithId']);
    Route::put('/update-reading-question-id/{q_id}', [AdminController::class, 'updateQuestionWithId']);

    //set
    Route::delete('/delete-set/{set_id}', [AdminController::class, 'deleteSet']);
    Route::post('/update-set-status/{set_id}', [AdminController::class, 'setStatus']);
    Route::get('/check-set/{set_id}', [AdminController::class, 'setCheck']);
    Route::get('/get-set-question/{set_id}', [AdminController::class, 'getSetQuestion']);
    Route::put('/update-test-series-product-topics', [AdminController::class, 'updateTSProductTopic']);
    Route::get('/get-set-topic/{set_id}', [AdminController::class, 'getSetTopic']);

    //product
    Route::post('/image-upload', [AdminController::class, 'imageUpload']);
    Route::post('/add-nv-question', [AdminController::class, 'addNVTSTopic']);
    Route::get('/get-image/{tsc_id}', [AdminController::class, 'getImage']);

    //student
    Route::get('/show-details/{ts_id}', [AdminController::class, 'showDetails']);
    Route::get('/show-all-student-details', [AdminController::class, 'showAllStudentDetails']);
    Route::get('/show-student-details/{user_id}', [AdminController::class, 'showStudentDetails']);
    Route::get('/get-user-all-result/{user_id}', [AdminController::class, 'get_user_all_result']);
    Route::post('/delete-image', [AdminController::class, 'deleteImage']);
});
