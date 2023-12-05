<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpKernel\Exception\UnauthorizedHttpException;
use PHPOpenSourceSaver\JWTAuth\Exceptions\JWTException;
use PHPOpenSourceSaver\JWTAuth\Facades\JWTAuth;
use PHPOpenSourceSaver\JWTAuth\Http\Middleware\BaseMiddleware;

class AssignGuard extends BaseMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @param  null $role
     * @return mixed
     */
    public function handle($request, Closure $next, $role = null)
    {
        // if($guard != null)
        //     auth()->shouldUse($guard);
        // return $next($request);

        try {
             $token = JWTAuth::parseToken()->getToken('role');
             $token_role = JWTAuth::decode($token)->get('role');
        } catch (JWTException $e) {
            return response()->json(['error' => 'unAuthorized or token expired'], 401);
        }


        if ($token_role != $role) {
            return response()->json(['error' => 'unAuthorized'], 401);
        }
        return $next($request);

    }
}
