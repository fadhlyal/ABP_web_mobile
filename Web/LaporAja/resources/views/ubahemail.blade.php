<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ubah Data</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
    <script src="https://kit.fontawesome.com/1b514b8e9a.js" crossorigin="anonymous"></script>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

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
            Ubah Data
        </h3>

        <div class="change">
          <div class="mb-3 row">
            <label for="email" class="col-sm-2 col-form-label">Email</label>
            <div class="col-sm-5">
              <input type="email" class="form-control" id="email" value="kadalkadal@gmail.com">
            </div>    
          </div>
          <div class="mb-3 row">
            <label for="inputPassword" class="col-sm-2 col-form-label">Konfirmasi Password</label>
              <div class="col-sm-5">
                <input type="password" class="form-control" id="inputPassword">
              </div>
          </div>

        </div>

        <button type="button" class="btn btn-danger">Simpan</button>


        


        

          
                   
    </section>
    
    

    
</body>

    