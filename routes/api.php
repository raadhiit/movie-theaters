<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Laravel\Sanctum\PersonalAccessToken;
use App\Http\Controllers\Api\{
    AuthController,
    MovieController,
    TheaterController,
    AuditoriumController,
    SeatController,
    ScreeningController,
    CustomerController,
    OrderController
};


// Route::get('/user', function (Request $request) {
//     return $request->user();
// })->middleware('auth:sanctum');

Route::get('ping', fn() => response()->json(['pong' => true]));


Route::prefix('auth')->group(function () {
    Route::post('register', [AuthController::class, 'register']);
    Route::post('login', [AuthController::class, 'login']);
    Route::post('logout', [AuthController::class, 'logout'])->middleware('auth:sanctum');
});

Route::middleware('auth:sanctum')->group(function () {

    Route::get('me', function (Request $r) {
        return response()->json([
            'user_id'  => optional($r->user())->id,
            'token_id' => optional($r->user()?->currentAccessToken())->id,
        ]);
    });

    Route::apiResource('movies', MovieController::class);
    Route::apiResource('theaters', TheaterController::class);
    Route::apiResource('auditoriums', AuditoriumController::class);
    Route::apiResource('seats', SeatController::class);
    Route::apiResource('customers', CustomerController::class);
    Route::apiResource('screenings', ScreeningController::class)->only(['index', 'show', 'store', 'destroy']);
    Route::get('screenings/{screening}/available-seats', [ScreeningController::class, 'availableSeats']);

    Route::post('orders', [OrderController::class, 'store']);
    Route::get('orders/{order}', [OrderController::class, 'show']);
    Route::post('orders/{order}/items', [OrderController::class, 'addItem']);
    Route::post('orders/{order}/pay', [OrderController::class, 'pay']);
    Route::get('orders/{order}/tickets', [OrderController::class, 'tickets']);
});
