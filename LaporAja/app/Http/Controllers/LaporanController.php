<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Laporan;
use Illuminate\Http\Request;

class LaporanController extends Controller
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
        return view('lapor');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
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
            $request->session()->flash('success', 'Laporan berhasil ditambahkan!');
            return redirect()->to('/laporan');
        } else {
            return back()->withErrors([
                'message' => 'Terdapat kesalahan'
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
