import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/kontakpenting.dart';
import '../models/laporan.dart';
import '../screens/TeleponScreenPol.dart';
import '../screens/TeleponScreenPem.dart';
import '../screens/TeleponScreenRs.dart';
import '../services/string.dart';

class TeleponScreen extends StatefulWidget {
  @override
  _TeleponScreenState createState() => _TeleponScreenState();
}

class _TeleponScreenState extends State<TeleponScreen> {
  bool _isLoading = true;
  KontakDataModel? dataFromAPI;

  @override
  void initState() {
    super.initState();
    _getKontak();
  }

  _getKontak() async {
    try {
      String url = "${Strings.APIURL}/kontakpenting";
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        dataFromAPI = KontakDataModel.fromJson(json.decode(res.body));
        _isLoading = false;
        setState(() {});
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              "Kontak",
              style: TextStyle(
                fontSize: 36,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: _isLoading
            ? const Center(
          child: CircularProgressIndicator(),
        )
            : Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TeleponScreenRs()),
                        );
                      },
                      child: Text(
                        'Rumah Sakit',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TeleponScreenPol()),
                        );
                      },
                      child: Text(
                        'Polisi',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TeleponScreenPem()),
                        );
                      },
                      child: Text(
                        'Pemadam',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Expanded(
                child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: EdgeInsets.all(10.0),
                    title: Text(
                      dataFromAPI!.kontak[index].namainstansi,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dataFromAPI!.kontak[index].alamat,
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          dataFromAPI!.kontak[index].nomortelepon,
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  );
                }, itemCount: dataFromAPI!.kontak.length,
              ),
              ),
        ],

        ),
      ),
    ),
    );
  }
}
