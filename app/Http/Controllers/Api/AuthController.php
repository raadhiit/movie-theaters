<?php

namespace App\Http\Controllers\Api;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Laravel\Sanctum\PersonalAccessToken;

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


    // public function login(Request $r)
    // {
    //     $cred = $r->validate([
    //         'email' => 'required|email',
    //         'password' => 'required'
    //     ]);
    //     if (!Auth::attempt($cred)) 
    //         return response()->json(['message' => 'Invalid credentials'], 401
    //     );
    //     $token = $r->user()->createToken('api')->plainTextToken;
    //     return response()->json(['token' => $token]);
    // }
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

    // public function logout(Request $request)
    // {
    //     try {
    //         // Pastikan route pakai middleware auth:sanctum
    //         $user = $request->user();
    //         if (!$user) {
    //             // Fallback: kalau guard tidak mengenali user, tetap coba matikan token dari header
    //             $bearer = $request->bearerToken();
    //             if (!$bearer) {
    //                 return response()->json(['message' => 'Not authenticated'], 401);
    //             }

    //             $accessToken = PersonalAccessToken::findToken($bearer);
    //             if (!$accessToken) {
    //                 // Token sudah tidak valid/terhapus
    //                 return response()->json(['message' => 'Already logged out'], 200);
    //             }

    //             $accessToken->delete();
    //             return response()->json(['message' => 'Logged out'], 200);
    //         }

    //         // Cara utama: hapus token yang sedang dipakai saat ini
    //         $token = $user->currentAccessToken();
    //         if ($token) {
    //             $token->delete();
    //         } else {
    //             // Fallback: gunakan bearer token bila currentAccessToken() null
    //             $bearer = $request->bearerToken();
    //             if ($bearer) {
    //                 if ($accessToken = PersonalAccessToken::findToken($bearer)) {
    //                     $accessToken->delete();
    //                 }
    //             }
    //         }

    //         // (Opsional untuk SPA berbasis cookie + session)
    //         // $request->session()->invalidate();
    //         // $request->session()->regenerateToken();

    //         return response()->json(['message' => 'Logged out'], 200);
    //     } catch (\Throwable $e) {
    //         Log::error('LOGOUT_FAIL', [
    //             'msg'  => $e->getMessage(),
    //             'file' => $e->getFile(),
    //             'line' => $e->getLine(),
    //         ]);
    //         return response()->json([
    //             'error'   => 'logout_fail',
    //             'message' => 'Unexpected error',
    //         ], 500);
    //     }
    // }
}
