<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\QuestionImage;
use App\Models\SetQuestion;
use App\Models\TestSeriesPurchases;
use App\Models\TestSeriesTopics;
use App\Models\TSPCSet;
use App\Models\UserTestSeries;
use App\Models\UserTestStatus;
use App\Models\Question;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;
use App\Models\TestSeriesProduct;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use stdClass;


class UserController extends Controller
{
    private function get_user_rank($set_id, $user_id)
    {
        $all_percentage = UserTestSeries::query()
            ->where(['set_id' => $set_id, 'complete_status' => 1])
            ->whereHas('userPurchases', function ($query) use ($user_id) {
                $query->whereNot('user_id', $user_id);
            })
            ->select('tsps_id', DB::raw('MAX(percentage) as highest_percentage'))
            ->groupBy('tsps_id')
            ->orderBy('highest_percentage', 'desc') // Order by the alias, not the original column
            ->get();

        $user_percentage = UserTestSeries::query()
            ->whereHas('userPurchases', function ($query) use ($user_id) {
                $query->where('user_id', $user_id);
            })
            ->select(DB::raw('MAX(percentage) as highest_percentage'))
            ->first();

        $rank = 1;
        foreach ($all_percentage as $key => $value) {
            if ($value->highest_percentage <= $user_percentage->highest_percentage) {
                break;
            }
            $rank++;
        }
        ;
        return [
            'rank' => $rank,
            'user_percentage' => $user_percentage->highest_percentage,
            'total_user' => count($all_percentage) + 1,
            'all_percentage' => $all_percentage
        ];
    }

    public function userTestStatus(request $request)
    {
        // return $request->id;

        $uts = UserTestSeries::query()
            ->where('tsps_id', $request->ps_id)
            ->where('set_id', $request->set_id)
            ->where('complete_status', 0)
            ->select('id')
            ->first();

        if ($uts) {
            return response()->json([
                'uts_id' => $uts->id
            ], 200);
        }

        $timer = TSPCSet::query()
            ->where('id', $request->set_id, )
            ->with('getTsPC.testSeriesCategories')
            ->first();
        $current = Carbon::now();

        $uts = UserTestSeries::query()
            ->create(
                [
                    'tsps_id' => $request->ps_id,
                    'set_id' => $request->set_id,
                    'complete_status' => 0,
                    'current_timer' => $timer->getTsPC->testSeriesCategories->duration,
                    'start_date' => $current->format('d-m-Y'),
                ]
            );


        return response()->json([
            'uts_id' => $uts->id
        ], 200);
    }

    private function get_question_index($userTestStatuses)
    {

        $index = [];
        $userTestStatuses = $userTestStatuses->map(function ($item, $key) {
            if ($item->questions->extraFields) {
                $item->questions->conversation = $item->questions->extraFields->conversation;
                $item->questions->paragraph = $item->questions->extraFields->paragraph;
            }

            unset($item->questions->extraFields);
            return $item;
        });
        foreach ($userTestStatuses as $key => $value) {
            if ($value->questions->extraFields) {
                $index[] = $value->questions->extraFields->paragraph;
            }

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
    public function generateRandomQuestion($id)
    {

        $userTestSeries = UserTestSeries::
            // with('userPurchases.tsProduct')
            with('getTSSet.getTsPC.testSeriesCategories')
            ->find($id);
        $cate_id = $userTestSeries->getTSSet->getTsPC->testSeriesCategories->id;
        // $product = $userTestSeries->userPurchases->tsProduct;

        if (!$userTestSeries || !$userTestSeries->userPurchases) {
            return response()->json(['message' => 'No purchases'], 200);
        }

        // $testSeriesProduct = TestSeriesProduct::find($userTestSeries->userPurchases->tsp_id);


        $timer = $userTestSeries->current_timer;


        $userTestStatuses = UserTestStatus::where('uts_id', $id)->with(['questions.questionImage', 'questions.extraFields'])->get();
        // DB::enableQueryLog();
        // $temp = Question::where('id', 205)->with(['questionImage', 'extraFields'])->first();
        // foreach ( $temp as $question) {
        //     // Access questionImage and extraFields here
        //     $questionImages = $question->questionImage;
        //     $extraFields = $question->extraFields;
        //     // return [$questionImages, $extraFields];
        // }
        // dd(DB::getQueryLog());
        // return $temp;


        if (!$userTestStatuses->isEmpty()) {

            $c = $this->get_question_index($userTestStatuses);
            // return ;
            return response()->json([
                'test_data' => $c['test_data'],
                // ""
                'current_qid' => $userTestSeries->q_id,
                'uts_id' => $userTestSeries->id,
                'timer' => $timer,
                "index" => $c['index']
            ], 200);
        }


        $uts_data = UserTestSeries::where('id', $id)
            ->with('getTSSet')
            ->first();

        $temp_questions = SetQuestion::where('set_id', $uts_data->set_id)
            ->get();

        // return $temp_questions;

        foreach ($temp_questions as $question) {
            UserTestStatus::create([
                'q_id' => $question->q_id,
                'uts_id' => $id,
                'test_time' => 0
            ]);
        }

        $uts2 = UserTestStatus::where('uts_id', $id)->get();
        UserTestSeries::where('id', $id)->update(['q_id' => $uts2[0]->id]);
        UserTestStatus::where('id', $uts2[0]->id)->update(['status_id' => 2]);


        $userTestSeries = UserTestSeries::with('userPurchases')->find($id);
        $userTestStatuses = UserTestStatus::where('uts_id', $id)->with(['questions.questionImage', 'questions.extraFields'])->get();
        // $userTestStatuses = $userTestStatuses->map(function ($item) {

        //     if ($item->questions->extraFields) {
        //         $item->questions->conversation = $item->questions->extraFields->conversation;
        //         $item->questions->paragraph = $item->questions->extraFields->paragraph;
        //     }
        //     unset($item->questions->extraFields);
        //     return $item;
        // });
        $c = $this->get_question_index($userTestStatuses);
        return response()->json([
            'test_data' => $c['test_data'],
            'current_qid' => $userTestSeries->q_id,
            'uts_id' => $userTestSeries->id,
            "index" => $c['index'],
            'timer' => $timer
        ], 200);


    }


    public function updateTestStatus(Request $request, $status_id)
    {
        $timer = $request->current_timer;

        $requestDataWithoutTimer = $request->except('current_timer');
        // $requestDataWithoutTimer =  [$requestDataWithoutTimer, 'test_time' => $request->current_timer];
        // return $requestDataWithoutTimer;
        if ($request->test_answer) {
            $uts = UserTestSeries::query()
                ->whereHas('getUTStatus', function ($query) use ($status_id) {
                    $query->where('id', $status_id);
                })
                // ->with('getTSSet.getTsPC.testSeriesCategories')
                ->first();
            $question_timer = (float) ($uts->current_timer ?? $timer) - $timer;
            $requestDataWithoutTimer = ['test_answer' => $request->test_answer, 'test_time' => round($question_timer, 3), 'status_id' => $request->status_id];
            // return $question_timer;

        }
        // return $requestDataWithoutTimer;
        UserTestStatus::query()
            ->where('id', $status_id)
            ->update(
                $requestDataWithoutTimer
            );

        $uts_id = UserTestStatus::where('id', $status_id)
            // ->with('questions')
            ->first();

        UserTestSeries::query()
            ->where('id', $uts_id->uts_id)
            ->update([
                'q_id' => $status_id,
                'current_timer' => $timer
            ]);

        $questions = UserTestStatus::query()
            ->where('uts_id', $uts_id->uts_id)
            ->with(['questions.questionImage', 'questions.extraFields'])
            ->get();
        $c = $this->get_question_index($questions);
        // $questions = $questions->map(function ($item) {

        //     if ($item->questions->extraFields) {
        //         $item->questions->conversation = $item->questions->extraFields->conversation;
        //         $item->questions->paragraph = $item->questions->extraFields->paragraph;
        //     }
        //     unset($item->questions->extraFields);
        //     return $item;
        // });
        return response()->json([
            'message' => 'Successfully Updated',
            'test_data' => $c['test_data'],
            'current_qid' => $uts_id->id,
            "index" => $c['index'],
            // $question_timer
        ], 200);
    }


    public function updateTimer($id, Request $request)
    {
        // $uts_id = UserTestStatus::where('id', $id)
        //     ->first();

        UserTestSeries::query()
            ->where('id', $id)
            ->update([
                'current_timer' => $request->current_timer
            ]);
        return response()->json([
            'message' => 'Successfully Updated',
        ], 200);
    }


    public function submitTest($id, Request $request)
    {
        $current = Carbon::now();
        $uts = UserTestSeries::query()
            ->where('id', $id)
            ->with('getTSSet.getTsPC.testSeriesCategories')
            ->first();

        $duration = $uts->getTSSet->getTsPC->testSeriesCategories->duration;

        $total_answered = UserTestStatus::query()
            ->where('uts_id', $id)
            ->whereNot('test_answer', null)
            ->with('questions')
            ->get();


        $total = 0;


        foreach ($total_answered as $item) {
            // return ([$item->test_answer,$item->questions->correct_option]);
            // $total[] = $item->test_answer;
            if ($item->test_answer == $item->questions->correct_option) {
                UserTestStatus::query()
                    ->where('uts_id', $id)
                    ->where('q_id', $item->questions->id)
                    ->update(['marks' => 1]);
                $total++;

            }
        }
        // return ([$total]);
        $time_taken = round(((int) $duration - (int) $request->current_timer));

        UserTestSeries::query()
            ->where('id', $id)
            ->update([
                'complete_status' => 1,
                'end_date' => $current->format('d-m-Y'),
                'time_taken' => $time_taken,
                'current_timer' => null,
                'total_marks' => $total,
                'percentage' => ($total / 35) * 100,
                'total_answered' => count($total_answered)
            ]);

        $t = UserTestSeries::query()->where('id', $id)->first();
        // return $total;
        return response()->json([
            'message' => 'Successfully Submitted',
            'uts_id' => $id
        ], 200);
    }
    public function getTestResult($id)
    {
        $uts = UserTestSeries::query()
            ->where('id', $id)
            ->first();

        if (!$uts) {
            return response()->json([
                'message' => 'does not exist'
            ], 403);
        }
        $uts = UserTestSeries::query()
            ->where('id', $id)
            ->with('getTSSet.getTsPC.testSeriesCategories')
            ->first();

        $duration = $uts->getTSSet->getTsPC->testSeriesCategories->duration;

        $total_answered = UserTestStatus::query()
            ->where('uts_id', $id)
            ->whereNot('test_answer', null)
            ->get();
        $q_count = UserTestStatus::query()
            ->where('uts_id', $id)
            ->count();
        // $total = 0;

        // foreach ($total_answered as $item) {
        //     // $total[] = $item->test_answer;
        //     if ($item->test_answer == $item->questions->correct_option) {
        //         UserTestStatus::query()
        //             ->where('uts_id', $id)
        //             ->where('q_id', $item->questions->id)
        //             ->update(['marks' => 1]);
        //         $total++;

        //     }
        // }

        // $uts =UserTestSeries::query()
        //     ->where('id', $id)
        //     ->first();
        // return $total;
        // return $total;
        return response()->json([
            'total_answered' => count($total_answered),
            'total_questions' => $q_count,
            'total_marks' => $q_count,
            'total_time' => $duration,
            'time_taken' => (int) $uts->time_taken,
            'right_answer' => $uts->total_marks,
            'wrong_answer' => (int) ($q_count - $uts->total_marks),
            'marks_obtained' => (int) $uts->total_marks
        ], 200);

    }
    public function UserSetData($user_id)
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

        return response()->json([
            // 'message' => 'Successfully Submitted',
            'total_test' => $total_test,
            'complete_test' => $complete_test,
            'incomplete_test' => $incomplete_test,
            'Remaining_test' => $Remaining_test,
            // $temp_CStatus,
            // $temp,

            // $test_data,
        ], 200);

    }
    public function getRProduct($user_id)
    {
        $current_date = date('Y-m-d');
        $product = TestSeriesProduct::query()
            ->whereDoesntHave('tsPurchases', function ($query) use ($user_id) {
                $query->where('user_id', $user_id);
            })
            ->where('status', 1)
            ->where('release_date', "<=", $current_date)
            // ->with('tsPurchases')
            ->get();

        return response()->json([
            // 'message' => 'Successfu',
            'remaining_product' => $product
        ], 200);
    }

    public function getTSPurchasesLimit($user_id)
    {
        $purchases = TestSeriesPurchases::query()
            ->where('user_id', $user_id)
            ->where('status', 1)
            // ->with('tsProduct')
            ->with([
                'tsProduct' => function ($query) {
                    $query->with(
                        'getTsProductCategory.testSeriesCategories',
                        'getTsProductCategory.tsPCSet'
                    );
                }
            ])
            ->first();
        //  return $purchases;
        $new_purchases = [];
        if (!$purchases) {
            return response()->json([
                'tsp' => $purchases,
            ], 200);
        }
        // $purchases->test_data = [];
        $temp_data = $purchases->tsProduct->getTsProductCategory;
        $purchases->test_data = array_column($temp_data->toArray(), 'test_series_categories');

        $purchases->category = collect($purchases->test_data)->map(function ($item, $key) use ($temp_data) {
            $item['set'] = $temp_data[$key]->tsPCSet;
            return $item;
        })->all();

        // return $purchases->category;
        if (is_array($purchases->category)) {
            foreach ($purchases->category as $value2) {
                foreach ($value2['set'] as $value3) {
                    $value3->valid_from = $purchases->valid_from;
                    $value3->valid_till = $purchases->valid_till;
                    $value3->tsc_type = $value2['tsc_type'];
                    $value3->duration = $value2['duration'];
                    unset($value3->tspc_id, $value3->set_number, $value3->status);
                    $new_purchases[] = $value3;
                }
            }


        }
        unset($purchases->tsProduct);

        return response()->json([
            'tsp' => $new_purchases,
            'ps_id' => $purchases->id
        ], 200);
    }

    public function get_user_all_result($user_id, $ts_id)
    {
        $user_RA = UserTestSeries::query()
            ->where('complete_status', 1)
            ->whereHas('userPurchases', function ($query) use ($user_id) {
                $query->where('user_id', $user_id);
            })
            ->whereHas('userPurchases.tsProduct', function ($query) use ($ts_id) {
                $query->where('ts_id', $ts_id);
            })
            ->with('userPurchases.tsProduct')
            ->with('getTSSet')
            ->get();
        // return $user_RA;
        $user_RA = $user_RA->map(function ($item) {
            $item->set_name = $item->getTSSet->set_name;
            $item->package_name = $item->userPurchases->tsProduct->p_name;
            unset($item->getTSSet,$item->userPurchases);
            return $item;
        });

        return response()->json([
            'all_results' => $user_RA,

        ], 200);
    }
    public function get_user_result($uts_id)
    {
        $user_RA = UserTestSeries::query()
            ->where('id', $uts_id)
            ->with(['getTSSet', 'getUTStatus.questions.qTopic'])
            ->first();

        $user_RA->set_name = $user_RA->getTSSet->set_name;

        // return $user_RA->getUTStatus;
        // $user_RA = $user_RA->getUTStatus->filter(function ($item) {
        //     // if ($item->test_answer) {
        //         if ($item->test_answer != $item->questions->correct_option) {
        //             $item->weak_topics = $item->questions->qTopic;
        //             return 1;
        //         }
        //     // }
        //     // unset($item);

        // })->values();
        $topics_id = [];
        $topics = [];
        $ra = $this->get_user_rank($user_RA->set_id, Auth()->id());
        $user_RA->rank = $ra['rank'];
        foreach ($user_RA->getUTStatus as $key => $item) {
            if ($item->test_answer != $item->questions->correct_option) {
                $topics_id[] = $item->questions->qTopic->id;
                $topics[] = $item->questions->qTopic;
            }
        }

        $topic_count = array_count_values($topics_id);
        $weak_topics = [];

        foreach ($topic_count as $key => $value) {
            if ($value > 3) {
                $weak_topics[] = $key;
            }
        }

        $uniqueTopics = array_unique($topics, SORT_REGULAR);
        $filteredTopics = array_filter($uniqueTopics, function ($topic) use ($weak_topics) {
            return in_array($topic->id, $weak_topics);
        });
        $filteredTopicsCollection = new Collection($filteredTopics);
        $user_RA->weak_topics = $filteredTopicsCollection->values();
        ;
        unset($user_RA->getTSSet, $user_RA->getUTStatus);
        return response()->json([
            'all_results' => $user_RA,
            // 'weak_topics' => (array)$filteredTopics,
            // 'weak_topics' => array_keys($results)
        ], 200);
    }
    public function get_user_result_limit($user_id)
    {
        $user_RA = UserTestSeries::query()
            ->where('complete_status', 1)
            ->whereHas('userPurchases', function ($query) use ($user_id) {
                $query->where('user_id', $user_id);
            })
            ->with('getTSSet')
            ->limit(6)
            // ->select('id')
            ->get();

        $user_RA = $user_RA->map(function ($item) {
            $item->set_name = $item->getTSSet->set_name;
            unset($item->tsps_id, $item->set_id, $item->q_id, $item->total_answered, $item->current_timer, $item->time_taken, $item->end_date, $item->complete_status, $item->getTSSet);
            return $item;
        });


        return response()->json([
            'result' => $user_RA,
        ], 200);
    }

    public function get_user_set_result($uts_id)
    {
        $set_RA = UserTestStatus::query()
            ->where('uts_id', $uts_id)
            ->with(['questions.qTopic', 'UserTestSeries.getTSSet'])

            // ->select('id')
            ->get();
        $userTestStatuses = UserTestStatus::where('uts_id', $uts_id)->with(['questions.questionImage', 'questions.extraFields'])->get();
        $c = $this->get_question_index($userTestStatuses);
        $set_RA = $set_RA->map(function ($item) {
            $item->topic = $item->questions->qTopic->topic;
            $item->correct_option = $item->questions->correct_option;
            $item->set_name = $item->UserTestSeries->getTSSet->set_name;
            unset($item->questions, $item->UserTestSeries);
            return $item;
        });


        return response()->json([
            'result' => $set_RA,
            'index'=>$c['index']
        ], 200);
    }

    public function getTopicQuestion(Request $request)
    {
        $tstIds = $request->tst_id;
        $question = array_map(function ($item) {
            $temp = TestSeriesTopics::where('id', $item)
                ->with('getQuestion', function ($query) {
                    $query->limit(2);
                })
                ->first();
            $total_question = TestSeriesTopics::where('id', $item)
                ->with('getQuestion')
                ->first();
            // return   $total_question->getQuestion;
            $temp->total_questions = $total_question->getQuestion;
            foreach ($temp->getQuestion as $key => $value) {
                // dd($value);
                if ($value->extraFields) {
                    $temp->getQuestion[$key]->conversation = $value->extraFields->conversation;
                    $temp->getQuestion[$key]->paragraph = $value->extraFields->paragraph;
                }
                unset($temp->getQuestion[$key]->extraFields);
            }
            return $temp;
        }, $tstIds);
        // $total_question = TestSeriesTopics::whereIn('id', $tstIds)
        //     ->with('getQuestion')
        //     ->get();

        return response()->json([
            'message' => 'Success',
            'topic_questions' => $question,
            // 'total_questions' => $total_question
        ], 200);
    }
    public function get_marks_Distribution($uts_id)
    {
        $set_RA = UserTestSeries::query()
            ->where('id', $uts_id)
            // ->select('id')
            ->first();

        $marks = new stdClass();
        $marks->right_marks = $set_RA->total_marks;
        $marks->negative_marks = $set_RA->total_answered - $set_RA->total_marks;
        $marks->left_marks = 35 - $set_RA->total_answered;

        $question_marks = new stdClass();
        $question_marks->right_question = $set_RA->total_marks;
        $question_marks->negative_question = $set_RA->total_answered - $set_RA->total_marks;
        $question_marks->left_question = 35 - $set_RA->total_answered;
        return response()->json([
            'marks_distribution' => $marks,
            'question_distribution' => $question_marks
        ], 200);
    }

    public function get_question_time($uts_id)
    {
        $q_time = UserTestStatus::query()
            ->where('uts_id', $uts_id)
            // ->select('id')
            // ->orderBy('percentage')
            ->get('test_time');

        $q_time = $q_time->map(function ($item) {
            return $item->test_time;
        });

        return response()->json([
            'question_time' => $q_time,
        ], 200);
    }

    public function get_percentage_rank($set_id, $user_id)
    {

        $rank = $this->get_user_rank($set_id, $user_id);

        return response()->json([
            // 'question_time' => $q_time,
            'rank' => $rank['rank'],
            'percentage' => $rank['user_percentage'],
            'total_user' => $rank['total_user'],
            'total_percentage' => $rank['all_percentage'],
        ], 200);
    }

    public function get_overAll_percentage_limit($user_id)
    {
        $user_RA = UserTestSeries::query()
            ->where('complete_status', 1)
            ->whereHas('userPurchases', function ($query) use ($user_id) {
                $query->where('user_id', $user_id);
            })
            ->with('getTSSet')
            ->limit(6)
            // ->select('id')
            ->get();
        $temp = new stdClass();
        foreach ($user_RA as $item) {
            $temp->percentage[] = $item->percentage;
            $temp->total_marks[] = $item->total_marks;
            $temp->set_name[] = $item->getTSSet->set_name;
        }
        ;
        // $rank = $this->get_user_rank($set_id, $user_id);

        return response()->json([
            // 'question_time' => $q_time,
            'performance' => $temp
        ], 200);
    }

    public function get_user_set_question($status_id)
    {
        $questions = UserTestStatus::where('id', $status_id)
            ->with('questions')
            ->first();
        if ($questions->questions->extraFields) {
            $questions->questions->conversation = $questions->questions->extraFields->conversation;
            $questions->questions->paragraph = $questions->questions->extraFields->paragraph;
        }
        unset($questions->questions->extraFields);
        return response()->json([
            // 'question_time' => $q_time,
            'questions' => $questions
        ], 200);
    }


}
