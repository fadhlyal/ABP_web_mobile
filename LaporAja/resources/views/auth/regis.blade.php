<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-widt initial-scale=1">
        <link rel="stylesheet" href="css\style.css">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
        
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">

        <title>Register</title>
    </head>
    <body>
        <section class="login d-flex">
            <div class="login-left w-50 h-100">
                <div class="row justify-content-center align-item-center h-10">
                    <div class="col-6">
                        <div class="header">
                            <h1 class="gis">
                                Buat Akun
                            </h1>
                            <p class="d-inline">
                                Sudah punya akun? <a href="/login" class="d-inline text text-decoration-none">Masuk</a>
                            </p>
                        </div>       
        
                        <div class="login-form">
                          @include('partial.alert')           
                          <form method="POST" action="/register">
                            @csrf
                            <div class="row g-2">
                              <div class="col-md">
                                <div class="form-floating">
                                  <input type="firstname" class="form-control" id="floatingInputGrid" name="firstname" required>
                                  <label for="floatingInputGrid">Nama depan</label>
                                </div>
                              </div>
                              <div class="col-md">
                                <div class="form-floating">
                                  <input type="lastname" class="form-control" id="floatingInputGrid" name="lastname" required>
                                  <label for="floatingInputGrid">Nama belakang</label>
                                </div>
                              </div>
                            </div>

                            <div class="row g-3">
                              <div class="col-md">
                                <div class="form-floating">
                                  <input type="provinsi" class="form-control" id="floatingInputGrid" name="provinsi" required>
                                  <label for="floatingInputGrid">Provinsi</label>
                                </div>
                              </div>
                              <div class="col-md">
                                <div class="form-floating">
                                  <input type="kabkota" class="form-control" id="floatingInputGrid" name="kabkota" required>
                                  <label for="floatingInputGrid">Kab/Kota</label>
                                </div>
                              </div>
                              <div class="col-md">
                                <div class="form-floating">
                                  <input type="kecamatan" class="form-control" id="floatingInputGrid" name="kecamatan" required>
                                  <label for="floatingInputGrid">Kecamatan</label>
                                </div>
                              </div>
                            </div>

                            <input type="text" class="form-control" id="hp" name="phonenumber" placeholder="Hp" onkeypress="return (event.charCode !=8 && event.charCode ==0 || (event.charCode >= 48 && event.charCode <= 57))" required>  
                            
                            <input type="email" class="form-control" id="email" name="email" placeholder="Email" required>
          
                            <input type="password" class="form-control" id="password" name="password" placeholder="Kata sandi" minlength="8" required>

                            <input type="password" class="form-control" id="confirmpassword" name="confirmpassword" placeholder="Konfirmasi Kata sandi" minlength="8" required>

                            <div class="masuk">
                              <button style="cursor:pointer" type="submit" class="btn btn-outline-secondary border-">Daftar</button>
                            </div>
                          </form>
                          <a href="/dashboard" class="text-decoration-none d-flex justify-content-center">Masuk Sebagai Guest</a>
                        </div>
                    </div>
                </div>
            </div>                              
            <div class="login-right w-50 h-100">
                <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-inner">
                      <div class="carousel-item active">
                        <img src="images\loginimg.png" class="d-block w-100" alt="...">
                      </div>
                      <div class="carousel-item">
                        <img src="images\login2.jpg" class="d-block w-100" alt="...">
                      </div>
                      <div class="carousel-item">
                        <img src="images\login3.jpg" class="d-block w-100" alt="...">
                      </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                      <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                      <span class="carousel-control-next-icon" aria-hidden="true"></span>
                      <span class="visually-hidden">Next</span>
                    </button>
                  </div>
            </div>
        </section>            
        
    </body>
</html>