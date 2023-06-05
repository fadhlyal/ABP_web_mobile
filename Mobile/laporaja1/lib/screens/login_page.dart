import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Text(
            'Masuk',
            style: TextStyle(
              fontSize: 20,
              backgroundColor: Colors.white,
            ),
          ),
        )
        
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(25.0),        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(              
              padding: EdgeInsets.all(16.0),
              child: Image.asset(
                'assets/logo.png', // Ubah dengan path gambar logo Anda
                height: 150.0,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              padding: EdgeInsets.only(left: 100),
              child: Text(
                'Masuk',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(              
              children: [
                SizedBox(width: 100.0),
                Text('Belum punya akun?',
                style: TextStyle(
                  fontSize: 20
                  ),
                ),
                InkWell(
              onTap: (){
              },
              child: Text('Daftar',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                ),
              ),
            ),
              ],
            ),
            
              
            
            SizedBox(height: 24.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 100.0),
              child: Form(
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
                    
                    ElevatedButton(
                      onPressed: () {                       
                      },
                      child: Text('Masuk',
                      style: TextStyle(
                        color: Colors.white,
                      ),),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red)
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.0),
                      child: TextButton(                     
                      onPressed: () {
                        // Logika ketika tombol "Masuk sebagai Guest" ditekan
                      },
                      child: Text(
                        'Masuk sebagai Guest',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
