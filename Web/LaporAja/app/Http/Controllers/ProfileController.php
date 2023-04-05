<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Laporan;

class ProfileController extends Controller
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
        if (auth()->getUser()->isAdmin()) {
            $laporan = Laporan::with('user')->where('provinsi','=',auth()->getUser()->provinsi)
                ->orWhere('user_id','=',auth()->id())
                ->get();
            return view('profile', [
                'laporan' => $laporan
            ]);
        }
        $laporan = Laporan::with('user')->where('user_id','=',auth()->id())->get();
        return view('profile', [
            'laporan' => $laporan
        ]);
    }

    public function create_selesai()
    {
        if (auth()->getUser()->isAdmin()) {
            $laporan = Laporan::with('user')->where('provinsi','=',auth()->getUser()->provinsi)
                ->where('status','=','selesai')
                ->orWhere('user_id','=',auth()->id())
                ->where('status','=','selesai')
                ->get();
            return view('dashboard-selesai', [
                'laporan' => $laporan
            ]);
        }
        $laporan = Laporan::with('user')->where('user_id','=',auth()->id())
            ->where('status','=','selesai')->get();
        return view('dashboard-selesai', [
            'laporan' => $laporan
        ]);
    }

    public function create_ditolak()
    {
        if (auth()->getUser()->isAdmin()) {
            $laporan = Laporan::with('user')->where('provinsi','=',auth()->getUser()->provinsi)
                ->where('status','=','ditolak')
                ->orWhere('user_id','=',auth()->id())
                ->where('status','=','ditolak')
                ->get();
            return view('dashboard-ditolak', [
                'laporan' => $laporan
            ]);
        }
        $laporan = Laporan::with('user')->where('user_id','=',auth()->id())
            ->where('status','=','ditolak')
            ->get();
        return view('dashboard-ditolak', [
            'laporan' => $laporan
        ]);
    }

    public function create_progres()
    {
        if (auth()->getUser()->isAdmin()) {
            $laporan = Laporan::with('user')->where('provinsi','=',auth()->getUser()->provinsi)
                ->where('status','=','diproses')
                ->orWhere('user_id','=',auth()->id())    
                ->where('status','=','diproses')
                ->get();
            return view('dashboard-progres', [
                'laporan' => $laporan
            ]);
        }
        $laporan = Laporan::with('user')->where('user_id','=',auth()->id())
            ->where('status','=','diproses')->get();
        return view('dashboard-progres', [
            'laporan' => $laporan
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
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
        $laporan = Laporan::find($id);
        return view('edit', [
            'laporan' => $laporan
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
        $laporan = Laporan::find($id);
        $laporan->admin_id = auth()->id();
        $laporan->status = $request->status;
        $laporan->save();

        session()->flash('success', 'Laporan berhasil ditanggapi!');
        return redirect()->route('profile');
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
            $laporan = Laporan::where('id', $id)
                    ->delete();
        } else {
            $laporan = Laporan::where('id', $id)
                    ->where('user_id',auth()->id())
                    ->delete();
        }
        session()->flash('success', 'Laporan berhasil dihapus!');
        return redirect()->back();
    }

    public function logout(Request $request)
    {
        auth()->logout();
        $request->session()->flash('success', 'Anda telah log out');
        return redirect()->to('/dashboard');
    }
}
