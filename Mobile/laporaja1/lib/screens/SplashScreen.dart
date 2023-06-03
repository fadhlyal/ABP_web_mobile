import 'package:flutter/material.dart';

import '../screens/HomeScreen.dart';
import '../screens/RegisterScreen.dart';
import '../screens/LoginScreen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return FractionallySizedBox(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('../assets/images/background.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 220,
                    height: 100,
                  ),
                ),
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Pengaduan\nOnline\nMasyarakat',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ButtonMasuk(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ButtonDaftar(),
                ),
                MasukGuest(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonMasuk extends StatelessWidget {
  const ButtonMasuk({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        },
        child: Text('Masuk'),
      ),
    );
  }
}

class ButtonDaftar extends StatelessWidget {
  const ButtonDaftar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RegisterPage()),
          );
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(120.0)),
          ),
        ),
        child: Text('Daftar'),
      ),
    );
  }
}

class MasukGuest extends StatelessWidget {
  const MasukGuest({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      },
      child: Text(
        'Masuk Sebagai Guest',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
