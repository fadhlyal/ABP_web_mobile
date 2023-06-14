import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:laporaja/models/laporan.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  LaporanDataModel? dataFromAPI;
  _getData() async {
    try {
      String url = "http://10.60.226.135:8000/api/laporan";
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("REST API Example"),
      ),
      body: _isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
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
    );
  }
}