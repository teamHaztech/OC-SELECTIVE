<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Cart;
use App\Models\Question;
use App\Models\TestSeries;
use App\Models\TestSeriesCategories;
use App\Models\TestSeriesProduct;
use App\Models\TestSeriesPurchases;
use App\Models\TestSeriesTopics;
use App\Models\TSPCSet;
use App\Models\TSProductCategory;
use App\Models\UserTestSeries;
use Carbon\Carbon;
use DateTime;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class ProductController extends Controller
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
    public function getTestSeriesTopics($id)
    {

        $tst = TestSeriesTopics::query()
            ->where('tsc_id', $id)
            ->get();


        return response()->json([
            'tst' => $tst,
        ], 200);
    }
    public function getAdminTestSeries()
    {

        $ts = TestSeries::query()
            ->get();

        $tsc = TestSeriesCategories::query()
            ->get();

        return response()->json([
            'ts' => $ts,
            'tsc' => $tsc,
        ], 200);
    }
    public function getTestSeries()
    {
        $ts = TestSeries::query()
            ->get();

        // $tsc = TestSeriesCategories::query()
        //     ->get();

        return response()->json([
            'ts' => $ts,
            // 'tsc' => $tsc,
        ], 200);
    }

    public function showAdminProduct($ts_id)
    {
        // return $request->input();
        $tst = TestSeriesProduct::query()
            ->where('ts_id', $ts_id)
            ->with('tsPurchases')
            ->get();

        $tstWithCounts = $tst->map(function ($testSeriesProduct) {
            $testSeriesProduct->purchaseCount = $testSeriesProduct->tsPurchases->count();
            unset($testSeriesProduct->tsPurchases);
            return $testSeriesProduct;
        });

        return response()->json([
            'product' => $tstWithCounts
        ], 200);
    }

    public function checkUserPurchaseExpire($user_id)
    {

        $current_date = date('d-m-Y');
        $purchases = TestSeriesPurchases::query()
            ->where('user_id', $user_id)
            ->where('status', 1)
            // ->whereHas('tsProduct', function ($query) use ($ts_id) {
            //     $query->where('ts_id', $ts_id);
            // })
            ->with('tsProduct')
            ->get();
        $date = new DateTime($current_date);


        // $current_date = $date->format('Y-m-d');
        // return   $purchases;
        $pre_exp_purchase = [];
        // print($value);
        foreach ($purchases as $value) {
            $valid_till = new DateTime($value->valid_till);

            if ($date > $valid_till) {
                // print_r ($date);
                // print_r ($valid_till);
                TestSeriesPurchases::query()
                    ->where('id', $value->id)
                    ->update(['status' => 0]);
            }


            $interval = $date->diff($valid_till);
            // echo $interval->days;
            if ($interval->days < 15 && $date <= $valid_till) {
                $value->p_name = $value->tsProduct->p_name;
                $value->remaining_days = $interval->days;
                unset($value->tsProduct);
                $pre_exp_purchase[] = $value;
            }

        }
        ;

        if (count($pre_exp_purchase) == 0) {
            return response()->json([
                'message' => 'no purchase is being expired',
                'tsp' => []
            ], 200);
        }

        return response()->json([
            'message' => 'getting Expired',
            'tsp' => $pre_exp_purchase,
        ], 200);
    }

    public function getTSPurchases($ts_id)
    {
        $current_date = date('d-m-Y');
        $purchases = TestSeriesPurchases::query()
            ->where('user_id', Auth()->id())
            ->where('status', 1)
            ->where(function ($query) use ($current_date) {
                $query->whereRaw('STR_TO_DATE(valid_till, "%d-%m-%Y") >= STR_TO_DATE(?, "%d-%m-%Y")', [$current_date]);
            })
            ->whereHas('tsProduct', function ($query) use ($ts_id) {
                $query->where('ts_id', $ts_id);
            })
            ->with('tsProduct')
            ->with([
                'tsProduct' => function ($query) {
                    $query->with(
                        'getTsProductCategory.testSeriesCategories',
                        'getTsProductCategory.tsPCSet'
                    );
                }
            ])

            ->get();
        $date1 = DateTime::createFromFormat('d-m-Y', "16-04-2024");

        // return [
        // $purchases,
        // $current_date,
        // ($purchases[1]->valid_till>= $current_date),
        // (  $date1>=  $current_date)
        // ];
        $new_purchases = [];
        if (count($purchases->toArray()) == 0) {
            return response()->json([
                'tsp' => $new_purchases,
            ], 200);
        }
        foreach ($purchases as $key => $value) {

            $temp_data = $value->tsProduct->getTsProductCategory;
            $test_data = array_column($temp_data->toArray(), 'test_series_categories');

            $value->category = collect($test_data)->map(function ($item, $key) use ($temp_data) {
                $item['set'] = $temp_data[$key]->tsPCSet;
                return $item;
            })->all();

            foreach ($value->category as $value2) {

                //

                $timer = $this->get_Topic_detail($value2['id'], $value->tsProduct->ts_id)["time"];
                foreach ($value2['set'] as $value3) {
                    $complete_status = UserTestSeries::where("tsps_id", $value->id)->where("set_id", $value3->id)->where("complete_status", 1)->get();
                    // echo $complete_status;
                    $value3->complete_status = count($complete_status) != 0 ? 1 : 0;
                    $value3->purchase_id = $value->id;
                    $value3->valid_from = $value->valid_from;
                    $value3->valid_till = $value->valid_till;
                    $value3->tsc_type = $value2['tsc_type'];
                    $value3->duration = $timer;
                    $new_purchases[] = $value3;
                    $value3->package_name = $value->tsProduct->p_name;
                }
            }
            unset($value->tsProduct);
            // $new_purchases= [
            // return $value;

            //     'set'=>$value->test_data
            // ];
        }
        // unset($purchases->tsproduct)
        return response()->json([
            // 'tsp' => $purchases,
            'tsp' => $new_purchases
            //
        ], 200);
    }
    public function getTSDetails($uts_id)
    {

        $temp = UserTestSeries::query()
            ->where('id', $uts_id)
            ->with('userPurchases.tsProduct')
            ->first();

        $uts_id = $temp->id;
        $purchase = $temp->userPurchases;
        $detail = UserTestSeries::query()
            ->where('id', $uts_id)
            ->with('getTSSet.getTsPC.testSeriesCategories')
            ->first();
        $timer = $this->get_Topic_detail($detail->getTSSet->getTsPC->testSeriesCategories->id, $temp->userPurchases->tsProduct->ts_id);
        $test_detail = $detail->getTSSet;
        return response()->json([
            'subject' => $test_detail->getTsPC->testSeriesCategories->tsc_type,
            'set_name' => $test_detail->set_name,
            'total_question' => $timer["question_number"],
            'uts_id' => $uts_id,
            'duration' => $timer["time"],
            'p_name' => $purchase->tsproduct->p_name
        ], 200);
    }
    public function getTSPurchasesId($id = null)
    {
        $tsp = TestSeriesPurchases::query()
            ->where('user_id', Auth()->id())
            ->where("status", 1)
            ->get();
        $pc = [];
        foreach ($tsp as $key => $value) {
            $pc[] = $value->tsp_id;
        }

        return response()->json([
            'tsp' => $pc
        ], 200);
    }
    public function addCart(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'p_id' => 'required',
            'u_id' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }
        $cart_data = "";
        if (is_array($request->p_id)) {

            foreach ($request->p_id as $item) {

                $id = TestSeriesPurchases::query()
                    ->where([
                        'user_id' => $request->u_id,
                        'tsp_id' => $item,
                    ])->first();
                if ($id)
                    continue;

                $cart_data = Cart::query()
                    ->create([
                        'user_id' => $request->u_id,
                        'tsp_id' => $item,
                    ]);
            }

        } else {
            $id = TestSeriesPurchases::query()
                ->where([
                    'user_id' => $request->u_id,
                    'tsp_id' => $request->p_id,
                ])->first();

            if ($id)
                return response()->json([
                    'message' => 'Already purchased'
                ], 200);

            $cart_data = Cart::query()
                ->create
                ([
                        'user_id' => $request->u_id,
                        'tsp_id' => $request->p_id,
                    ]);
        }

        return response()->json([
            'message' => 'Added successfully',
            $cart_data
        ], 200);

    }

    public function showCart($id)
    {
        $cart = Cart::query()
            ->where('user_id', $id)
            ->select('tsp_id')
            ->with('tsProduct')
            ->get();

        // $product = TestSeriesProduct::query()
        // ->whereIn('id',$cart)
        // ->get();


        return response()->json([
            'cart_data' => $cart,
            'message' => 'Successful'
        ], 200);
    }

    public function removeCart($id)
    {
        $user = Auth::user()->id;
        $cart = Cart::query()
            ->where('tsp_id', $id)
            ->where('user_id', $user)
            ->firstOrFail()
            ->delete();

        if (!$cart) {
            return response()->json(['error', 'not found'], 404);
        }

        return response()->json([
            'message' => 'Successfully item deleted',
            'id' => $id
        ], 200);
    }

    public function showProduct($id = null)
    {
        $current_date = date('Y-m-d');
        // return $current_date;
        $products = TestSeriesProduct::query()
            ->where('status', 1)
            ->where('release_date', "<=", $current_date)
            ->when($id, function ($query, $id) {
                return $query->where('ts_id', $id);
            })
            ->whereHas('getTsProductCategory', function ($query) {
                $query->whereNot('total_set', null);
            })
            ->get(['*']);

        return response()->json([
            'product_data' => $products,
            'message' => 'Successful'
        ], 200);
    }
    public function sProduct($id)
    {
        $product = TestSeriesProduct::query()
            ->where('id', $id)
            ->first();

        return response()->json([
            'product_data' => $product,
            'message' => 'Successful'
        ], 200);
    }
    public function addTSPurchases(request $request)
    {
        // return !!is_array($request->p_id);
        $p = TestSeriesPurchases::query()
            ->when(is_array($request->p_id), function ($query) use ($request) {
                $query->whereIn('tsp_id', $request->p_id);
            })
            ->when(!is_array($request->p_id), function ($query) use ($request) {
                $query->where('tsp_id', $request->p_id);
            })
            ->where('user_id', Auth()->id())
            ->get();


        Cart::query()
            ->where('user_id', Auth()->id())
            ->when(is_array($request->p_id), function ($query) use ($request) {
                $query->whereIn('tsp_id', $request->p_id);
            })
            ->when(!is_array($request->p_id), function ($query) use ($request) {
                $query->where('tsp_id', $request->p_id);
            })
            // ->firstOrFail()
            ->delete();

        // return count($p);
        if (count($p) != 0) {
            return response()->json([
                'message' => 'Already Purchased',
                'purchases' => $p
            ], 406);
        }


        // $current = Carbon::now();
        $current_date = date('d-m-Y');
        // $product = TestSeriesProduct::query()
        //     ->where('id', $request->p_id)
        //     ->first();


        // $last_date = date('Y-m-d', strtotime('+' . (string) $product->test_month_limit . ' months'));
        // return $current_date;

        if (is_array($request->p_id)) {
            foreach ($request->p_id as $value) {
                $product = TestSeriesProduct::query()
                    ->where('id', $value)
                    ->first();

                $last_date = date('d-m-Y', strtotime('+' . (string) $product->test_month_limit . ' months'));
                TestSeriesPurchases::query()
                    ->updateOrInsert([
                        'user_id' => Auth()->id(),
                        'tsp_id' => $value,
                        'valid_from' => $current_date,
                        'valid_till' => $last_date,
                        'order_id' => $request->order_id
                    ]);
            }
        } else {
            $product = TestSeriesProduct::query()
                ->where('id', $request->p_id)
                ->first();

            $last_date = date('Y-m-d', strtotime('+' . (string) $product->test_month_limit . ' months'));
            TestSeriesPurchases::query()
                ->updateOrInsert([
                    'user_id' => Auth()->id(),
                    'tsp_id' => $request->p_id,
                    'valid_from' => $current_date,
                    'valid_till' => $last_date,
                ]);
        }



        return response()->json([
            'message' => 'Added Successfully'
        ], 200);
    }
    public function getLatestProduct($user_id)
    {
        $current_date = date('Y-m-d');
        $products = TestSeriesProduct::query()
            ->where('release_date', '<=', $current_date)
            ->orderBy('release_date', 'desc')
            ->whereHas('getTsProductCategory', function ($query) {
                $query->whereNot('total_set', null);
            })
            ->get('id');

        $purchases = TestSeriesPurchases::query()->where('user_id', $user_id)->get(['tsp_id']);
        $purchases_ids = $purchases->pluck('tsp_id')->toArray();

        $p_id = "";
        foreach ($products as $product) {

            if (!in_array($product->id, $purchases_ids)) {
                $p_id = $product->id;
                break;
            }
        }

        // return $p_id;

        if ($p_id) {
            return response()->json([
                'latest_product_id' => $p_id
            ], 200);
        }
        return response()->json([
            'message' => "No latest Product"
        ], 404);
    }


    public function getSampleQuestion()
    {
        $oc_topic = TestSeriesTopics::whereIn("tsc_id", [1, 3])->where('ts_id', 1)->get();
        $selective_topic = TestSeriesTopics::whereIn("tsc_id", [1, 3])->where('ts_id', 2)->get();
        $oc_question = [];
        $selective_question = [];
        function getRandomQuestion($topicSet)
        {
            if (count($topicSet) > 0) {
                $randomIndex = rand(0, count($topicSet) - 1);
                return Question::where('tst_id', $topicSet[$randomIndex]->id)->with('questionImage')->first();
            }
            return null;
        }
        for ($i = 0; $i < 4; $i++) {
            $oc_question[] = getRandomQuestion($oc_topic);
        }

        // Fetch 4 random questions for Selective
        for ($i = 0; $i < 4; $i++) {
            $selective_question[] = getRandomQuestion($selective_topic);
        }
        return response()->json([
            'oc_question' => $oc_question,
            'selective_question' => $selective_question
        ], 200);
    }

}
