import 'package:flutter/material.dart';

class LaporScreen extends StatefulWidget {
  @override
  _LaporScreenState createState() => _LaporScreenState();
}

class _LaporScreenState extends State<LaporScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _judulController = TextEditingController();
  TextEditingController _alamatController = TextEditingController();
  TextEditingController _provinsiController = TextEditingController();
  TextEditingController _kabkotaController = TextEditingController();
  TextEditingController _kecamatanController = TextEditingController();
  TextEditingController _namaPelaporController = TextEditingController();
  TextEditingController _deskripsiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lapor',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Tulis laporan kamu disini!',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _judulController,
                          decoration: InputDecoration(
                            labelText: 'Judul Laporan',
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          style: TextStyle(
                              color: Colors.black), // Set text color to black
                          cursorColor: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _alamatController,
                          decoration: InputDecoration(
                            labelText: 'Alamat',
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          style: TextStyle(
                              color: Colors.black), // Set text color to black
                          cursorColor: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _provinsiController,
                          decoration: InputDecoration(
                            labelText: 'Provinsi',
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          style: TextStyle(
                              color: Colors.black), // Set text color to black
                          cursorColor: Colors.black,
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: _kabkotaController,
                          decoration: InputDecoration(
                            labelText: 'Kab/Kota',
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          style: TextStyle(
                              color: Colors.black), // Set text color to black
                          cursorColor: Colors.black,
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: _kecamatanController,
                          decoration: InputDecoration(
                            labelText: 'Kecamatan',
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          style: TextStyle(
                              color: Colors.black), // Set text color to black
                          cursorColor: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _namaPelaporController,
                          decoration: InputDecoration(
                            labelText: 'Nama Pelapor',
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          style: TextStyle(
                              color: Colors.black), // Set text color to black
                          cursorColor: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      controller: _deskripsiController,
                      maxLines: 4,
                      decoration: InputDecoration(
                        labelText: 'Deskripsi',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: SizedBox(
                      width: 150,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          // Perform registration
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Text('Kirim'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
