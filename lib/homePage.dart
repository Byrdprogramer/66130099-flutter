import 'package:flutter/material.dart';
import 'package:my_aboutme/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<void> logOut() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("หน้าหลัก"),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                const  ListTile(
                    leading: Icon(Icons.album),
                    title: Text("Welcome to My About Me"),
                    subtitle: Text("WE679"),
                  ),

             
                  Row(
                    children: [
                      TextButton(
                        onPressed:() => {
                          logOut(),
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Login())
                          )
                          
                        }, 
                        child: const Icon(Icons.logout)
                        ),
                    ],
                  ),


                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0,
                children: [
                  Container(
                    padding: const EdgeInsets.all(0.0),
                    color: const Color.fromRGBO(114, 165, 246, 1),
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "profile");
                        },
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage("assets/images/user.png"),
                              height: 80.0,
                              width: 80.0,
                            ),
                            Center(
                              child: Text(
                                "โปรไฟล์",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        )),
                  ),
                  Container(
                    padding: const EdgeInsets.all(0.0),
                    color: const Color.fromRGBO(114, 165, 246, 1),
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "video_presentation");
                        },
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage("assets/images/multimedia.png"),
                              height: 80.0,
                              width: 80.0,
                            ),
                            Center(
                              child: Text(
                                "วีดีโอแนะนำตัว",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        )),
                  ),
                  Container(
                    padding: const EdgeInsets.all(0.0),
                    color: const Color.fromRGBO(114, 165, 246, 1),
                    child: TextButton(
                        onPressed: () {},
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage("assets/images/map.png"),
                              height: 80.0,
                              width: 80.0,
                            ),
                            Center(
                              child: Text(
                                "แผนที่",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        )),
                  ),
                  Container(
                    padding: const EdgeInsets.all(0.0),
                    color: const Color.fromRGBO(114, 165, 246, 1),
                    child: TextButton(
                        onPressed: () {},
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage("assets/images/schedule.png"),
                              height: 80.0,
                              width: 80.0,
                            ),
                            Center(
                              child: Text(
                                "คำนวณอายุ",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        )),
                  ),
                  Container(
                    padding: const EdgeInsets.all(0.0),
                    color: const Color.fromRGBO(114, 165, 246, 1),
                    child: TextButton(
                        onPressed: () {
                         Navigator.pushNamed(context, "blog");
                        },
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage("assets/images/vb.png"),
                              height: 80.0,
                              width: 80.0,
                            ),
                            Center(
                              child: Text(
                                "บล็อก",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                    ),
                                    textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        )),
                  ),
                                 Container(
                    padding: const EdgeInsets.all(0.0),
                    color: const Color.fromRGBO(114, 165, 246, 1),
                    child: TextButton(
                        onPressed: () {
                         Navigator.pushNamed(context, "product");
                        },
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage("assets/images/vb.png"),
                              height: 80.0,
                              width: 80.0,
                            ),
                            Center(
                              child: Text(
                                "Product List",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                    ),
                                    textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
