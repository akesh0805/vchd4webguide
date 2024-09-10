import 'package:flutter/material.dart';
import 'package:vchd4webguide/pages/DepartmentsPage.dart';
import 'package:vchd4webguide/pages/LoginPage.dart';

class HomePage extends StatefulWidget {
  static final id = "Home page";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Container(
                width: double.infinity,
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/logovchd.png"),
                    // fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.only(top: 90, left: 20),
                  color: const Color(0xFF3b5999).withOpacity(.85),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: "Online yo'riqnoma dasturiga",
                              style: TextStyle(
                                fontSize: 25,
                                letterSpacing: 2,
                                color: Colors.yellow[700],
                              ),
                              children: [
                                TextSpan(
                                  text: " Hush kelibsiz !",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.yellow[700],
                                  ),
                                )
                              ]),
                        ),
                        Column(
                          children: [
                            RichText(
                              text: TextSpan(
                                text: "Harakat xavfsizligini ta'minlash ",
                                style: TextStyle(
                                  fontSize: 25,
                                  letterSpacing: 2,
                                  color: Colors.yellow[700],
                                ),
                              ),
                            ),
                            RichText(
                                text: TextSpan(
                              text: " har bir temiryo'lchining vazifasidir",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow[700],
                              ),
                            ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, DepartmentsPage.id);
                  },
                  child: const Text(
                    "FOYDALANUVCHI",
                    style: TextStyle(color: Colors.blueAccent, fontSize: 30),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, LoginPage.id);
                  },
                  child: const Text(
                    "ADMIN",
                    style: TextStyle(color: Colors.blueAccent, fontSize: 30),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
