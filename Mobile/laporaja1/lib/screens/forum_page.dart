import 'package:flutter/material.dart';

class ForumPage extends StatelessWidget {
  const ForumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: (){

            },
          ),
          title: Text('Forum'),
        ),
        body: ListView(
          children: [
            ListTile(
              contentPadding: EdgeInsets.all(10.0),
              title: Text("Anonim",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Perbaikan akses jalan',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("Kecamatan Sukajadi",
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
            ),
            Divider(
              color: Colors.grey,
            ),
            ListTile(
              contentPadding: EdgeInsets.all(10.0),
              title: Text("Anonim",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Perbaikan akses jalan',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("Kecamatan Sukajadi",
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
            ),
          ],
        ),
      ),
    );
  }
}