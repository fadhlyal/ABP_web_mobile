import 'package:flutter/material.dart';

import '../screens/BotNavBarGuest.dart';
import '../screens/LoginScreen.dart';
import 'package:laporaja/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _namaDepanController = TextEditingController();
  final TextEditingController _namaBelakangController = TextEditingController();
  final TextEditingController _provinsiController = TextEditingController();
  final TextEditingController _kabKotaController = TextEditingController();
  final TextEditingController _kecamatanController = TextEditingController();
  final TextEditingController _noHpController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _konfirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buat Akun'),
      ),
      backgroundColor: Colors.red,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Sudah Punya Akun? ',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _namaDepanController,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                labelText: 'Nama Depan',
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              style: TextStyle(
                                  color:
                                      Colors.black), // Set text color to black
                              cursorColor: Colors.black,
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: TextFormField(
                              controller: _namaBelakangController,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                labelText: 'Nama Belakang',
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              style: TextStyle(
                                  color:
                                      Colors.black), // Set text color to black
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
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                labelText: 'Provinsi',
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              style: TextStyle(
                                  color:
                                      Colors.black), // Set text color to black
                              cursorColor: Colors.black,
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: TextFormField(
                              controller: _kabKotaController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                labelText: 'Kab/Kota',
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              style: TextStyle(
                                  color:
                                      Colors.black), // Set text color to black
                              cursorColor: Colors.black,
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: TextFormField(
                              controller: _kecamatanController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                labelText: 'Kecamatan',
                              ),
                              style: TextStyle(
                                  color:
                                      Colors.black), // Set text color to black
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
                              controller: _noHpController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'Hp',
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              style: TextStyle(
                                  color:
                                      Colors.black), // Set text color to black
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
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              style: TextStyle(
                                  color:
                                      Colors.black), // Set text color to black
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
                              controller: _passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Kata Sandi',
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              style: TextStyle(
                                  color:
                                      Colors.black), // Set text color to black
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
                              controller: _konfirmPasswordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Konfirmasi Kata Sandi',
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              cursorColor: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Center(
                        child: SizedBox(
                          width: 150,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              // Perform registration
                              _register();
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: Text('Register'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NavBarGuest()),
                      );
                    },
                    child: Text(
                      'Masuk Sebagai Guest',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _register() async {
    // Validate form fields
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // Extract email and password from controllers
    String firstname = _namaDepanController.text;
    String lastname = _namaBelakangController.text;
    String phonenumber = _noHpController.text;
    String provinsi = _provinsiController.text;
    String kabkota = _kabKotaController.text;
    String kecamatan = _kecamatanController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    String confirmPassword = _konfirmPasswordController.text;

    if (password != confirmPassword) {
      return;
    }

    // Create a map with the request body data
    Map<String, String> requestBody = {
      'firstname' : firstname,
      'lastname' : lastname,
      'phonenumber' : phonenumber,
      'provinsi' : provinsi,
      'kabkota' : kabkota,
      'kecamatan' : kecamatan,
      'email' : email,
      'password' : password
    };

    // Send the POST request
    try {
      http.Response res = await http.post(
        Uri.parse('http://10.60.226.135:8000/api/users'),
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
                builder: (BuildContext context) => NavBarGuest()),
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
