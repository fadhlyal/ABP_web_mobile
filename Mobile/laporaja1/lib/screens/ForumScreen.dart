import 'package:flutter/material.dart';

class ForumScreen extends StatelessWidget {
  const ForumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Forum",
                    style: TextStyle(
                      fontSize: 36,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              SizedBox(height: 32),
              ListTile(
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
                      'Perbaikan akses jalan',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Kecamatan Sukajadi",
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
                      'Perbaikan akses jalan',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Kecamatan Sukajadi",
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
      ),
    );
  }
}
