<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

/**
 * @OA\Info(title="Api Laravel Entrevista", version="0.1")
 */
class ClientController extends Controller
{
    /**
     * @OA\Get(
     *     path="/api/client",
     *     @OA\Response(response="200", description="Get all clients")
     * )
     */
    public function getAll(Request $request)
    {
        $user = $request->user();
        $data = $user->offices()->get();
        return response()->json(["success" => true, 'data' => $data]);
    }
}
