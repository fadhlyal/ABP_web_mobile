<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kontak Darurat</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
    <script src="https://kit.fontawesome.com/1b514b8e9a.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="css\stylef.css">
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

    <section id="daftar">
        <!-- <div class="icons">
            <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
            <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
            <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
            </svg>
        </div> -->
        <div class="container text-center">
            <div class="row">
                <div class="col">
                    <li><a href=""><i class="fa-solid fa-hospital"></i>Rumah sakit</a></li>
                </div>
                <div class="col">
                    <li><img src="images\imgrs.png" alt=""><a href="">Polisi</a></li>
                </div>
                <div class="col">
                    <li><img src="images\imgfire.png" alt=""><a href="">Pemadam</a></li>
                </div>
            </div>
        </div>
    </section>

    <section id="main">

        <div class="container">
            <div class="row">
                <div class="col">
                    @foreach($rumahsakit as $key => $data)
                        <h4>{{$data->namainstansi}}</h4>
                        <!-- <h4>{{$data->namainstansi}}<i class="fa-solid fa-play"></i></h4> -->
                        <h7>{{$data->alamat}}</h7>
                        <h7>{{$data->nomortelepon}}</h7>
                        <!-- <h4><strong>{{$data->namainstansi}}</strong></h4>
                        <h6>{{$data->alamat}}</h6>
                        <h6>{{$data->nomortelepon}}</h6> -->
                    @endforeach
                </div>
                <div class="col">
                    @foreach($polisi as $key => $data)
                        <h4>{{$data->namainstansi}}</h4>
                        <h7>{{$data->alamat}}</h7>
                        <h7>{{$data->nomortelepon}}</h7>
                        <!-- <h4><strong>{{$data->namainstansi}}</strong></h4>
                        <h6>{{$data->alamat}}</h6>
                        <h6>{{$data->nomortelepon}}</h6> -->
                    @endforeach
                </div>
                <div class="col">
                    @foreach($pemadam as $key => $data)
                        <h4>{{$data->namainstansi}}</h4>
                        <h7>{{$data->alamat}}</h7>
                        <h7>{{$data->nomortelepon}}</h7>
                        <!-- <h4><strong>{{$data->namainstansi}}</strong></h4>
                        <h6>{{$data->alamat}}</h6>
                        <h6>{{$data->nomortelepon}}</h6> -->
                    @endforeach
                </div>
            </div>
        </div>
        @if (auth()->check())
            @if (Auth::user()->isAdmin())
                <div class="plus col">
                    <li><a href="/kontakdarurat/tambah"><i class="fa-solid fa-plus"></i>Tambah Nomer Penting</a></li>
                </div>
            @endif
        @endif
    </section>
</body>