<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\ExtraQuestionField;
use App\Models\Images;
use App\Models\ImagesNames;
use App\Models\QuestionImage;
use App\Models\ReadingQuestion;
use App\Models\SetQuestion;
use App\Models\TestSeries;
use App\Models\TestSeriesCategories;
use App\Models\TestSeriesProduct;
use App\Models\TestSeriesPurchases;
use App\Models\TestSeriesTopics;
use App\Models\TSPCSet;
use App\Models\TSPCTopics;
use App\Models\TSProductCategory;
use App\Models\User;
use App\Models\Question;
use App\Models\UserTestSeries;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use stdClass;

class AdminController extends Controller
{

    private function get_Topic_detail($tsc_id, $ts_id)
    {
        $time = 0;
        $question_number = 0;
        switch ($tsc_id) {
            case 1:
                if ($ts_id == 1) {
                    $time = 40;
                    $question_number = 35;
                } else {
                    $time = 40;
                    $question_number = 30;
                }
                break;

            case 2:
                if ($ts_id == 1) {
                    $time = 30;
                    $question_number = 25;
                } else {
                    $time = 40;
                    $question_number = 35;
                }
                break;
            case 3:
                if ($ts_id == 1) {
                    $time = 30;
                    $question_number = 30;
                } else {
                    $time = 40;
                    $question_number = 40;
                }
                break;
        }

        return [
            "time" => $time,
            "question_number" => $question_number
        ];


    }
    private function get_question_index($userTestStatuses)
    {

        $index = [];

        $userTestStatuses = $userTestStatuses->map(function ($item, $key) {
            if (isset($item->extraFields)) {
                $item->conversation = $item->extraFields->conversation;
                $item->paragraph = $item->extraFields->paragraph;
            }

            unset($item->extraFields);
            return $item;
        });
        foreach ($userTestStatuses as $key => $value) {
            if ($value->extraFields) {
                $index[] = $value->extraFields->paragraph;
            }
            unset($value->extraFields);
        }

        $counts = [];
        $c = [];

        foreach ($index as $number) {
            if (array_key_exists($number, $counts)) {
                $counts[$number]++;
            } else {
                $counts[$number] = 1;
                //  $c ++;
            }

        }

        foreach ($counts as $key => $value) {
            $c[] = $value;
        }

        return [
            "index" => $c,
            "test_data" => $userTestStatuses
        ];


    }
    private function questionGenerator($topic, $cate_id, $ts_id)
    {

        $selectedQuestions = [];
        $temp_selectedQuestions = [];
        if ($cate_id == 3) {
            $totalQuestions = $this->get_Topic_detail($cate_id, $ts_id)["question_number"];

            $count = (int) ceil($totalQuestions / count($topic));
            $temp_c = 1;

            foreach ($topic as $key => $value) {

                $questions = Question::where('tst_id', $value)->get();

                if (count($questions) < $count) {
                    $c = (count($topic) - $temp_c) !== 0 ? (count($topic) - $temp_c) : 1;
                    // echo   $c. " ";
                    $count = (int) ceil($totalQuestions / $c);
                    $temp_c++;
                }
            }
            // $count = 100;
            foreach ($topic as $key => $value) {
                $questions = Question::where('tst_id', $value)->get();

                for ($i = 1; $i <= $count && count($questions) >= $i; $i++) {
                    $randomIndex = rand(0, count($questions) - $i);
                    //    echo(count($questions) - $i);
                    $temp = $questions[count($questions) - $i];

                    $questions[count($questions) - $i] = $questions[$randomIndex];
                    $questions[$randomIndex] = $temp;

                    $temp_selectedQuestions[] = $questions[count($questions) - $i];
                }

            }

            // echo $count;

            for ($i = count($temp_selectedQuestions) - 1; $i >= 0 && count($selectedQuestions) < $totalQuestions; $i--) {

                $randomIndex = rand(0, $i);

                $temp = $temp_selectedQuestions[$i];
                $temp_selectedQuestions[$i] = $temp_selectedQuestions[$randomIndex];
                $temp_selectedQuestions[$randomIndex] = $temp;
                $selectedQuestions[] = $temp_selectedQuestions[$i];
            }
            // return [count( $selectedQuestions)];
        } else {
            $nv_topic = TestSeriesTopics::whereIn('id', $topic)
                ->where('nv_topic', 1)->get();

            if (count($nv_topic) == 0) {
                $totalQuestions = $this->get_Topic_detail($cate_id, $ts_id)["question_number"];
                ;
                $count = (int) ceil($totalQuestions / count($topic));
                $temp_c = 1;

                foreach ($topic as $key => $value) {
                    $questions = Question::where('tst_id', $value)->get();
                    $c = (count($topic) - $temp_c) !== 0 ? (count($topic) - $temp_c) : 1;
                    if (count($questions) < $count) {
                        $count = (int) ceil($totalQuestions / $c);
                        $temp_c++;
                    }
                }
                foreach ($topic as $key => $value) {
                    $questions = Question::where('tst_id', $value)->get();


                    for ($i = 1; $i <= $count && $i <= count($questions); $i++) {
                        $randomIndex = rand(0, count($questions) - $i);
                        $temp = $questions[count($questions) - $i];
                        $questions[count($questions) - $i] = $questions[$randomIndex];
                        $questions[$randomIndex] = $temp;
                        $temp_selectedQuestions[] = $questions[count($questions) - $i];
                    }
                }

                for ($i = count($temp_selectedQuestions) - 1; $i >= 0 && count($selectedQuestions) < $totalQuestions; $i--) {
                    $randomIndex = rand(0, $i);
                    $temp = $temp_selectedQuestions[$i];
                    $temp_selectedQuestions[$i] = $temp_selectedQuestions[$randomIndex];
                    $temp_selectedQuestions[$randomIndex] = $temp;
                    $selectedQuestions[] = $temp_selectedQuestions[$i];
                }
                // dd(count($selectedQuestions), $count, count($topic));
            } else {
                $nv_topic = $nv_topic->map(function ($value) {
                    return $value['id'];
                })->toArray();

                // $totalQuestions = 30;
                $v_topic = array_filter($topic, function ($item) use ($nv_topic) {
                    return !in_array($item, $nv_topic);
                });
                $nv_topic = array_filter($topic, function ($item) use ($nv_topic) {
                    return in_array($item, $nv_topic);
                });
                $totalQuestions = $this->get_Topic_detail($cate_id, $ts_id)["question_number"];
                if (count($v_topic) == 0) {
                    $count = round($totalQuestions / count($nv_topic));
                    foreach ($nv_topic as $key => $value) {
                        $questions = Question::where('tst_id', $value)->get();
                        for ($i = 1; $i <= $count && $i <= count($questions); $i++) {
                            $randomIndex = rand(0, count($questions) - $i);
                            $temp = $questions[count($questions) - $i];
                            $questions[count($questions) - $i] = $questions[$randomIndex];
                            $questions[$randomIndex] = $temp;
                            $temp_selectedQuestions[] = $questions[count($questions) - $i];
                        }
                    }
                } else {

                    $count = ceil(($totalQuestions - 5) / count($v_topic));

                    $temp_c = 1;
                    foreach ($topic as $key => $value) {
                        $questions = Question::where('tst_id', $value)->get();
                        if (count($questions) < $count) {
                            $c = (count($v_topic) - $temp_c) !== 0 ? (count($v_topic) - $temp_c) : 1;
                            $count = (int) round($totalQuestions / $c);
                            $temp_c++;
                        }
                    }
                    foreach ($v_topic as $key => $value) {
                        $questions = Question::where('tst_id', $value)->get();
                        for ($i = 1; $i <= $count && $i <= count($questions); $i++) {
                            $randomIndex = rand(0, count($questions) - $i);

                            $temp = $questions[count($questions) - $i];

                            $questions[count($questions) - $i] = $questions[$randomIndex];
                            $questions[$randomIndex] = $temp;
                            $temp_selectedQuestions[] = $questions[count($questions) - $i];
                        }
                    }
                //    echo count($temp_selectedQuestions);
                    $count = ceil(5 / count($nv_topic));
                    foreach ($nv_topic as $key => $value) {
                        $questions = Question::where('tst_id', $value)->get();
                        for ($i = 1; $i <= $count && $i <= count($questions); $i++) {
                            $randomIndex = rand(0, count($questions) - $i);

                            $temp = $questions[count($questions) - $i];

                            $questions[count($questions) - $i] = $questions[$randomIndex];
                            $questions[$randomIndex] = $temp;
                            $temp_selectedQuestions[] = $questions[count($questions) - $i];
                        }
                    }
                }



                for ($i = count($temp_selectedQuestions) - 1; $i >= 0 && count($selectedQuestions) < $totalQuestions; $i--) {
                    $randomIndex = rand(0, $i);
                    $temp = $temp_selectedQuestions[$i];
                    $temp_selectedQuestions[$i] = $temp_selectedQuestions[$randomIndex];
                    $temp_selectedQuestions[$randomIndex] = $temp;
                    $selectedQuestions[] = $temp_selectedQuestions[$i];
                }

            }
        }


        return $selectedQuestions;

    }

    private function pCSet($tSPC)
    {
        $categories = [];
        foreach ($tSPC as $key => $value) {
            $categories[] = $value->TestSeriesCategories;
            $set = [];
            foreach ($value->tsPCSet as $key2 => $value2) {
                $set[] = $value2;
                $topics = [];
                $questions = [];
                foreach ($value2->getTsTopic as $key3 => $value3) {
                    $topics[] = $value3->tsTopic;
                }

                $value2->getSetQuestion = $value2->getSetQuestion->map(function ($value) {

                    return $value->getQuestions;
                });
                //  = $c['test_data'];
                // foreach ($value2->getSetQuestion as $key3 => $value3) {
                $c = $this->get_question_index($value2->getSetQuestion);


                $set[$key2]->topics = $topics;
                $set[$key2]->questions = $c['test_data'];
                $set[$key2]->index = $c['index'];
                unset($value2->getTsTopic);
                unset($value2->getSetQuestion);
            }
            $categories[$key]->sets = $set;
        }
        return $categories;
    }

    public function showDetails($ts_id)
    {

        $users = User::count();
        $product = TestSeriesProduct::where('ts_id', $ts_id)->count();
        $purchase = TestSeriesPurchases::whereHas('tsProduct', function ($query) use ($ts_id) {
            $query->where('ts_id', $ts_id);
        })->count();
        $topic = TestSeriesTopics::where('ts_id', $ts_id)->count();
        // $purchase = TestSeriesPurchases::count();
        return response()->json([
            'user_count' => $users,
            'product_count' => $product,
            'purchase_count' => $purchase,
            'topic_count' => $topic
        ], 200);


    }
    public function showAllStudentDetails(Request $request)
    {

        $users = User::get(['name', 'email', 'id', 'phone', 'DOB']);
        return response()->json([
            'user' => $users,
        ], 200);


    }
    public function showStudentDetails($user_id)
    {
        $product = TestSeriesPurchases::query()
            ->where('status', 1)
            ->where('user_id', $user_id)
            ->with('tsProduct.getTsProductCategory.tsPCSet')
            ->get();
        $total_test = 0;
        $complete_test = 0;
        $incomplete_test = 0;
        $Remaining_test = 0;
        foreach ($product as $key => $value) {
            $temp_set = $value->tsProduct->getTsProductCategory;
            foreach ($temp_set as $key => $value2) {
                $total_test += count($value2->tsPCSet);
                // foreach ($value2->tsPCSet as $key => $value3) {
                // $temp_CStatus = array_column($test_data->toArray(), 'complete_status');
                // }
            }
            $test_data = UserTestSeries::
                where('tsps_id', $value->id)
                ->first();
            if ($test_data) {
                $complete_test += $test_data->complete_status == 1;
                $incomplete_test += $test_data->complete_status == 0;
            }
        }
        $Remaining_test += $total_test - ($incomplete_test + $complete_test);

        $users = User::where('id', $user_id)->first();

        return response()->json([
            'user' => $users,
            'total_test' => $total_test,
            'complete_test' => $complete_test,
            'incomplete_test' => $incomplete_test,
            'Remaining_test' => $Remaining_test,
        ], 200);


    }

    public function get_user_all_result($user_id)
    {
        $user_RA = UserTestSeries::query()
            ->where('complete_status', 1)
            ->whereHas('userPurchases', function ($query) use ($user_id) {
                $query->where('user_id', $user_id);
            })
            ->with('userPurchases.tsProduct')
            ->with('getTSSet')
            ->get();
        // return $user_RA;
        $user_RA = $user_RA->map(function ($item) {
            $item->set_name = $item->getTSSet->set_name;
            $item->package_name = $item->userPurchases->tsProduct->p_name;
            unset($item->getTSSet, $item->userPurchases);
            return $item;
        });

        return response()->json([
            'all_results' => $user_RA,

        ], 200);
    }

    public function addProduct(Request $request)
    {
        // $data = $request->all();
        // \Log::info('add Received data:', $data);
        // return $data;
        $category = $request->tsc_id;
        $data = $request->except(['id', 'tsc_id']);

        foreach ($category as $item) {

            $c = TestSeriesCategories::query()
                ->where('id', $item)
                ->first();

            $topics = TestSeriesTopics::where('ts_id', $data['ts_id'])
                ->where('tsc_id', $item)
                ->where('status', 1)
                ->get();

            if (count($topics) == 0) {
                return response()->json([
                    'message' => 'topics is not available',
                    "tsc_type" => $c->tsc_type,
                    'ts_id' => $data['ts_id']
                ], 403);
            }
        }


        if (!$request->release_date) {
            $data['release_date'] = date('Y-m-d');
        }
        // return $data;
        $data['total_question'] = 35;

        // return $data;
        if ($request->hasFile('p_image')) {
            $file = $request->file('p_image');

            // Validate the uploaded file
            if ($file->isValid()) {
                // Generate a unique filename
                // $imageFiles = glob(public_path('/images/product-*.*'));
                // $count = count($imageFiles) + 1;
                $last = TestSeriesProduct::orderBy('id', 'desc')->first();
                $filename = "product-" . ($last ? ($last->id + 1) : 1) . '.' . $file->getClientOriginalExtension();
                // Move the file to the desired location
                $file->move(public_path('/images'), $filename);
                // Update the data with the stored image path
                $data['p_image'] = "/images/" . $filename;
            } else {

                return response()->json(['error' => 'File upload failed'], 400);
            }
        }


        $tsp = TestSeriesProduct::updateOrCreate(['id' => $request->id ? $request->id : null], $data);

        if ($tsp) {

            $tsp->tsProductCategory()->sync($category);
            $response = [];

            $product = TSProductCategory::where('tsp_id', $tsp->id)->get();

            $tspc = new stdClass();
            foreach ($product as $item) {
                $name = TestSeriesCategories::query()
                    ->where('id', $item->tsc_id)
                    ->first('tsc_type');

                $tspc->{$name->tsc_type} = $item->id;
            }
            foreach ($category as $item) {
                // return $item;

                $response[] = TestSeriesCategories::query()
                    ->where('id', $item)
                    ->whereHas('topics', function ($query) use ($data) {
                        $query->where('ts_id', $data['ts_id'])
                            ->where('status', 1);
                    })
                    ->with('topics')
                    ->first();

            }

            return response()->json([
                'message' => 'Added Successfully',
                'data' => $response,
                'tspc' => $tspc
            ], 200);
        }

        // $tsc = $tsp->productTopics()->sync($request->tst_id);

        return response()->json([
            'message' => 'Added Successfully'
        ], 200);
    }

    public function updateProduct(Request $request, $p_id)
    {
        $data = $request->all();
        //  \Log::info('Received data:', $data);
        //  return  $request->hasFile('p_image');
        // $data = $request->p_name;

        if ($request->hasFile('p_image')) {

            $file = $request->file('p_image');
            $tsp = TestSeriesProduct::where('id', $p_id)->first();
            // if (File::exists(public_path($tsp->p_image))) {
            //     File::delete(public_path($tsp->p_image));
            // }
            // Validate the uploaded file
            if ($file->isValid()) {
                // $last = TestSeriesProduct::where('id', $p_id)->first();
                if (File::exists(public_path($tsp->p_image))) {
                    File::delete(public_path($tsp->p_image));
                }

                $filename = "product-" . $tsp->id . '.' . $file->getClientOriginalExtension();

                $file->move(public_path('/images'), $filename);

                $data['p_image'] = "/images/" . $filename;
            } else {
                return response()->json(['error' => 'File upload failed'], 400);
            }

        }

        TestSeriesProduct::where('id', $p_id)->update($data);
        $tsp = TestSeriesProduct::where('id', $p_id)->first();
        $current_date = date('Y-m-d');
        $product = TestSeriesProduct::where('id', $p_id)
        ->where('release_date', "<=", $current_date)
        ->whereHas('getTsProductCategory', function ($query) {
            $query->whereNot('total_set', null);
        })
        ->first();
        $tsp->release_status = !!$product;
        return response()->json([
            'product_detail' => $tsp,
            'message' => 'Product Updated Successfully',
        ], 200);
    }

    public function addTSProductTopic(Request $request)
    {
        // return $request->input();
        $q_data = [];

        foreach ($request->data as $item) {
            // $q_data = new stdClass();
            $selectedQuestions = [];

            $questions = Question::whereIn('tst_id', $item['tst_id'])
                ->get();


            // for($i=0; $i<=$count; $i++){


            // $selectedQuestions = $selectedQuestions->map(function($question,$key) {
            //     $randomIndex = rand(0, count($selectedQuestions)-$key);
            //     $temp = $questions[$key];
            //     $questions[$key] = $questions[$randomIndex];
            //     $questions[$randomIndex] = $temp;
            //     $selectedQuestions[] = $questions[$key];
            //   });
            // for ($i = count($questions) - 1; $i>0; $i--) {
            //     $randomIndex = rand(0, $i);
            //     $temp = $questions[$i];
            //     $questions[$i] = $questions[$randomIndex];
            //     $questions[$randomIndex] = $temp;
            //     $selectedQuestions[] = $questions[$i];
            // }

            // }

            $ts_id = TSProductCategory::query()
                ->where('id', $item['tspc_id'])
                ->with('testSeriesCategories')
                ->with('testSeriesProduct.getTestSeries')
                ->first();
            $tst = TestSeriesTopics::whereIn('id', $item['tst_id'])->get();

            $tspc = TSProductCategory::query()
                ->where('id', $item['tspc_id'])
                ->with('getTestSeriesProduct')
                ->first();
            // return  $tspc;
            $cate = TestSeriesCategories::whereHas('topics', function ($query) use ($item) {
                $query->where('id', $item['tst_id']);
            })
                ->first();

            // return $cate;
            if ($cate->id == 2) {
                $selectedQuestions = $questions;
            } else {

                $selectedQuestions = $this->questionGenerator($item['tst_id'], $cate->id, $tspc->getTestSeriesProduct->ts_id);

            }
            // return  count($selectedQuestions);
            $q_data[] = [
                $tspc->testSeriesCategories->tsc_type => $selectedQuestions
            ];
            $sets = TSPCSet::where('tspc_id', $item['tspc_id'])->get();
            $setCount = count($sets) + 1;
            // return $sets ;
            $tsps = TSPCSet::query()
                ->create([
                    'tspc_id' => $tspc->id,
                    'set_number' => $setCount,
                    'set_name' => $tspc->testSeriesProduct->getTestSeries->test_type . " " . $tspc->testSeriesCategories->tsc_type . ' set - ' . $setCount
                ]);

            $tsps->tsPCTopic()->sync($item['tst_id']);

            foreach ($selectedQuestions as $value) {
                SetQuestion::query()
                    ->create([
                        'q_id' => $value->id,
                        'set_id' => $tsps->id
                    ]);
            }

            $tspc = TSProductCategory::query()
                ->where('id', $item['tspc_id'])
                ->with('testSeriesCategories')
                ->with('testSeriesProduct.getTestSeries')
                ->first();

            $temp = $this->pCSet([$tspc]);
            $categories[] = $temp[0];

            TSProductCategory::query()
                ->where('id', $tspc->id)
                ->update([
                    'total_set' => $request->total_set
                ]);
        }


        // $tsc =  $tsp->productTopics()->sync($request->tst_id);

        return response()->json([
            'message' => 'Successfully TSProductTopic added',
            'categories_data' => $categories
        ], 200);
    }
    public function updateTSProductTopic(Request $request)
    {
        $item = $request->data;

        $current_date = date('Y-m-d');
        $set = TSPCSet::where('id', $item['set_id'])
            ->with('getTsPC.testSeriesProduct.tsPurchases')
            ->first();

        $total_purchase = count($set->getTsPC->testSeriesProduct->tsPurchases);

        if ($total_purchase != 0) {
            return response()->json([
                'Message' => 'Product Already Released (Set)',
            ], 403);
        }

        $set_d = TSPCSet::where('id', $request->data['set_id'])
            ->with(['getTsPC.testSeriesCategories', 'getTsPC.testSeriesProduct',])
            ->first();
        // $questions = Question::whereIn('tst_id', $item['tst_id'])
        //     ->get();

        $selectedQuestions = $this->questionGenerator($item['tst_id'], $set_d->getTsPC->testSeriesCategories->id, $set_d->getTsPC->testSeriesProduct->ts_id);
        // return  count($selectedQuestions);

        // $q_data[] = [
        //     $tspc->testSeriesCategories->tsc_type => $selectedQuestions
        // ];
        $set = TSPCSet::where('id', $item['set_id'])->first();

        // return $item['set_id'] ;

        $set->tsPCTopic()->sync($item['tst_id']);

        SetQuestion::query()->where('set_id', $set->id)->delete();
        foreach ($selectedQuestions as $value) {
            SetQuestion::query()
                // ->where('set_id', $set->id)
                ->create([
                    'set_id' => $set->id,
                    'q_id' => $value->id
                ]);
        }
        $sets = TSPCSet::where('id', $item['set_id'])->with('getTsTopic.tsTopic')->first();

        $tst = TestSeriesProduct::query()
            ->whereHas('getTsProductCategory.tsPCSet', function ($query) use ($item) {

                $query->where('id', $item['set_id']);
            })
            ->with('getTsProductCategory')
            ->first();
        //
        $tst->categories = $this->pCSet($tst->getTsProductCategory);
        // $tsc =  $tsp->productTopics()->sync($request->tst_id);
        unset($tst->getTsProductCategory);
        // return [$item['set_id'], $tst->categories[0]];

        return response()->json([
            'message' => 'Successfully TSProductTopic added',
            'set_data' => $tst->categories,
            // $set_d->getTsPC->testSeriesCategories
        ], 200);
    }
    public function addTSTopic(Request $request)
    {

        $data = $request->except(['question']);
        // return $data;
        if ($data) {
            $tst = TestSeriesTopics::query()
                ->create(
                    $data
                );
        }


        $questions = $request->question;

        if ($request->tsc_id == 3 || $request->tsc_id == 1) {
            foreach ($questions as $key => $item) {
                $item = array_change_key_case($item, CASE_UPPER);
                $ans = preg_replace('/\s+/', ' ', trim($item['ANSWER']));
                $options = [
                    'option_1' => isset($item['OPTIONS']['a']) ? $item['OPTIONS']['a'] : null,
                    'option_2' => isset($item['OPTIONS']['b']) ? $item['OPTIONS']['b'] : null,
                    'option_3' => isset($item['OPTIONS']['c']) ? $item['OPTIONS']['c'] : null,
                    'option_4' => isset($item['OPTIONS']['d']) ? $item['OPTIONS']['d'] : null,
                ];
                $q_data = Question::query()
                    ->create([
                        'question' => $item['QUESTION'],
                        'option_1' => $options['option_1'],
                        'option_2' => $options['option_2'],
                        'option_3' => $options['option_3'],
                        'option_4' => $options['option_4'],
                        'correct_option' => $ans,
                        'explanation' => $item['EXPLANATION'],
                        'tst_id' => $tst->id,
                    ]);
                // RETURN ($item);
                if (array_key_exists("IMAGES", $item)) {
                    foreach ($item['IMAGES'] as $key => $image) {
                        QuestionImage::create([
                            'q_id' => $q_data->id,
                            'image_url' => $image
                        ]);
                    }
                }
                if (array_key_exists("PARAGRAPH", $item) || array_key_exists("CONVERSATION", $item)) {
                    ExtraQuestionField::create([
                        'q_id' => $q_data->id,
                        'paragraph' => isset($item["PARAGRAPH"]) ? $item["PARAGRAPH"] : null,
                        'conversation' => isset($item["CONVERSATION"]) ? $item["CONVERSATION"] : null,
                    ]);

                }
            }
        } elseif ($request->tsc_id == 2) {
            foreach ($questions as $key => $item) {
                $item = array_change_key_case($item, CASE_UPPER);
                $ans = preg_replace('/\s+/', ' ', trim($item['ANSWER']));

                $options = [
                    'option_1' => isset($item['OPTIONS']['a']) ? $item['OPTIONS']['a'] : null,
                    'option_2' => isset($item['OPTIONS']['b']) ? $item['OPTIONS']['b'] : null,
                    'option_3' => isset($item['OPTIONS']['c']) ? $item['OPTIONS']['c'] : null,
                    'option_4' => isset($item['OPTIONS']['d']) ? $item['OPTIONS']['d'] : null,
                ];
                $q_data = Question::query()
                    ->create([
                        'question' => $item['QUESTION'],
                        'option_1' => $options['option_1'],
                        'option_2' => $options['option_2'],
                        'option_3' => $options['option_3'],
                        'option_4' => $options['option_4'],
                        'correct_option' => $ans,
                        'explanation' => $item['EXPLANATION'],
                        'tst_id' => $tst->id,
                    ]);
                if (array_key_exists("IMAGES", $item)) {
                    return $item;
                    foreach ($item['IMAGES'] as $key => $image) {
                        QuestionImage::create([
                            'q_id' => $q_data->id,
                            'image_url' => $image
                        ]);
                    }
                }

                if (array_key_exists("PARAGRAPH", $item)) {
                    $para = preg_replace('/\s+/', ' ', trim($item['PARAGRAPH']));
                    ExtraQuestionField::create([
                        'q_id' => $q_data->id,
                        'paragraph' => $para,
                    ]);

                }

            }
        }
        return response()->json([
            'message' => 'Successfully Topic added',
            count($questions)
        ], 200);
    }
    public function getTopicQuestion($tst_id)
    {
        $question = TestSeriesTopics::where('id', $tst_id)
            ->with('getQuestion')
            ->first();

        $c = $this->get_question_index($question->getQuestion);
        // return $c;
        $question->get_question = $c['test_data'];
        // $question->get_question = $question->getQuestion->map(function ($value) {
        //     if ($value->extraFields) {

        //         $value->conversation = $value->extraFields->conversation;
        //         $value->paragraph = $value->extraFields->paragraph;
        //     }
        //     unset($value->extraFields);
        //     return $value;
        // });
        return response()->json([
            'message' => 'Success',
            'index' => $c['index'],
            'topic_questions' => $question,
        ], 200);
    }

    public function updateTSTopic(Request $request, $tst_id)
    {

        $tst = TestSeriesTopics::where('id', $tst_id)->with('getQuestion')->first();

        $questions = $request->question;

        $data = $request->except(['question']);
        if (count($data) != 0) {
            TestSeriesTopics::where('id', $tst_id)->update($data);
        }
        // $tst = TestSeriesTopics::where('id', $tst_id)
        // ->with('getQuestion')
        // ->first();
        // foreach ($tst->getQuestion as $key => $value) {

        // }


        if ($questions) {

            Question::where('tst_id', $tst_id)
                ->delete();
            if ($tst->tsc_id == 3 || $tst->tsc_id == 1) {

                foreach ($questions as $key => $item) {
                    $item = array_change_key_case($item, CASE_UPPER);
                    $ans = preg_replace('/\s+/', ' ', trim($item['ANSWER']));
                    $q_data = Question::query()
                        ->create([
                            'question' => $item['QUESTION'],
                            'option_1' => $item['OPTIONS']['a'],
                            'option_2' => $item['OPTIONS']['b'],
                            'option_3' => $item['OPTIONS']['c'],
                            'option_4' => $item['OPTIONS']['d'],
                            'correct_option' => $ans,
                            'explanation' => $item['EXPLANATION'],
                            'tst_id' => $tst->id,
                        ]);
                    // RETURN ($item);
                    if (array_key_exists("IMAGES", $item)) {
                        foreach ($item['IMAGES'] as $key => $image) {
                            QuestionImage::create([
                                'q_id' => $q_data->id,
                                'image_url' => $image
                            ]);
                        }
                    }
                    if (array_key_exists("PARAGRAPH", $item) || array_key_exists("CONVERSATION", $item)) {
                        ExtraQuestionField::create([
                            'q_id' => $q_data->id,
                            'paragraph' => isset($item["PARAGRAPH"]) ? $item["PARAGRAPH"] : null,
                            'conversation' => isset($item["CONVERSATION"]) ? $item["CONVERSATION"] : null,
                        ]);

                    }

                }
            }
            // elseif ($tst->tsc_id == 2) {
            //     foreach ($questions as $key => $item) {
            //         $ans = preg_replace('/\s+/', ' ', trim($item['Answer']));
            //         $q_data = Question::query()
            //             ->create([
            //                 'question' => $item['Question'],
            //                 'option_1' => $item['Option_A'],
            //                 'option_2' => $item['Option_B'],
            //                 'option_3' => $item['Option_C'],
            //                 'option_4' => $item['Option_D'],
            //                 'correct_option' => $ans,
            //                 'explanation' => $item['Explanation'],
            //                 'tst_id' => $tst_id,
            //             ]);
            //         if (array_key_exists("IMAGES", $item)) {
            //             foreach ($item['IMAGES'] as $key => $image) {
            //                 QuestionImage::create([
            //                     'q_id' => $q_data->id,
            //                     'image_url' => $image
            //                 ]);
            //             }
            //         }
            //     }
            // }
        }

        return response()->json([
            'message' => 'Successfully Topic Updated',
            count($questions)
        ], 200);
    }


    public function showProductDetails($p_id)
    {
        // return $request->input();
        $tst = TestSeriesProduct::query()
            ->where('id', $p_id)
            ->with('getTsProductCategory.testSeriesCategories')
            ->with('getTsProductCategory.tsPCSet.getTsTopic.tsTopic')
            ->with('getTsProductCategory.tsPCSet')
            ->first();
        // return $tst;
        $tst->categories = $this->pCSet($tst->getTsProductCategory);
        unset($tst->getTsProductCategory);
        // return $tst->getTsProductCategory;
        $current_date = date('Y-m-d');
        $product = TestSeriesProduct::where('id', $p_id)
            ->where('release_date', "<=", $current_date)
            ->whereHas('getTsProductCategory', function ($query) {
                $query->whereNot('total_set', null);
            })
            ->first();
            $tst->release_status = !!$product;

        return response()->json([
            'product_detail' => $tst,

        ], 200);
    }

    public function getSetQuestion($set_id)
    {
        $set = TSPCSet::where('id', $set_id)
            ->with('getSetQuestion.getQuestions')
            ->first();

        $set->getSetQuestion = $set->getSetQuestion->map(function ($value) {

            return $value->getQuestions;
        });
        // return  $set;
        $c = $this->get_question_index($set->getSetQuestion);
        $set->question = $c['test_data'];

        unset($set->getSetQuestion);
        return response()->json([
            'set_questions' => $set,
            'index' => $c['index'],
        ], 200);
    }

    public function showTopics($tsc_id, $ts_id)
    {
        $topics = TestSeriesTopics::where('tsc_id', $tsc_id)
            ->where('ts_id', $ts_id)

            ->get();
        return response()->json([
            'topics' => $topics
        ], 200);
    }
    public function showSetTopics(Request $request)
    {
        // return $request->input();
        $tspc = TestSeriesProduct::query()
            ->where('id', $request->p_id)
            ->with('getTsProductCategory', function ($query) use ($request) {
                $query->where('tsc_id', $request->tsc_id);
            })
            ->first();
        $topics = TestSeriesCategories::query()
            ->where('id', $request->tsc_id)
            ->with('topics')
            ->first();

        if (count($topics->topics) == 0 && $tspc) {
            return response()->json([
                'message' => "Topics does not exist in " . $topics->tsc_type . " or product doest not exist",
            ], 403);
        }

        return response()->json([
            'set_data' => [$topics],
            'tspc' => [
                $topics->tsc_type => $tspc->getTsProductCategory[0]->id
            ]

        ], 200);
    }
    public function getSetTopic($set_id)
    {
        // return $request->input();

        $topics = TSPCTopics::query()
            ->where('tspcs_id', $set_id)
            ->with('tsTopic')
            ->get();
        $all_topic = [];
        foreach ($topics as $value) {
            $all_topic[] = $value->tsTopic;
        }
        return response()->json([
            'set_data' => $all_topic,

        ], 200);
    }

    public function showTopicsDetails($tst_id)
    {
        $topics = TestSeriesTopics::where('id', $tst_id)
            ->first();
        $questions = Question::where('tst_id', $tst_id)->get();

        return response()->json([
            'topics' => $topics,
            'question' => $questions
        ], 200);
    }
    public function deleteProduct($p_id)
    {
        $current_date = date('Y-m-d');

        $product = TestSeriesProduct::where('id', $p_id)
            ->with('tsPurchases')
            ->first();

        $total_purchase = count($product->tsPurchases);

        if ($total_purchase != 0) {
            return response()->json([
                'Message' => 'Product Already Released (Set)',
            ], 403);
        }

        // if ($product) {
        //     return response()->json([
        //         'Message' => 'Product Already Released (Product)',
        //     ], 403);
        // }
        $product = TestSeriesProduct::where('id', $p_id)
            ->first();
        // File::delete($product->p_image);
        if ($product->p_image) {
            if (File::exists(public_path($product->p_image))) {
                File::delete(public_path($product->p_image));
            }
        }

        TestSeriesProduct::where('id', $p_id)
            ->delete();

        return response()->json([
            'Message' => 'Successfully Deleted Product',
        ], 200);
    }

    public function deleteSet($set_id)
    {
        $current_date = date('Y-m-d');

        // Check if the set has a release date before the current date
        $set = TSPCSet::where('id', $set_id)
            ->with('getTsPC.testSeriesProduct.tsPurchases')
            ->first();

        $total_purchase = count($set->getTsPC->testSeriesProduct->tsPurchases);

        if ($total_purchase != 0) {
            return response()->json([
                'Message' => 'Product Already Released (Set)',
            ], 403);
        }

        // Get the tspc_id for the set
        $tspc_id = TSPCSet::where('id', $set_id)
            ->first('tspc_id');

        // Delete the set
        TSPCSet::where('id', $set_id)->delete();

        // Retrieve tspc with related data
        $tspc = TSProductCategory::query()
            ->where('id', $tspc_id->tspc_id)
            ->with('testSeriesCategories', 'tsPCSet', 'testSeriesProduct.getTestSeries')
            ->first();

        // Update set_number and set_name for tspc sets
        foreach ($tspc->tsPCSet as $key => $value) {
            TSPCSet::where('id', $value->id)
                ->update([
                    'set_number' => $key + 1,
                    'set_name' => $tspc->testSeriesProduct->getTestSeries->test_type . " " . $tspc->testSeriesCategories->tsc_type . ' set - ' . ($key + 1)
                ]);
        }

        // Get tspc with updated data
        $tspc = TSProductCategory::query()
            ->where('id', $tspc_id->tspc_id)
            ->with('testSeriesCategories', 'testSeriesProduct.getTestSeries')
            ->first();

        // Prepare category data
        $categories = $this->pCSet([$tspc]);

        // Return the response
        return response()->json([
            'Message' => 'Successfully Deleted Set',
            'category_data' => $categories[0]
        ], 200);
    }
    public function setCheck($set_id)
    {
        $current_date = date('Y-m-d');
        $set = TSPCSet::where('id', $set_id)
            ->with('getTsPC.testSeriesProduct.tsPurchases')
            ->first();

        $total_purchase = count($set->getTsPC->testSeriesProduct->tsPurchases);

        if ($total_purchase != 0) {
            return response()->json([
                'Message' => 'Product Already Released (Set)',
            ], 403);
        }

        return response()->json([
            'Message' => 'Product is not Released (Set)',
        ], 200);
    }
    public function deleteTopic($tst_id)
    {
        $current_date = date('Y-m-d');
        $topic = TestSeriesProduct::where('release_date', "<=", $current_date)
            ->whereHas('getTsProductCategory.tsPCSet.getTsTopic', function ($query) use ($tst_id) {
                $query->where('tst_id', $tst_id);
            })
            ->first();

        // return $topic;
        if ($topic) {
            return response()->json([
                'Message' => 'Already Product Released (topic)',
            ], 403);
        }

        $tst = TestSeriesTopics::where('id', $tst_id)
            ->with('getQuestion')
            ->first();
        foreach ($tst->getQuestion as $key => $value) {
            $temp = explode(".", $value->option_1)[1] ?? "";
            // echo $temp;
            // return explode(".", $value->option_1)[1];
            if (count($value->questionImage) != 0) {
                foreach ($value->questionImage as $key => $value2) {
                    if (File::exists(public_path($value2->image_url))) {
                        File::delete(public_path($value2->image_url));
                    }
                }
            }

            if ($temp == "png") {
                if (File::exists(public_path($value->option_1))) {
                    File::delete(public_path($value->option_1));
                }
                if (File::exists(public_path($value->option_2))) {
                    File::delete(public_path($value->option_2));
                }
                if (File::exists(public_path($value->option_3))) {
                    File::delete(public_path($value->option_3));
                }
                if (File::exists(public_path($value->option_4))) {
                    File::delete(public_path($value->option_4));
                }
            }
        }

        TestSeriesTopics::where('id', $tst_id)
            ->delete();

        $topics = TestSeriesTopics::where('tsc_id', $tst->tsc_id)
            ->where('ts_id', $tst->ts_id)
            ->get();
        return response()->json([
            'Message' => 'Successfully Deleted Topic',
            'topics' => $topics
        ], 200);
    }

    public function topicCheck($tst_id)
    {
        $current_date = date('Y-m-d');
        $topic = TestSeriesProduct::where('release_date', "<=", $current_date)
            ->whereHas('getTsProductCategory.tsPCSet.getTsTopic', function ($query) use ($tst_id) {
                $query->where('tst_id', $tst_id);
            })
            ->first();

        if ($topic) {
            return response()->json([
                'Message' => 'Already Product Released (topic)',

            ], 403);
        }

        $topic_data = TestSeriesTopics::where('id', $tst_id)->first();
        return response()->json([
            'Message' => 'Product is not Released (topic)',
            'topic_data' => $topic_data
        ], 200);
    }


    public function productStatus($p_id, Request $request)
    {
        TestSeriesProduct::where('id', $p_id)
            ->update(['status' => $request->status]);
        return response()->json([
            'message' => 'Successfully changed product status'
        ], 200);
    }

    public function setStatus($set_id, Request $request)
    {
        TSPCSet::where('id', $set_id)
            ->update(['status' => $request->status]);
        return response()->json([
            'message' => 'Successfully changed set status'
        ], 200);
    }


    public function imageUpload(Request $request)
    {
        // return  $request->images;
        $values = $request->file('images');
        if (is_array($values) || is_object($values)) {
            foreach ($values as $file) {
                // return $value;
                // $value =$request->images;
                if ($file) {
                    // $file = $value;
                    if ($file->isValid()) {
                        $image_name = pathinfo($file->getClientOriginalName(), PATHINFO_FILENAME);
                        $filename = $image_name . '.' . strtolower($file->getClientOriginalExtension());
                        $image_check = Images::where("image_name", $image_name)->first();

                        $file->move(public_path('/images'), $filename);
                        $filepath = "/images/" . $filename;
                        if (!$image_check) {
                            Images::UpdateOrcreate([
                                'image_url' => $filepath,
                                'image_name' => $image_name,
                                'tsc_id' => $request->tsc_id

                            ]);
                        }
                        ;
                    } else {
                        // continue;
                        return response()->json(['error' => 'File upload failed'], 400);
                    }
                }
            }
            return response()->json([
                'message' => 'SuccessFully',
                // "data"=>$request->images
            ], 200);
        }
        return response()->json([
            'message' => 'not proper',

        ], 403);
    }

    public function getImage($tsc_id)
    {
        $images = Images::where('tsc_id', $tsc_id)->get();

        // foreach ($images as $key => $value) {
        //     $value->image_url = $value->images->image_url;
        //     unset($value->images);
        // }

        return response()->json([
            'images' => $images
        ], 200);
    }
    public function getReadingTopic()
    {
        $topics = TestSeriesTopics::where('tsc_id', 2)
            ->get();


        return response()->json([
            'reading_topics' => $topics
        ], 200);
    }
    public function addReadingTopic(Request $request)
    {
        // $data = $request->except(['question']);
        // return $data;
        // if ($data) {
        $tst = TestSeriesTopics::query()
            ->create(
                $request->input()
            );
        // }

        return response()->json([
            "message" => "Success"
        ], 200);
    }
    public function updateReadingQuestion(Request $request)
    {

        foreach ($request->question as $value) {
            $para = $value['paragraph'];
            unset($value['paragraph'], $value['conversation']);
            // return $value;
            // $item = array_change_key_case($value, CASE_UPPER);
            // return $data;
            $q_data = Question::query()
                ->where('id', $value["id"])
                ->update($value);


            $para2 = preg_replace('/\s+/', ' ', trim($para));
            // echo $para2;
            ExtraQuestionField::where('q_id', $value['id'])->update([
                'paragraph' => $para2,
            ]);

        }

        return response()->json([
            "message" => "Success"
        ], 200);
    }

    public function getReadingQuestion($tst_id)
    {

        $question = Question::query()->where("tst_id", $tst_id)->with("extraFields")->get();
        $c = $this->get_question_index($question);
        $count = 0;

        $new = [];
        for ($i = 0; $i < count($c["index"]); $i++) {
            $q = (object) [];
            $q->paragraph = $c["test_data"][$count]->paragraph;
            $q->question = [];

            for ($j = 0; $j < $c["index"][$i]; $j++) {
                // unset($c["test_data"][$count]->conversation, $c["test_data"][$count]->paragraph);
                $q->question[] = $c["test_data"][$count];

                $count++;
            }

            $new[] = $q;

        }

        return response()->json([
            "message" => "Success",
            "reading_question" => $new,
            // $questio
        ], 200);
    }
    public function getQuestionWithId($q_id)
    {

        $question = Question::query()->where("id", $q_id)->first();
        // $c = $this->get_question_index($question);


        return response()->json([
            "message" => "Success",
            "question" => $question,
            // $questio
        ], 200);
    }
    public function updateQuestionWithId(Request $request, $q_id)
    {

        $question = Question::query()->where("id", $q_id)->update($request->question);
        $question = Question::query()->where("id", $q_id)->first();

        return response()->json([
            "message" => "Success",
            $question
            // $questio
        ], 200);
    }

    public function addReadingQuestion(Request $request)
    {
        $item = array_change_key_case($request->question, CASE_UPPER);
        $ans = preg_replace('/\s+/', ' ', trim($item['ANSWER']));

        $q_data = Question::query()
            ->create([
                'question' => $item['QUESTION'],
                'option_1' => $item['OPTION_A'],
                'option_2' => $item['OPTION_B'],
                'option_3' => $item['OPTION_C'],
                'option_4' => $item['OPTION_D'],
                'option_5' => $item['OPTION_E'],
                'option_6' => $item['OPTION_F'],
                'option_7' => $item['OPTION_G'],
                'option_8' => $item['OPTION_H'],
                'correct_option' => $ans,
                'explanation' => $item['EXPLANATION'],
                'tst_id' => $request->tst_id,
            ]);

        if (array_key_exists("PARAGRAPH", $item)) {
            $para = preg_replace('/\s+/', ' ', trim($item['PARAGRAPH']));
            ExtraQuestionField::create([
                'q_id' => $q_data->id,
                'paragraph' => $para,
            ]);

        }

        return response()->json([
            "message" => "Success"
        ], 200);
    }


    public function saveImage($image)
    {
        $base64Image = $image;

        // Remove the data URL prefix (e.g., "data:image/png;base64,")
        $base64Image = preg_replace('/^data:image\/(png|jpeg|jpg);base64,/', '', $base64Image);

        // Decode the Base64 string into binary image data
        $imageData = base64_decode($base64Image);
        $count = Question::where("nvq", 1)->count();
        if ($imageData !== false) {
            // Generate a unique filename for the image (e.g., using timestamp)
            $filename = 'q_image_' . $count + 1 . time() . '.png';

            // Define the directory where you want to save the image
            $uploadPath = public_path('NVImages/qImage'); // Change this to your desired directory

            // Save the image to the specified directory
            file_put_contents($uploadPath . '/' . $filename, $imageData);

            // You can also store the filename in your database for future reference
            return '/NVImages/qImage' . '/' . $filename;
            return response()->json(['message' => 'Image saved successfully', 'filename' => $filename]);
        } else {
            return response()->json(['error' => 'Invalid image data'], 400);
        }
    }
    public function saveOptionImage($image, $option)
    {
        $base64Image = $image;

        // Remove the data URL prefix (e.g., "data:image/png;base64,")
        $base64Image = preg_replace('/^data:image\/(png|jpeg|jpg);base64,/', '', $base64Image);

        // Decode the Base64 string into binary image data
        $imageData = base64_decode($base64Image);
        $count = Question::where("nvq", 1)->count();
        if ($imageData !== false) {
            // Generate a unique filename for the image (e.g., using timestamp)
            $filename = 'option_' . $option . '_' . ($count + 1) . time() . '.png';

            // Define the directory where you want to save the image
            $uploadPath = public_path('NVImages/oImage'); // Change this to your desired directory

            // Save the image to the specified directory
            file_put_contents($uploadPath . '/' . $filename, $imageData);

            // You can also store the filename in your database for future reference
            return '/NVImages/oImage' . '/' . $filename;
            return response()->json(['message' => 'Image saved successfully', 'filename' => $filename]);
        } else {
            return response()->json(['error' => 'Invalid image data'], 400);
        }
    }
    public function addNVTSTopic(Request $request)
    {

        $data = $request->except(['question']);
        // $data = ['status'=>1, ...$t_data];
        // return response()->json([
        //     'message' =>$data
        // ], 500);

        // return $request->input();
        if ($data) {
            $tst = TestSeriesTopics::query()
                ->create(
                    ['nv_topic' => 1, ...$data]
                );
        }


        $questions = $request->question;

        foreach ($questions as $key => $item) {
            $item = array_change_key_case($item, CASE_UPPER);

            $ans = preg_replace('/\s+/', ' ', trim($item['CORRECT_ANS']));
            // return  $item;
            // return  $this->saveImage($item['QUESTION_IMAGE']);
            $q_data = Question::query()
                ->create([
                    'question' => $item['QUESTION'],
                    'option_1' => (explode(":", $item['OPTIONS']['a'])[0] == "data") ? $this->saveOptionImage($item['OPTIONS']['a'], "A") : $item['OPTIONS']['a'],
                    'option_2' => (explode(":", $item['OPTIONS']['b'])[0] == "data") ? $this->saveOptionImage($item['OPTIONS']['b'], "B") : $item['OPTIONS']['b'],
                    'option_3' => (explode(":", $item['OPTIONS']['c'])[0] == "data") ? $this->saveOptionImage($item['OPTIONS']['c'], "C") : $item['OPTIONS']['c'],
                    'option_4' => (explode(":", $item['OPTIONS']['d'])[0] == "data") ? $this->saveOptionImage($item['OPTIONS']['d'], "D") : $item['OPTIONS']['d'],
                    'correct_option' => $ans,
                    'explanation' => null,
                    'tst_id' => $tst->id,
                    'nvq' => 1
                ]);
            // RETURN ($item);$imagePath = Storage::disk('public')->put('images', $imageBlob);
            if (array_key_exists("QUESTION_IMAGE", $item)) {

                QuestionImage::create([
                    'q_id' => $q_data->id,
                    'image_url' => $this->saveImage($item['QUESTION_IMAGE'])
                ]);

            }

        }

        return response()->json([
            'message' => 'Successfully Topic added'
        ], 200);
    }

    public function deleteImage(Request $request)
    {
        foreach ($request->imageIds as $key => $id) {
            $image = Images::where('id', $id)->first();
            if ($image) {
                if (File::exists(public_path($image->image_url))) {
                    File::delete(public_path($image->image_url));
                }
            }
            Images::where('id', $id)->delete();
        }
        return response()->json([
            'message' => 'Successfully Deleted'
        ], 200);
    }
}
