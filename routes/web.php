<?php

use App\Extensions\Store;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return ['my' => 'name', 'is' => 'anik'];

    return view('welcome');
});

Route::get('publish', function (Request $request) {
    $message = $request->get('m') ?? sprintf('Message - %s', Carbon::now()->toDateTimeString());
    app('amqp')->publish($message);
    $sleep = $request->get('s');
    if (!empty($sleep)) {
        sleep($sleep);
    }

    return ['msg' => 'published'];
});

Route::get('store', function (Request $request) {
    $k = $request->get('k');
    $v = $request->get('v') ?? rand(1, 5000);

    app(Store::class)->store($v, $k);

    dump(app(Store::class)->items);
});
