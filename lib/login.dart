import 'package:flutter/material.dart';
import 'package:my_aboutme/homePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //text controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  late String msg = '';
  Future<dynamic> signin() async {
    if (usernameController.text == 'hary' || passwordController == '123') {
      setPreferences(1);
    } else {
      setState(() {
        msg = 'Invalid Login';
      });
    }
  }

  void setPreferences(res) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt("uerauthen", res);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
            child: Center(
                child: Column(
      children: <Widget>[
        const Padding(
            padding: EdgeInsets.all(8.0),
            child: Image(
              image: AssetImage('assets/images/user.png'),
              width: 100.0,
              height: 100.0,
            )),
        const SizedBox(
          height: 25.0,
        ),
        const Text(
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
            "My About Me App"),
        if (msg != "")
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              msg,
              style: const TextStyle(color: Colors.red),
            ),
          ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
            )),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: TextField(
            controller: usernameController,
            decoration: const InputDecoration(
                suffixIcon: Icon(Icons.person),
                border: InputBorder.none,
                hintText: "Username"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: TextField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(
                suffixIcon: Icon(Icons.key),
                border: InputBorder.none,
                hintText: "Password"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: ElevatedButton(
              onPressed: signin,
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(127, 44, 236, 243)),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10.0),
                child: const Text(
                  "Sign In",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              )),
        )
      ],
    ))));
  }
}
