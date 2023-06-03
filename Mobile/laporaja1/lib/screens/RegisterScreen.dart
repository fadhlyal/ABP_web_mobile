import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
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
                      'Already have an account? ',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // Navigate to login page
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
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Nama Depan',
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
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Nama Belakang',
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
                      child: TextField(
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
                      child: TextField(
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
                      child: TextField(
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
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Hp',
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
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Email',
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
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Kata Sandi',
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
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Konfirmasi Kata Sandi',
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
                      child: Text('Register'),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Center(
                  child: TextButton(
                    onPressed: () {
                      // Perform registration
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
}