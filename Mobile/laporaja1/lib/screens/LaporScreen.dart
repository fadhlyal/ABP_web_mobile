import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:laporaja/models/laporan.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'BotNavBar.dart';

class LaporScreen extends StatefulWidget {
  @override
  _LaporScreenState createState() => _LaporScreenState();
}

class _LaporScreenState extends State<LaporScreen> {
  int? userId;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _judulController = TextEditingController();
  TextEditingController _alamatController = TextEditingController();
  TextEditingController _provinsiController = TextEditingController();
  TextEditingController _kabkotaController = TextEditingController();
  TextEditingController _kecamatanController = TextEditingController();
  TextEditingController _deskripsiController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getUserId();
  }

  _getUserId() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  int? id = prefs.getInt('id');
  String? _provinsi = prefs.getString('provinsi');
  String? _kabkota = prefs.getString('kabkota');
  String? _kecamatan = prefs.getString('kecamatan');
  setState(() {
    userId = id;
    _provinsiController.text = _provinsi!;
    _kabkotaController.text = _kabkota!;
    _kecamatanController.text = _kecamatan!;
  });
}

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
                          _postLaporan();
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

  void _postLaporan() async {
    // Validate form fields
    if (!_formKey.currentState!.validate()) {
      return;
    }

    print(userId);

    // Extract email and password from controllers
    String judul = _judulController.text;
    int id = userId!;
    String alamat = _alamatController.text;
    String provinsi = _provinsiController.text;
    String kabkota = _kabkotaController.text;
    String kecamatan = _kecamatanController.text;
    String deskripsi = _deskripsiController.text;

    // Create a map with the request body data
    Map<String, String> requestBody = {
      'judul': judul,
      'user_id': id.toString(),
      'alamat': alamat,
      'provinsi': provinsi,
      'kabkota': kabkota,
      'kecamatan': kecamatan,
      'deskripsi': deskripsi
    };

    // Send the POST request
    try {
      http.Response res = await http.post(
        Uri.parse('http://10.60.226.135:8000/api/laporan'),
        body: requestBody,
      );

      // Check the response status code
      if (res.statusCode == 200) {
        // Obtain shared preferences.
        print('Upload success');
        setState(() {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => NavBar()),
          );
        });
      } else {
        // Failed login
        print('Upload failed');
      }
    } catch (e) {
      // Error occurred
      print('An error occurred: $e');
    }
  }
}
