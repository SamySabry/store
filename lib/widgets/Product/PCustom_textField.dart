import 'package:flutter/material.dart';

import '../../constants.dart';


class PCustomTextField extends StatelessWidget {

  final  String type;
  final IconData icon;
  final Function onClick;

  PCustomTextField({@required this.onClick,@required this.type,@required this.icon});
  String error_message()
  {
    switch(type)
    {
      case "Name" : return "Name is empty";
      case "Price" : return "Price is empty";
      case "Description" : return "Description is empty";
      case "Category" : return "Category is empty";
      case "Location" : return "Location is empty";
    }
  }
  String hint_message()
  {
    switch(type)
    {
      case "Name" : return "Product Name";
      case "Price" : return "Product Price";
      case "Description" : return "Product Description";
      case "Category" : return "Product Category";
      case "Location" : return "Product Location";
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
