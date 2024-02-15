<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\ClientController;
use App\Http\Controllers\InventoryItemController;
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

//rutas para registrarse y login
Route::post('/login',[AuthController::class, 'login']);
Route::post('/register', [AuthController::class,'register']);

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();

// });
Route::middleware('auth:sanctum')->group(function(){
    Route::resource('/inventory-item'  , InventoryItemController::class);
    Route::post('/logout', function(Request $request){
        $request->user()->tokens()->delete();
        return response()->json(['success'=>true,'message' => 'Successfully logged out']);

    });

    //Client
    Route::get('/client', [ClientController::class, 'getAll']);

    //Inventory Item
});