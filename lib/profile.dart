import 'package:flutter/material.dart';

class ProFile extends StatelessWidget {
  const ProFile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("โปรไฟล์"),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 15.0,
                ),
                Image(
                  image: AssetImage("assets/images/user.png"),
                  height: 100.0,
                  width: 100.0,
                ),
                Text(
                  "Siwakorn Banluesapy",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  "FullStack Deverloper",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15.0,
                ),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: Text("โทรศัพท์",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold)),
                  subtitle: Text("094-390-8077"),
                ),
                SizedBox(
                  height: 15.0,
                ),
                ListTile(
                  leading: Icon(Icons.email),
                  title: Text("อีเมล",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold)),
                  subtitle: Text("siwakorn167@gmail.com"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
