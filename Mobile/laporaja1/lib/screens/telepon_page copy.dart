import 'package:flutter/material.dart';

class TeleponPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Telepon',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RumahSakitPage()),
                );
              },
              child: Text(
                'Rumah Sakit',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(width: 200.0),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PolisiPage()),
                );
              },
              child: Text(
                'Polisi',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(width: 200.0),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PemadamPage()),
                );
              },
              child: Text(
                'Pemadam',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RumahSakitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rumah Sakit'),
      ),
      body: Center(
        child: Text('Halaman Rumah Sakit'),
      ),
    );
  }
}

class PolisiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Polisi'),
      ),
      body: Center(
        child: Text('Halaman Polisi'),
      ),
    );
  }
}

class PemadamPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pemadam'),
      ),
      body: Center(
        child: Text('Halaman Pemadam'),
      ),
    );
  }
}
