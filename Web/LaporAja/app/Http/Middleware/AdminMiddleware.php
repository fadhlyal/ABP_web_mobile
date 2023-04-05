<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use App\Providers\RouteServiceProvider;
use Illuminate\Support\Facades\Auth;
use Illuminate\Contracts\Auth\Guard;

class AdminMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle($request, Closure $next, $guard = null)
    {
        if (Auth::guard($guard)->guest()) {
            if ($request->ajax()) {
                $request->session()->flash('error', 'Anda bukanlah admin!');
                return redirect()->route(RouteServiceProvider::HOME);
            } else {
                $request->session()->flash('error', 'Silahkan Log In terlebih dahulu');
                return redirect()->route('login');
            }
        } else if (!Auth::guard($guard)->user()->isAdmin()) {
            $request->session()->flash('error', 'Silahkan Log In terlebih dahulu');
            return redirect()->route('login');
        }

        return $next($request);

    }
}
