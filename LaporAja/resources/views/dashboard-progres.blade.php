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
            <!-- <li><i class="fa-solid fa-circle-user"></i><a href="/profile">Profile</a></li> -->
            <li><i class="fa-solid fa-clipboard-list"></i><a href="/profile">Laporan</a></li>
            <li><i class="fa-solid fa-right-from-bracket"></i><a href="/logout">Keluar</a></li>
        </div>
    </section>

    <section id="interface">
        
        <!-- <div class="navigation">
            <div class="n1">
                <div>
                    <i id="menu-btn" class="fas fa-bars"></i>
                </div>
                <div class="search">
                    <i class="fa-solid fa-magnifying-glass"></i>
                    <input type="text" placeholder="Cari">
                </div>
            </div>

            <div class="profile">
                    <i class="far fa-bell"></i>
            </div>
        </div> -->

        <h3 class="i-name">
            Laporan
        </h3>

        <div class="uptask">
            <div class="uptaskspace">
                <h4><a href="/profile"><small><b>Semua Laporan</b></small></a></h4>
            </div>

            <div class="uptaskspace">
                <h4><a class="active" href="/profile/laporan-diproses"><small><b>Progres</b></small></a></h4>
            </div>

            <div class="uptaskspace">
                <h4><a href="/profile/laporan-ditolak"><small><b>Ditolak</b></small></a></h4>
            </div>

            <div class="uptaskspace">
                <h4><a href="/profile/laporan-selesai"><small><b>Selesai</b></small></a></h4>
            </div>
        </div>

        <div class="board">
            <table width="100%">
               <thead>
                    <tr>
                        <td>Nama</td>
                        <td>Judul Laporan</td>
                        <td>Provinsi</td>
                        <td>Kab/Kota</td>
                        <td>Kecamatan</td>
                        <td>Status</td>
                        <td></td>
                    </tr>
               </thead>
               <tbody>
               @foreach($laporan as $key => $data)
                    <tr>
                        <td class="people">
                            <!-- <img src="images\man1.jpg" alt=""> -->
                            <div class="people-de">
                                <h5>{{$data->user->firstname}} {{$data->user->lastname}}</h5>
                                <!-- <p>kianizz@gmail.com</p> -->
                            </div>
                        </td>

                        <td class="people-des">
                            <h5>{{$data->judul}}</h5>
                        </td>

                        <td class="people-prov">
                            <h5>{{$data->provinsi}}</h5>
                        </td>

                        <td class="people-city">
                            <h5>{{$data->kabkota}}</h5>
                        </td>

                        <td class="people-kec">
                            <h5>{{$data->kecamatan}}</h5>
                        </td>
                        @if ($data->status == 'selesai')
                            <td class="active"><p class="done">Selesai</p></td>
                        @elseif ($data->status == 'ditolak')
                            <td class="active"><p class="not">Ditolak</p></td>
                        @elseif ($data->status == 'diproses')
                            <td class="active"><p class="prog">Progres</p></td>
                        @endif
                        @if (Auth::user()->isAdmin())
                            <td class="edit"><a href="/dashboard/edit/{{$data->id}}">Edit</a></td>
                        @endif
                        <td class="delete"><a href="#" data-bs-toggle="modal" data-bs-target="#exampleModal-{{$data->id}}">Delete</a></td>
                        <div class="modal fade" id="exampleModal-{{$data->id}}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                              <div class="modal-content">
                                <div class="modal-header">
                                  <h1 class="modal-title fs-5" id="exampleModalLabel">Hapus Laporan</h1>
                                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                  Apakah anda yakin akan menghapus laporan ini?
                                </div>
                                <div class="modal-footer">
                                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
                                  <form id="delete-form-{{$data->id}}" action="{{route('laporan.delete', $data->id)}}" method="POST">
                                    @csrf
                                    @method('DELETE')
                                    <button type="submit" class="btn btn-danger">Hapus</button>
                                  </form>
                                </div>
                              </div>
                            </div>
                        </div>
                        <!-- @if (Auth::user()->isAdmin())
                            @if ($data->user_id==auth()->id())
                            <td class="edit">
                                <a href="{{ route('profile') }}" 
                                    onclick="event.preventDefault();
                                    document.getElementById(
                                    'delete-form-{{$data->id}}').submit();">
                                    Delete
                                </a>
                            </td>
                            <form id="delete-form-{{$data->id}}" action="{{route('laporan.delete', $data->id)}}" method="POST">
                                @csrf
                                @method('DELETE')
                            </form>
                            @else
                            <td class="edit"><a href="#">Edit</a></td>
                            @endif
                        @else
                        <td class="edit">
                            <a href="{{ route('profile') }}" 
                                onclick="event.preventDefault();
                                document.getElementById(
                                'delete-form-{{$data->id}}').submit();">
                                Delete
                            </a>
                        </td>
                        <form id="delete-form-{{$data->id}}" action="{{route('laporan.delete', $data->id)}}" method="POST">
                            @csrf
                            @method('DELETE')
                        </form>
                        @endif -->
                    </tr>
                @endforeach
               </tbody>
            </table>
        </div>
    </section>

    <!-- <script>
        $('#menu-btn').click(function() {
            $('#menu').toggleClass("active");
        })
    </script> -->
</body>
</html>