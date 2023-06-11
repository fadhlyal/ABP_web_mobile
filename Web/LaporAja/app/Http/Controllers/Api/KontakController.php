<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Resources\KontakResource;
use App\Http\Resources\KontakCollection;
use App\Models\KontakPenting;
use App\Helpers\ApiFormatter;

class KontakController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = new KontakCollection(KontakPenting::all());

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
                'jenisinstansi' => 'required',
                'admin_id' => 'required',
                'namainstansi' => 'required',
                'nomortelepon' => 'required',
                'alamat' => 'required'
            ]);

            $kontak = KontakPenting::create([
                'admin_id' => $request->admin_id,
                'jenisinstansi' => ucwords(strtolower($request->jenisinstansi)),
                'namainstansi' => ucwords(strtolower($request->namainstansi)),
                'nomortelepon' => $request->nomortelepon,
                'alamat' => ucwords(strtolower($request->alamat))
            ]);

            $data = KontakPenting::where('id','=',$kontak->id)->get();

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
    public function show(KontakPenting $kontakpenting)
    {
        $data =  new KontakResource($kontakpenting);

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
                'jenisinstansi' => 'required',
                'admin_id' => 'required',
                'namainstansi' => 'required',
                'nomortelepon' => 'required',
                'alamat' => 'required'
            ]);

            $kontak = KontakPenting::findOrFail($id);

            $kontak->update([
                'admin_id' => $request->admin_id,
                'jenisinstansi' => ucwords(strtolower($request->jenisinstansi)),
                'namainstansi' => ucwords(strtolower($request->namainstansi)),
                'nomortelepon' => $request->nomortelepon,
                'alamat' => ucwords(strtolower($request->alamat))
            ]);

            $data = KontakPenting::where('id','=',$kontak->id)->get();

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
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $kontakpenting = KontakPenting::findOrFail($id);

        $data = $kontakpenting->delete();
        
        if ($data) {
            return ApiFormatter::createApi(200, 'Success Destroy', $data);
        } else {
            return ApiFormatter::createApi(400, 'Failed');
        }
    }
}
