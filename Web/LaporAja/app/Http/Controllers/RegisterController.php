<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;

class RegisterController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view("auth.regis");
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        try {
            $request->validate([
                'firstname' => 'required',
                'lastname' => 'required',
                'phonenumber' => 'numeric|required',
                'provinsi' => 'required',
                'kabkota' => 'required',
                'kecamatan' => 'required',
                'email' => 'required|unique:users,email|email:rfc,dns',
                'password' => 'min:8|required_with:confirmpassword',
                'confirmpassword' => 'min:8|same:password'
            ]);

            $user = User::create([
                'firstname' => ucwords(strtolower($request->firstname)),
                'lastname' => ucwords(strtolower($request->lastname)),
                'phonenumber' => $request->phonenumber,
                'provinsi' => ucwords(strtolower($request->provinsi)),
                'kabkota' => ucwords(strtolower($request->kabkota)),
                'kecamatan' => ucwords(strtolower($request->kecamatan)),
                'email' => $request->email,
                'password' => $request->password,
                'role' => "user"
            ]);

            $data = User::where('id','=',$user->id)->get();

            if ($data) {
                return redirect()->to('/login');
            } else {
                return back()->withErrors([
                   'message' => 'Terjadi kesalahan'
                ]);
            }
        } catch (Exception $error) {
            return back()->withErrors([
                'message' => 'Terjadi kesalahan'
            ]);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
