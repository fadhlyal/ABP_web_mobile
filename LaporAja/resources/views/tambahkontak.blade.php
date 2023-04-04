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
        <a href="#"><img src="\images\logo header.png" class="logo" alt=""></a>

        <div>
            <ul id="navbar">
                <li><a href="/dashboard">Beranda</a></li>
                <li><a href="/laporan">Laporan</a></li>
                <li><a href="/forum">Forum</a></li>
                <li><a class="active" href="/kontakdarurat">Kontak</a></li>
                @if (auth()->check())
                    @if (Auth::user()->isAdmin())
                        <li><a href="/profile">Tanggapi</a></li>
                    @endif
                    <li>|</li>
                    <li><a href="/profile"><i class="fa-solid fa-user"></i></a></li>
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
        <!-- <h1 class="text">Tulis laporan kamu disini!</h1> -->
        @include('partial.alert')
        <form method="POST" action="/kontakdarurat/tambah" class="row g-3">
            @csrf
            <select class="form-select" aria-label="Default select example" name="jenisinstansi">
                <option value="Rumah Sakit"selected>Rumah Sakit</option>
                <option value="Kantor Polisi">Polisi</option>
                <option value="Kantor Pemadam">Pemadam Kebakaran</option>
            </select>

            <!-- <div class="col-12">
                <input type="text" class="form-control" id="inputAddress" placeholder="Jenis Instansi">
            </div> -->

            <div class="col-12">
                <input type="text" class="form-control" id="inputAddress" name="namainstansi" placeholder="Nama Instansi" required>
            </div>

            <div class="col-12">
                <input type="text" class="form-control" id="inputAddress" name="nomortelepon" placeholder="Nomor" required>
            </div>
            <div class="col-12">
                <input type="text" class="form-control" id="inputAddress2" name="alamat" placeholder="Alamat" required>
            </div>

            <section id="but">
              <div class="col-12">
                <button type="submit" class="btn btn-primary">Kirim</button>
              </div>
            </section>

          <!-- <form class="row g-3 needs-validation" novalidate>
            <div class="col-md-4">              
              <input type="text" class="form-control" id="validationCustom01" value="Provinsi" required>
            </div>
            <div class="col-md-4">              
              <input type="text" class="form-control" id="validationCustom02" value="Kab/Kota" required>
            </div>
            <div class="col-md-4">              
              <div class="input-group has-validation">                
                <input type="text" class="form-control" id="validationCustom02" value="Kecamatan" required>
              </div>
            </div> -->

          <!-- <div class="col-12">
            <button type="submit" class="btn btn-primary">Kirim</button>
          </div> -->
        </form>
      </main>
  </body>