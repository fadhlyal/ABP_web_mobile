import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';

class EditEmail extends StatelessWidget {
  final User user;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  UserDataModel? dataFromAPI;

  EditEmail({required this.user});

  @override
  Widget build(BuildContext context) {
    _emailController.text = user.email;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Edit Email',
        style: TextStyle(
          color: Colors.white
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 18.0,
                      
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Masukkan email',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    'Konfirmasi Password',
                    style: TextStyle(
                      fontSize: 18.0,
                      
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Masukkan password',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50.0),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Aksi saat tombol "Batal" ditekan
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Batal',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                  ),
                ),
                SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Aksi saat tombol "Simpan" ditekan
                    _changeEmail(context);
                  },
                  child: Text(
                    'Simpan',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _changeEmail(context) async {

    String email = _emailController.text;
    String password = _passwordController.text;
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, String> requestBody = {
      'email': email,
      'password': password,
    };

    try {
      String url = "http://10.60.226.135:8000/api/users/${user?.id.toString()}?_method=PUT";
      http.Response res = await http.post(
          Uri.parse(url),
          body: requestBody,
      );

      print(res.body);

      // Check the response status code
      if (res.statusCode == 200) {
        // Obtain shared preferences.
        // Successful login
        dataFromAPI = UserDataModel.fromJson(json.decode(res.body));

        // _isLoading = false;
        User currentUser = dataFromAPI!.users;
        await prefs.setString('email', currentUser.email);
        Navigator.pop(context);
        print('Upload Success');
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
