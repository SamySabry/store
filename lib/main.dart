import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/provider/adminMode.dart';
import 'package:store/provider/modelHud.dart';
import 'package:store/screens/AdminHome.dart';
import 'package:store/screens/HomeScreen.dart';
import 'package:store/screens/Loginscreen.dart';
import 'package:store/screens/Signupscreen.dart';

main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
    ChangeNotifierProvider<ModelHud>(
    create: (context)=>ModelHud(),),
        ChangeNotifierProvider<AdminMode>(
          create: (context)=>AdminMode(),),
      ],
    child: MaterialApp(
        initialRoute: LoginScreen.id,
        routes: {
          LoginScreen.id :(context)=>LoginScreen(),
          SignupScreen.id :(context)=>SignupScreen(),
          HomeScreen.id :(context)=>HomeScreen(),
          AdminHome.id :(context)=>AdminHome(),
    },
    ),
    );
  }
}

