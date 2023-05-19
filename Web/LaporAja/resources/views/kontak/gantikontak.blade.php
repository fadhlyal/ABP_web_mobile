<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-widt initial-scale=1">
        <link rel="stylesheet" href="\css\style.css">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
        <script src="https://kit.fontawesome.com/1b514b8e9a.js" crossorigin="anonymous"></script>

        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">

        <title>Tambah Kontak</title>
    </head>



    <body>
    <section id="header">
        <a href="/dashboard"><img src="images\logo header.png" class="logo" alt=""></a>

        <div>
            <ul id="navbar">
                <li><a href="/dashboard">Beranda</a></li>
                <li><a href="/laporan">Laporan</a></li>
                <li><a href="/forum">Forum</a></li>
                <li><a class="active" href="/kontakdarurat">Kontak</a></li>
                @if (auth()->check())
                    @if (Auth::user()->isAdmin())
                        <li><a href="/profilelaporan">Tanggapi</a></li>
                    @endif
                    <li>|</li>
                    <li><a href="/akun"><i class="fa-solid fa-user"></i></a></li>
                @else
                    <li>|</li>
                    <li><a href="/login">Masuk</a></li>
                    <li><a href="/register">Daftar</a></li> 
                @endif
            </ul>
        </div>
    </section>

    <section id="textsatu">
        <h1>Tambahkan Nomer Penting dibawah!</h1>
    </section>

      <main class="px-3">
        @include('partial.alert')
        <form method="POST" action="{{route('kontak.update', $kontak->id)}}" class="row g-3">
            @csrf
            @if($kontak->jenisinstansi=='Rumah Sakit')
            <select class="form-select" aria-label="Default select example" name="jenisinstansi">
                <option value="Rumah Sakit"selected>Rumah Sakit</option>
                <option value="Kantor Polisi">Polisi</option>
                <option value="Kantor Pemadam">Pemadam Kebakaran</option>
            </select>
            @elseif($kontak->jenisinstansi=='Kantor Polisi')
            <select class="form-select" aria-label="Default select example" name="jenisinstansi">
                <option value="Rumah Sakit">Rumah Sakit</option>
                <option value="Kantor Polisi"selected>Polisi</option>
                <option value="Kantor Pemadam">Pemadam Kebakaran</option>
            </select>
            @elseif($kontak->jenisinstansi=='Kantor Pemadam')
            <select class="form-select" aria-label="Default select example" name="jenisinstansi">
                <option value="Rumah Sakit">Rumah Sakit</option>
                <option value="Kantor Polisi">Polisi</option>
                <option value="Kantor Pemadam"selected>Pemadam Kebakaran</option>
            </select>
            @endif
              
            <div class="col-12">
              <input type="text" class="form-control" id="inputAddress" name="namainstansi" value="{{$kontak->namainstansi}}" required>
            </div>
            <div class="col-12">
              <input type="text" class="form-control" id="inputAddress" name="nomortelepon" value="{{$kontak->nomortelepon}}" required>
            </div>
            <div class="col-12">
              <input type="text" class="form-control" id="inputAddress2" name="alamat" value="{{$kontak->alamat}}" required>
            </div>

            <section id="but">
              <a href="/kontakdarurat"><button type="button" class="btn btn-danger">Batal</button></a>
              <button type="submit" class="btn btn-primary">Ganti</button>
            </section>
        </form>
      </main>
  </body>