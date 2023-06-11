<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Laporan;
use Illuminate\Http\Request;
use App\Http\Resources\LaporanCollection;
use App\Http\Resources\LaporanResource;
use App\Helpers\ApiFormatter;

class LaporanController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = new LaporanCollection(Laporan::all());

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
                'judul' => 'required',
                'alamat' => 'required',
                'provinsi' => 'required',
                'kabkota' => 'required',
                'kecamatan' => 'required',
                'deskripsi' => 'required',
            ]);

            $laporan = Laporan::create([
                'judul' => ucwords(strtolower($request->judul)),
                'user_id' => auth()->id(),
                'alamat' => $request->alamat,
                'provinsi' => ucwords(strtolower($request->provinsi)),
                'kabkota' => ucwords(strtolower($request->kabkota)),
                'kecamatan' => ucwords(strtolower($request->kecamatan)),
                'deskripsi' => $request->deskripsi,
                'status' => 'diproses',
            ]);

            $data = Laporan::where('id','=',$laporan->id)->get();

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
    public function show(Laporan $laporan)
    {
        $data =  new LaporanResource($laporan);

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
                'judul' => 'required',
                'user_id' => 'required',
                'alamat' => 'required',
                'provinsi' => 'required',
                'kabkota' => 'required',
                'kecamatan' => 'required',
                'deskripsi' => 'required',
                'status' => 'required'
            ]);

            $laporan = Laporan::findOrFail($id);

            $laporan->update([
                'judul' => ucwords(strtolower($request->judul)),
                'user_id' => $request->user_id,
                'alamat' => $request->alamat,
                'provinsi' => ucwords(strtolower($request->provinsi)),
                'kabkota' => ucwords(strtolower($request->kabkota)),
                'kecamatan' => ucwords(strtolower($request->kecamatan)),
                'deskripsi' => $request->deskripsi,
                'status' => $request->status,
            ]);

            $data = Laporan::where('id','=',$laporan->id)->get();

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
        $laporan = Laporan::findOrFail($id);

        $data = $laporan->delete();
        
        if ($data) {
            return ApiFormatter::createApi(200, 'Success Destroy', $data);
        } else {
            return ApiFormatter::createApi(400, 'Failed');
        }
    }
}
