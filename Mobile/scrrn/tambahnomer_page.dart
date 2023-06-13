import 'package:flutter/material.dart';

class NomerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Telepon'),
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
                  'Nomor Penting',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                      'Tambahkan nomer penting!',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: DropdownButtonFormField<String>(
 
                    onChanged: (String? newValue) {
                     
                    },
                    items: <String>['Polisi', 'Rumah Sakit', 'Pemadam'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      labelText: 'Pilih Kontak Penting',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              
                
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Nama Instansi',
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
                          labelText: 'Nomor',
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
                  labelText: 'Alamat',
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