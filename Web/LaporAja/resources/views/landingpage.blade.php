<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LaporAja</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
    <script src="https://kit.fontawesome.com/1b514b8e9a.js" crossorigin="anonymous"></script>
    

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="css\stylelanding.css">
</head>

<body>
    <section id="header">
        <a href="/dashboard"><img src="images\logo header.png" class="logo" alt=""></a>

        <div>
            <ul id="navbar">
                <li><a class="active" href="/dashboard">Beranda</a></li>
                <li><a href="/laporan">Laporan</a></li>
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

    <section id="hero">
        <h2>Pengaduan Online Masyarakat</h2>
        <p>Sampaikan laporan anda langsung mengenai keresahan anda</p>
    </section>

    <section id="product1" class="section-p1">
        @if (auth()->check())
            <h2>Halo {{ Auth::user()->lastname }}, Silahkan Pilih Opsi Menu</h2>
        @else
            <h2>Halo Guest, Silahkan Pilih Opsi Menu</h2>
        @endif
        <p>Pilih sesuai dengan kebutuhan anda</p>
    </section>

    <section id="feature" class="section-p1">
        <div class="fe-box">
            <a href="/laporan"><img src="images\write2.png" alt=""></a>
            <h2>Lapor</h2>
        </div>

        <div class="fe-box">
            <a href="/forum"><img src="images\form.png" alt=""></a>
            <h2>Forum</h2>
        </div>

        <div class="fe-box">
            <a href="/kontakdarurat"><img src="images\phone.png" alt=""></a>
            <h2>Telepon</h2>
        </div>
    </section>

    <footer class="section-p1">
        <div class="col">
            <img class="logo" src="images\logo header.png" alt="">
            <h4>Kontak</h4>
            <p><strong>Alamat</strong> Gg. Desa Lengkong, Bojongsoang, Kabupaten Bandung</p>
            <p><strong>Telepon</strong> +62 212 8987 099</p>
            <p><strong>Jam kerja</strong> 09.00 - 17.00, Senin - Jumat</p>

            <div class="follow">
                <h4>Ikuti kami</h4>
                <div class="icon">
                    <i class="fab fa-facebook"></i>
                    <i class="fab fa-twitter"></i>
                    <i class="fab fa-instagram"></i>
                    <i class="fab fa-youtube"></i>
                </div>
            </div>
        </div>
    </footer>

    <script src="jss\scriptf.js"></script>
</body>