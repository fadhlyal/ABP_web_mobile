import 'package:flutter/material.dart';
import 'dart:convert';
import '../screens/BotNavBarGuest.dart';
import '../screens/BotNavBar.dart';
import '../screens/RegisterScreen.dart';
import 'package:http/http.dart' as http;
import 'package:laporaja/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/string.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  UserDataModel? dataFromAPI;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Masuk'),
      ),
      backgroundColor: Colors.red,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 80.0),
          Image.asset(
            'assets/images/logo.png',
            width: 300.0,
            height: 135.0,
          ),
          SizedBox(height: 40.0),
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Masuk',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Belum Punya Akun? ',
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
                              builder: (context) => RegisterScreen()),
                        );
                      },
                      child: Text(
                        'Daftar',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                        ),
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Kata Sandi',
                        ),
                      ),
                      SizedBox(height: 24.0),
                      Center(
                        child: SizedBox(
                          width: 150,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              _login();
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: Text('Login'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.0),
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
        ],
      ),
    );
  }

  void _login() async {
    // Validate form fields
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // Extract email and password from controllers
    String email = _emailController.text;
    String password = _passwordController.text;

    // Create a map with the request body data
    Map<String, String> requestBody = {
      'email': email,
      'password': password,
    };

    // Send the POST request
    try {
      http.Response res = await http.post(
        Uri.parse('${Strings.APIURL}/login'),
        body: requestBody,
      );

      // Check the response status code
      if (res.statusCode == 200) {
        // Obtain shared preferences.
        final SharedPreferences prefs = await SharedPreferences.getInstance();

        // Successful login
        dataFromAPI = UserDataModel.fromJson(json.decode(res.body));

        // _isLoading = false;
        User currentUser = dataFromAPI!.users;
        await prefs.setInt('id', currentUser.id);
        await prefs.setString('firstname', currentUser.firstname);
        await prefs.setString('lastname', currentUser.lastname);
        await prefs.setString('phonenumber', currentUser.phonenumber);
        await prefs.setString('provinsi', currentUser.provinsi);
        await prefs.setString('kabkota', currentUser.kabkota);
        await prefs.setString('kecamatan', currentUser.kecamatan);
        await prefs.setString('email', currentUser.email);
        await prefs.setString('role', currentUser.role);
        setState(() {
          Navigator.of(context).pop();
          Navigator
              .of(context)
              .pushReplacement(
              MaterialPageRoute(
                  builder: (BuildContext context) => NavBar()
              )
          );
        });
      } else {
        // Failed login
        print('Login failed');
      }
    } catch (e) {
      // Error occurred
      print('An error occurred: $e');
    }
  }
}
