<?php

namespace App\Http\Controllers\Api;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function register(Request $r)
    {
        $data = $r->validate([
            'name' => 'required',
            'email' => 'required|email|unique:users',
            'password' => 'required|confirmed|min:6'
        ]);
        $user = User::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'password' => bcrypt($data['password'])
        ]);
        return response()->json($user, 201);
    }

    public function login(Request $r)
    {
        try {
            // validasi sederhana dulu
            $r->validate(['email' => 'required|email', 'password' => 'required']);

            // jangan pakai Auth::attempt dulu, cek manual supaya mudah di-debug
            $user = User::where('email', $r->email)->first();
            if (!$user || !Hash::check($r->password, $user->password)) {
                return response()->json(['message' => 'Invalid credentials'], 401);
            }

            // token Sanctum
            $token = $user->createToken('api')->plainTextToken;

            return response()->json(['token' => $token]);
        } catch (\Throwable $e) {
            Log::error('LOGIN_FAIL', [
                'msg' => $e->getMessage(),
                'file' => $e->getFile(),
                'line' => $e->getLine(),
            ]);
            return response()->json([
                'error' => 'login_fail',
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    public function logout(Request $r)
    {
        $r->user()->currentAccessToken()->delete();
        return response()->json(['message' => 'Logged out']);
    }

}
