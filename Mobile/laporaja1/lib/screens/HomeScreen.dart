import 'package:flutter/material.dart';
import 'package:laporaja/screens/SplashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:laporaja/models/user.dart';
import 'package:http/http.dart' as http;
import '../screens/EditScreen.dart';
import 'BotNavBarGuest.dart';

class HomeScreen extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  User? user;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  _getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      user = User(
          id: prefs.getInt('id')!,
          firstname: prefs.getString('firstname')!,
          lastname: prefs.getString('lastname')!,
          phonenumber: prefs.getString('phonenumber')!,
          provinsi: prefs.getString('provinsi')!,
          kabkota: prefs.getString('kabkota')!,
          kecamatan: prefs.getString('kecamatan')!,
          email: prefs.getString('email')!,
          role: prefs.getString('role')!
      );
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Home'),
      // ),
      body: Padding(
        padding: const EdgeInsets.only(
            top: 32.0, bottom: 16.0, left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome!',
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            Text(
              'Senang bertemu lagi dengan anda!',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 8.0, bottom: 16.0, left: 16.0, right: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8),
                        Text(
                          "${user?.firstname} ${user?.lastname}",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "${user?.kecamatan}, ${user?.kabkota}, ${user?.provinsi}",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "${user?.email}",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                              child: FractionallySizedBox(
                                widthFactor: 0.8,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => EditEmail(user: user!)),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                  child: Text('Edit Email'),
                                ),
                              ),
                            ),
                            Flexible(
                              child: FractionallySizedBox(
                                widthFactor: 0.9,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Perform delete account action
                                    _deleteAccount();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                  child: Text('Hapus Akun'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            SizedBox(
              width: 100,
              height: 30,
              child: ElevatedButton(
                onPressed: () {
                  // Perform registration
                  _logout();
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                child: Text('Logout'),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Kontak Penting',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => LoginScreen()),
                        // );
                        // Tap to Kontak Penting Polisi
                      },
                      child: Image.asset(
                        'assets/images/polici.png',
                        width: 65,
                        height: 65,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => LoginScreen()),
                        // );
                        // Tap to Kontak Penting Pemadam
                      },
                      child: Image.asset(
                        'assets/images/bomba.png',
                        width: 65,
                        height: 65,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => LoginScreen()),
                        // );
                        // Tap to Kontak Penting Rumah Sakit
                      },
                      child: Image.asset(
                        'assets/images/ambulans.png',
                        width: 65,
                        height: 65,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Riwayat Laporan',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Judul Laporan',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Isi Laporan',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _deletePreference() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  _logout() async {
    _deletePreference();
    setState(() {
      Navigator
          .of(context)
          .pushReplacement(
          MaterialPageRoute(
              builder: (BuildContext context) => SplashScreen()
          )
      );
    });
  }

  _deleteAccount() async {
    // Send the POST request
    try {
      String url = "http://10.60.226.135:8000/api/users/${user?.id.toString()}";
      http.Response res = await http.delete(
        Uri.parse(url)
      );

      // Check the response status code
      if (res.statusCode == 200) {
        // Obtain shared preferences.
        _deletePreference();
        print('Delete Success');
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
