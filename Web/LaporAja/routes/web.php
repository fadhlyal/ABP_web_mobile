<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\RegisterController;
use App\Http\Controllers\LaporanController;
use App\Http\Controllers\ForumController;
use App\Http\Controllers\KontakController;
use App\Http\Controllers\ProfileController;
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
    
    Route::get('/profile',[ProfileController::class, 'create'])->name('profile');
    Route::get('/profile/laporan-selesai',[ProfileController::class, 'create_selesai']);
    Route::get('/profile/laporan-diproses',[ProfileController::class, 'create_progres']);
    Route::get('/profile/laporan-ditolak',[ProfileController::class, 'create_ditolak']);
    Route::delete('/profile/delete/{id}',[ProfileController::class, 'destroy'])->name('laporan.delete');
});

Route::group(['middleware' => ['admin']], function() {
    Route::get('/kontakdarurat/tambah',[KontakController::class, 'add'])->name('tambahkontak');
    Route::post('/kontakdarurat/tambah',[KontakController::class, 'store']);

    Route::get('/dashboard/edit/{id}', [ProfileController::class, 'edit'])->name('edit');
    Route::post('/dashboard/edit/update/{id}', [ProfileController::class, 'update'])->name('laporan.update');;
});

Route::get('/forum', [ForumController::class, 'create'])->name('forum');

Route::get('/kontakdarurat', [KontakController::class, 'create'])->name('kontak');

Route::get('/dashboard', function() {
    return view('landingpage');
})->name('dashboard');

Route::redirect('/', '/dashboard');