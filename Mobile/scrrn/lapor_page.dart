import 'package:flutter/material.dart';

class LaporPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lapor'),
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
                      child: TextField(
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
                      child: TextField(
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
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(                 
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
    );
  }
}