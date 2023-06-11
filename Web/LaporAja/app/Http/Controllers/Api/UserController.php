<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Models\User;
use App\Http\Controllers\Controller;
use App\Http\Resources\UserResource;
use App\Http\Resources\UserCollection;
use App\Helpers\ApiFormatter;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = new UserCollection(User::all());

        if ($data) {
            return ApiFormatter::createApi(200, 'Success', $data);
        } else {
            return ApiFormatter::createApi(400, 'Failed');
        }
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
                'password' => 'min:8|required'
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
                return ApiFormatter::createApi(200, 'Success', $data);
            } else {
                return ApiFormatter::createApi(400, 'Failed');
            }
        } catch (Exception $error) {
            return ApiFormatter::createApi(400, 'Failed');
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(User $user)
    {
        $data =  new UserResource($user);

        if ($data) {
            return ApiFormatter::createApi(200, 'Success', $data);
        } else {
            return ApiFormatter::createApi(400, 'Failed');
        }
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
        try {
            $request->validate([
                'firstname' => 'required',
                'lastname' => 'required',
                'phonenumber' => 'numeric|required',
                'provinsi' => 'required',
                'kabkota' => 'required',
                'kecamatan' => 'required',
                'email' => 'required|email:rfc,dns',
                'password' => 'min:8|required'
            ]);

            $user = User::findOrFail($id);

            $user->update([
                'firstname' => ucwords(strtolower($request->firstname)),
                'lastname' => ucwords(strtolower($request->lastname)),
                'phonenumber' => $request->phonenumber,
                'provinsi' => ucwords(strtolower($request->provinsi)),
                'kabkota' => ucwords(strtolower($request->kabkota)),
                'kecamatan' => ucwords(strtolower($request->kecamatan)),
                'email' => $request->email,
                'password' => $request->password
            ]);

            $data = User::where('id','=',$user->id)->get();

            if ($data) {
                return ApiFormatter::createApi(200, 'Success', $data);
            } else {
                return ApiFormatter::createApi(400, 'Failed');
            }
        } catch (ValidationException $error) {
            return ApiFormatter::createApi(400, 'Failed');
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $user = User::findOrFail($id);

        $data = $user->forceDelete();
        
        if ($data) {
            return ApiFormatter::createApi(200, 'Success Destroy', $data);
        } else {
            return ApiFormatter::createApi(400, 'Failed');
        }
    }
}
