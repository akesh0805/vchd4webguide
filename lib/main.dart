import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vchd4webguide/models/departments.dart';
import 'package:vchd4webguide/models/guides.dart';
import 'package:vchd4webguide/models/position.dart';
import 'package:vchd4webguide/models/users.dart';
import 'package:vchd4webguide/pages/AddDepartment.dart';
import 'package:vchd4webguide/pages/AddGuide.dart';
import 'package:vchd4webguide/pages/AddPosition.dart';
import 'package:vchd4webguide/pages/AddUser.dart';
import 'package:vchd4webguide/pages/Admin.dart';
import 'package:vchd4webguide/pages/DepartmentsPage.dart';
import 'package:vchd4webguide/pages/Edit.dart';
import 'package:vchd4webguide/pages/GuideTablePage.dart';
import 'package:vchd4webguide/pages/GuidesPage.dart';
import 'package:vchd4webguide/pages/HomePage.dart';
import 'package:vchd4webguide/pages/LoginPage.dart';
import 'package:vchd4webguide/pages/SignUpPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCtADPkMvJYm8dYgqb7StijnHpbWlLc2oQ",
      appId: "1:1063970110779:web:a247734823ffcbc62b0b1e",
      messagingSenderId: "1063970110779",
      projectId: "vchd4webguide",
    ),
  );
  print("ulandi firebasega");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Departments()),
        ChangeNotifierProvider(create: (context) => Guides()),
        ChangeNotifierProvider(create: (context) =>Positions()),
        ChangeNotifierProvider(create: (context)=>Users()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "VCHD4 ONLINE YO'RIQNOMA",
        theme: ThemeData(
          textTheme: GoogleFonts.exoTextTheme(),
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(214, 16, 57, 104)),
          useMaterial3: true,
        ),
        home: HomePage(),
        routes: {
          HomePage.id: (context) => HomePage(),
          DepartmentsPage.id: (context) => DepartmentsPage(),
          GuidePage.id: (context) => GuidePage(userName: ''),
          GuideTablePage.id: (context) => GuideTablePage(),
          LoginPage.id:(context)=>LoginPage(),
          SignUpPage.id:(context)=>SignUpPage(),
          AdminPage.id:(context)=> AdminPage(),
          AddDepartment.id:(context)=>AddDepartment(),
          AddGuide.id:(context)=>AddGuide(),
          AddPosition.id:(context)=>AddPosition(),
          AddUser.id:(context)=>AddUser(),
          EditPage.id:(context)=>EditPage()
        },
      ),
    );
  }
}
