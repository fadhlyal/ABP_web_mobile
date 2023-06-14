import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/laporan.dart';
import '../services/string.dart';

class ForumScreen extends StatefulWidget {
  @override
  _ForumScreenState createState() => _ForumScreenState();
}

class _ForumScreenState extends State<ForumScreen> {
  bool _isLoading = true;
  LaporanDataModel? dataFromAPI;

  @override
  void initState() {
    super.initState();
    _getLaporan();
  }

  _getLaporan() async {
    try {
      String url = "${Strings.APIURL}/laporan";
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        dataFromAPI = LaporanDataModel.fromJson(json.decode(res.body));
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
              "Forum",
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
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return ListTile(
                contentPadding: EdgeInsets.all(10.0),
                title: Text(
                  "Anonim",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dataFromAPI!.laporan[index].judul.toString(),
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      dataFromAPI!.laporan[index].kecamatan.toString(),
                      style: TextStyle(
                        fontSize: 11.0,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
                trailing: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "1 jam yang lalu",
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                    SizedBox(width: 4.0),
                    Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                  ],
                ),
              );
            },
            itemCount: dataFromAPI!.laporan.length,
          ),
        ),
      ),
    );
  }
}
