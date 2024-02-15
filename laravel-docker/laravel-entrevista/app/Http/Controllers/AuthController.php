<?php

namespace App\Http\Controllers;

use App\Http\Requests\LoginRequest;
use App\Http\Requests\RegisterRequest;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    //
    public function register(RegisterRequest $request){
        $user = new User();
        $user = new User();
        $user->name = $request->input('name');
        $user->email = $request->input('email');
        $user->rol_id = $request->input('rol_id');
        $user->password = Hash::make($request->input('password'));
        $user->save();
        $token = $user->createToken('flutter-app')->plainTextToken;
        return response()->json(['success'=>true, 'message'=>'User created', 'data'=>[
            'token'=>$token,
            'user'=>$user
        ]]);
    }

    public function login(LoginRequest $request){
        $user = $request->user();
        $token = $user->createToken('flutter-app')->plainTextToken;
        return response()->json(['success'=>true, 'message'=>'Correct login', 'data'=>[
            'token'=>$token,
            'user'=>$user
        ]]);
        
    }
}
