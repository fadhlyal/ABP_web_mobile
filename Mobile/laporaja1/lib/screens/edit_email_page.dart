import 'package:flutter/material.dart';

class EditEmail extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
}
