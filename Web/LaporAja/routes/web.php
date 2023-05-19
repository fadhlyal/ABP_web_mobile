<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\RegisterController;
use App\Http\Controllers\LaporanController;
use App\Http\Controllers\ForumController;
use App\Http\Controllers\KontakController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\AkunController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Route::group(['middleware' => ['guest']], function() {
    Route::get('/login', [LoginController::class, 'create'])->name('login');
    Route::post('/login', [LoginController::class, 'store']);

    Route::get('/register', [RegisterController::class, 'create'])->name('register');
    Route::post('/register', [RegisterController::class, 'store']);
});

Route::group(['middleware' => ['auth']], function() {
    Route::get('/laporan', [LaporanController::class, 'create'])->name('laporan');
    Route::post('/laporan', [LaporanController::class, 'store']);

    Route::get('/logout', [ProfileController::class, 'logout'])->name('logout');
    
    Route::get('/profilelaporan',[ProfileController::class, 'index'])->name('profile');
    Route::get('/profilelaporan/laporan-selesai',[ProfileController::class, 'index_selesai']);
    Route::get('/profilelaporan/laporan-diproses',[ProfileController::class, 'index_progres']);
    Route::get('/profilelaporan/laporan-ditolak',[ProfileController::class, 'index_ditolak']);
    Route::delete('/profilelaporan/delete/{id}',[ProfileController::class, 'destroy'])->name('laporan.delete');

    Route::get('/akun', [AkunController::class, 'index'])->name('akun');
    Route::get('/akun/ubahemail/{id}', [AkunController::class, 'edit'])->name('akun.edit');
    Route::post('/akun/ubahemail/update/{id}', [AkunController::class, 'update'])->name('akun.update');
    Route::delete('/akun/delete/{id}',[AkunController::class, 'destroy'])->name('akun.delete');
});

Route::group(['middleware' => ['admin']], function() {
    Route::get('/kontakdarurat/tambah',[KontakController::class, 'create'])->name('tambahkontak');
    Route::post('/kontakdarurat/tambah',[KontakController::class, 'store']);
    Route::get('/kontakdarurat/edit/{id}', [KontakController::class, 'edit'])->name('kontak.edit');
    Route::post('/kontakdarurat/edit/update/{id}', [KontakController::class, 'update'])->name('kontak.update');
    Route::delete('/kontakdarurat/delete/{id}',[KontakController::class, 'destroy'])->name('kontak.delete');

    Route::get('/profilelaporan/edit/{id}', [ProfileController::class, 'edit'])->name('laporan.edit');
    Route::post('/profilelaporan/edit/update/{id}', [ProfileController::class, 'update'])->name('laporan.update');;
});

Route::get('/forum', [LaporanController::class, 'index'])->name('forum');

Route::get('/kontakdarurat', [KontakController::class, 'index'])->name('kontak');

Route::get('/dashboard', function() {
    return view('landingpage');
})->name('dashboard');

Route::redirect('/', '/dashboard');