import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextField extends StatelessWidget {

  final  String type;
  final IconData icon;
  final Function onClick;

  CustomTextField({@required this.onClick,@required this.type,@required this.icon});
  String error_message()
  {
    switch(type)
    {
      case "Name" : return "name is empty";
      case "Email": return "Email is empty";
      case "Password" : return "Password is empty";
    }
  }
  String hint_message()
  {
    switch(type)
    {
      case "Name" : return "Enter your Name";
      case "Email": return "Enter your Email";
      case "Password" : return "Enter your Password";
    }
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        validator: (value)
        {
          if(value.isEmpty)
            {
              return error_message() ;
            // ignore: missing_return
            }
        },
        obscureText: type=="Password"?true:false,
        cursorColor: kMainColor,
        onSaved: onClick,
        decoration: InputDecoration(
            filled: true,
            fillColor: kSeconderyColor,
            hintText: hint_message(),
            prefixIcon: Icon(
              icon
              ,color: kMainColor,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                  color: Colors.white
              ), // borderRadius:
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                    color: Colors.white
                )),
            border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
              color: Colors.red
          ))
        ),
      ),
    );
  }

}
