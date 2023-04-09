<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\KontakPenting;

class KontakController extends Controller
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
        $rumahsakit =  KontakPenting::where('jenisinstansi','=', 'Rumah Sakit')->get();
        $polisi = KontakPenting::where('jenisinstansi','=', 'Kantor Polisi')->get();
        $pemadam = KontakPenting::where('jenisinstansi','=', 'Kantor Pemadam')->get();
        return view('telepon', [
            'rumahsakit' => $rumahsakit,
            'polisi' => $polisi,
            'pemadam' => $pemadam
        ]);
    }

    public function add()
    {
        return view('tambahkontak');
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
            'jenisinstansi' => 'required',
            'namainstansi' => 'required',
            'nomortelepon' => 'required',
            'alamat' => 'required'
        ]);

        $kontak = KontakPenting::create([
            'admin_id' => auth()->id(),
            'jenisinstansi' => ucwords(strtolower($request->jenisinstansi)),
            'namainstansi' => ucwords(strtolower($request->namainstansi)),
            'nomortelepon' => $request->nomortelepon,
            'alamat' => ucwords(strtolower($request->alamat))
        ]);

        $data = KontakPenting::where('id','=',$kontak->id)->get();

        if ($data) {
            $request->session()->flash('success', 'Kontak penting berhasil ditambahkan!');
            return redirect()->to('/kontakdarurat/tambah');
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
        $kontak = KontakPenting::find($id);
        return view('gantikontak', [
            'kontak' => $kontak
        ]);
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
        $kontak = KontakPenting::find($id);
        $kontak->admin_id = auth()->id();
        $kontak->namainstansi = $request->namainstansi;
        $kontak->nomortelepon = $request->nomortelepon;
        $kontak->alamat = $request->alamat;
        $kontak->save();

        session()->flash('success', 'Kontak berhasil diubah!');
        return redirect()->route('kontak');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        if (auth()->getUser()->isAdmin()) {
            $kontak = KontakPenting::where('id', $id)
                    ->delete();
        }
        session()->flash('success', 'Kontak berhasil dihapus!');
        return redirect()->route('kontak');
    }
}
