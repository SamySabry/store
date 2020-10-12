import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/provider/adminMode.dart';
import 'package:store/provider/modelHud.dart';
import 'file:///E:/flutterProject/store/lib/screens/admin/AdminHome.dart';
import 'package:store/screens/HomeScreen.dart';
import 'package:store/screens/Loginscreen.dart';
import 'package:store/screens/Signupscreen.dart';
import 'package:store/screens/admin/AddProduct.dart';
import 'package:store/screens/admin/ManageProducts.dart';
import 'package:store/screens/admin/editProduct.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
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
          AddProduct.id :(context)=>AddProduct(),
          ManageProducts.id :(context)=>ManageProducts(),
          EditProduct.id :(context)=>EditProduct()
    },
    ),
    );
  }
}
//[cloud_firestore/permission-denied] The caller does not have permission to execute the specified operation.
