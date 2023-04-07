<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
    <script src="https://kit.fontawesome.com/1b514b8e9a.js" crossorigin="anonymous"></script>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="\css\styled.css">

    <script src="https://code.jquery.com/jquery-3.6.2.min.js"></script>
</head>

<body>
    <section id="menu">
        <div class="logo">
            <a href="/dashboard"><img src="\images\logo sidebar.png" alt=""></a>
        </div>

        <div class="items">
            <li class="active"><a class="fa-solid fa-circle-user"></a><a href="/akun">Profile</a></li>
            <li><a class="fa-solid fa-clipboard-list"></a><a href="/profilelaporan">Laporan</a></li>
            <li><a class="fa-solid fa-right-from-bracket"></a><a href="/logout">Keluar</a></li>
        </div>
    </section>

    <section id="interface">
        <h3 class="i-name">
            Profile
        </h3>

        <div class="info">
            <div class="mb-3 row">
                <label class="col-sm-2 col-form-label">Nama</label>
                <div class="col-sm-10">
                <input type="text" readonly class="form-control-plaintext" value="Kian Nailaizza">
                </div>
            </div>
            
            <div class="mb-3 row">
                <label class="col-sm-2 col-form-label">Alamat</label>
                <div class="col-sm-10">
                <input type="text" readonly class="form-control-plaintext" value="Jl. Telkomunikasi nomer 2">
                </div>
            </div>
            <div class="mb-3 row">
                <label class="col-sm-2 col-form-label">Provinsi</label>
                <div class="col-sm-10">
                <input type="text" readonly class="form-control-plaintext" value="Jawa Barat">
                </div>
            </div>
            <div class="mb-3 row">
                <label class="col-sm-2 col-form-label">Kota</label>
                <div class="col-sm-10">
                <input type="text" readonly class="form-control-plaintext" value="Bandung">
                </div>
            </div>
            <div class="mb-3 row">
                <label class="col-sm-2 col-form-label">Kecamatan</label>
                <div class="col-sm-10">
                <input type="text" readonly class="form-control-plaintext" value="Lengkong">
                </div>
            </div>
            <div class="row">
                <label for="staticEmail" class="col-sm-2 col-form-label">Email</label>
                <div class="col-sm-10">
                  <input type="text" readonly class="form-control-plaintext" id="staticEmail" value="email@example.com">
                </div>
            </div>
            
        </div>
        
        <div>
            <a href="/akun/ubahemail"><button type="button" class="btn btn-outline-secondary">Ganti Email</button></a>
            <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">Hapus Akun</button>
        </div>

        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h1 class="modal-title fs-5" id="exampleModalLabel">Hapus Akun</h1>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                  Apakah anda yakin akan menghapus akun anda ini??
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
                  <button type="button" class="btn btn-danger">Hapus</button>
                </div>
              </div>
            </div>
          </div>
    </section>
</body>

    