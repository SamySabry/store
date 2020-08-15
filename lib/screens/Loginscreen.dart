import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:store/constants.dart';
import 'package:store/provider/adminMode.dart';
import 'package:store/provider/modelHud.dart';
import 'package:store/screens/AdminHome.dart';
import 'package:store/screens/HomeScreen.dart';
import 'package:store/screens/Signupscreen.dart';
import 'package:store/services/auth.dart';
import 'package:store/widgets/Custom_logo.dart';
import 'package:store/widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  static String id = 'LoginScreen';
  final GlobalKey<FormState> _globalKey =GlobalKey<FormState>();
  bool isAdmin=false;
  final _auth=Auth();
  String _email,_password;
  final adminPassword="admin1234";

  @override
  Widget build(BuildContext context) {
    double hieght=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kMainColor,
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<ModelHud>(context).isloading,
    child: Form(
        key: _globalKey,
        child: ListView(
          children: [
            Custom_logo(),
            SizedBox(
              height: hieght*0.1,
            ),
            CustomTextField(
                onClick: (value)
                {
                  _email=value;
                },
                type :"Email",
                icon: Icons.email
            ),
            SizedBox(
              height: hieght*0.02,
            ),
            CustomTextField(
              onClick: (value)
              {
                _password=value;
              },
              type: "Password",
              icon: Icons.lock,
            ),
            SizedBox(
              height: hieght*0.05,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: Builder(
                builder:(context)=> FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  onPressed: ()async{
                    _validate(context);
                  },
                  color: Colors.black,
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: hieght*0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16
                  )

                ),
                GestureDetector(
                  onTap:(){
                  Navigator.pushNamed(context, SignupScreen.id);
                  }
                  ,
                  child: Text(
                    "Signup",
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        Provider.of<AdminMode>(context,listen: false).changeisAdmin(true);
                      },
                      child: Text(
                        "i\'m admin"
                            ,textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Provider.of<AdminMode>(context).isAdmin ?kMainColor :Colors.white
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        Provider.of<AdminMode>(context,listen: false).changeisAdmin(false);
                      },
                      child:Text(
                        "i\'m user"
                      ,textAlign: TextAlign.center,
                      style: TextStyle(
                          color: !Provider.of<AdminMode>(context).isAdmin ?kMainColor :Colors.white
                      ),
                    ),
                    )
                  )
                ],
              ),
            )
          ],
        ),
      ),
      ),)
    ;
  }
  _validate(BuildContext context) async{
    final modelHud = Provider.of<ModelHud>(context, listen: false);
    modelHud.changeisloading(true);
    if (_globalKey.currentState.validate()) {
      _globalKey.currentState.save();
      print(_email);
      print(_password);
        if(Provider.of<AdminMode>(context,listen: false).isAdmin)
          {
            if(_password==adminPassword)
              {
                try {
                  final authResult = await _auth.signIn(_email, _password);
                  modelHud.changeisloading(false);
                  Navigator.pushNamed(context, AdminHome.id);
                  print(authResult.user.uid);
                } catch (e) {
                  modelHud.changeisloading(false);

                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text(
                        e.message
                    ),
                  ));
                }

              }
            else {
              modelHud.changeisloading(false);
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text(
                        "something wrong"
                    ),
                  ));
                }
          }else
            {
              try {
                final authResult = await _auth.signIn(_email, _password);
                modelHud.changeisloading(false);
                print(authResult.user.uid);
                Navigator.pushNamed(context, HomeScreen.id);

              } catch (e) {
                modelHud.changeisloading(false);

                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text(
                      e.message
                  ),
                ));
              }
            }

    }
    modelHud.changeisloading(false);
  }
}

