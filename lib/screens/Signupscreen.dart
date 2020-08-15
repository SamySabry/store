import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:store/constants.dart';
import 'package:store/provider/modelHud.dart';
import 'package:store/screens/Loginscreen.dart';
import 'package:store/widgets/Custom_logo.dart';
import 'package:store/widgets/custom_textfield.dart';
import 'package:store/services/auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget {
  final GlobalKey<FormState> _globalKey =GlobalKey<FormState>();
  static String id = 'SignupScreen';
  final _auth=Auth();
  String _email,_password;
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
                },
                    type :"Name",
                    icon: Icons.perm_identity
                ),
                SizedBox(
                  height: hieght*0.02,
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
                    builder :(context)=> FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      onPressed: ()async
                      {
                        final modelHud=Provider.of<ModelHud>(context,listen: false);
                        modelHud.changeisloading(true);
                        if(_globalKey.currentState.validate())
                          {

                            _globalKey.currentState.save();
                            print(_email);
                            print(_password);
                            try {
                              final authResult = await _auth.signUp(
                                  _email, _password);
                              modelHud.changeisloading(false);
                              print(authResult.user.uid);
                            }on PlatformException catch(e)
                        {
                          print("be");
                          modelHud.changeisloading(false);
                          print("af");
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text(
                              e.message
                            ),
                          ));
                        }
                          }
                        modelHud.changeisloading(false);
                      },
                      color: Colors.black,
                      child: Text(
                        "Signup",
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
                        "Do you have an account ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16
                        )

                    ),
                    GestureDetector(
                      onTap:(){
                        Navigator.pushNamed(context, LoginScreen.id);
                      }
                      ,
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 16
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),

    );
  }
}

