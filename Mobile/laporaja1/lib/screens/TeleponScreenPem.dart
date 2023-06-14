import 'package:flutter/material.dart';

import '../models/kontakpenting.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../services/string.dart';

class TeleponScreenPem extends StatefulWidget {
  @override
  _TeleponScreenPemState createState() => _TeleponScreenPemState();
}

class _TeleponScreenPemState extends State<TeleponScreenPem> {
  bool _isLoading = true;
  KontakDataModel? dataFromAPI;

  @override
  void initState() {
    super.initState();
    _getKontak();
  }

  _getKontak() async {
    try {
      String url = "${Strings.APIURL}/kontakpenting?jenis=pemadam";
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
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Row(
            children: [
              SizedBox(width: 8.0),
              Text('Kantor Pemadam'),
            ],
          ),
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
                  Text(
                    "Kontak",
                    style: TextStyle(
                      fontSize: 36,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              SizedBox(height: 32),
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
