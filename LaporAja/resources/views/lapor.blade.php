<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-widt initial-scale=1">
        <link rel="stylesheet" href="css\style.css">
        <title>Laporan</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>

        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
        <script src="https://kit.fontawesome.com/1b514b8e9a.js" crossorigin="anonymous"></script>
    </head>



    <body>
    <section id="header">
        <a href="/dashboard"><img src="images\logo header.png" class="logo" alt=""></a>

        <div>
            <ul id="navbar">
                <li><a href="/dashboard">Beranda</a></li>
                <li><a class="active" href="/laporan">Laporan</a></li>
                <li><a href="/forum">Forum</a></li>
                <li><a href="/kontakdarurat">Kontak</a></li>
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
        <h1>Tulis laporan kamu disini!</h1>
    </section>

      <main class="px-3">
        <!-- <h1 class="text">Tulis laporan kamu disini!</h1> -->
        @include('partial.alert')
        <form method="POST" action="/laporan" class="row g-3">
          @csrf
          <div class="col-12">
            <input type="text" class="form-control" name='judul' id="inputAddress" placeholder="Judul"required>
          </div>
          <div class="col-12">
            <input type="text" class="form-control" name='alamat' id="inputAddress2" placeholder="Alamat"required>
          </div>

          
            <div class="col-md-4">              
              <input type="text" class="form-control" name='provinsi' id="validationCustom01" placeholder="Provinsi" value='{{ Auth::user()->provinsi }}' required>
            </div>
            <div class="col-md-4">              
              <input type="text" class="form-control" name='kabkota' id="validationCustom02" placeholder="Kab/Kota" value='{{ Auth::user()->kabkota }}' required>
            </div>
            <div class="col-md-4">
              <div class="input-group has-validation">    
                <input type="text" class="form-control" name='kecamatan' id="validationCustom02" placeholder="Kecamatan" value='{{ Auth::user()->kecamatan }}' required>
              </div>
            </div>

<!-- 
          <div class="col-12">            
            <input type="text" class="form-control" id="inputAddress" placeholder="Nama Pelapor">
          </div> -->
          <div class="form-floating">
            <textarea class="form-control" name='deskripsi' placeholder="Leave a comment here" id="floatingTextarea2" style="height: 100px" required></textarea>
            <label for="floatingTextarea2">Deskripsi Laporan</label>
          </div>
          
          <!-- <div class="mb-3">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-link-45deg" viewBox="0 0 16 16">
              <path d="M4.715 6.542 3.343 7.914a3 3 0 1 0 4.243 4.243l1.828-1.829A3 3 0 0 0 8.586 5.5L8 6.086a1.002 1.002 0 0 0-.154.199 2 2 0 0 1 .861 3.337L6.88 11.45a2 2 0 1 1-2.83-2.83l.793-.792a4.018 4.018 0 0 1-.128-1.287z"/>
              <path d="M6.586 4.672A3 3 0 0 0 7.414 9.5l.775-.776a2 2 0 0 1-.896-3.346L9.12 3.55a2 2 0 1 1 2.83 2.83l-.793.792c.112.42.155.855.128 1.287l1.372-1.372a3 3 0 1 0-4.243-4.243L6.586 4.672z"/>
            </svg>
            <input class="form-control" type="file" id="formFile">
          </div>

          <div class="form-check form-switch">
            <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked" checked>
            <label class="form-check-label" for="flexSwitchCheckChecked">Kirim sebagai Anonim</label>
          </div> -->

          <div class="col-12">
            <button type="submit" class="btn btn-primary">Kirim</button>
          </div>
        </form>
      </main>
    </body>