import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/constants.dart';
import 'package:store/widgets/Product/PCustom_textField.dart';
import 'package:store/widgets/custom_textfield.dart';

class AddProduct extends StatelessWidget
{
  @override
  static String id = 'AddProduct';

  String _name ,_price ,_description,_category,_imgLocation;
  final GlobalKey<FormState> _globalKey=GlobalKey<FormState>();
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: kMainColor,
      body:Form(
        key: _globalKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PCustomTextField(
              type: "Name",
              onClick: (value)
              {
                _name=value;
              },
            ),
            SizedBox(height: 10,),

            PCustomTextField(
              type: "Price",
              onClick: (value)
              {
                _name=value;
              },
            ),
            SizedBox(height: 10,),
            PCustomTextField(
              type: "Description",
              onClick: (value)
              {
                _description=value;
              },
            ),
            SizedBox(height: 10,),
            PCustomTextField(
              type: "Category",
              onClick: (value)
              {
                _category=value;
              },
            ),
            SizedBox(height: 10,),
            PCustomTextField(
              type: "Location",
              onClick: (value)
              {
                _imgLocation=value;
              },
            ),
            SizedBox(height: 10,),
            RaisedButton(
              onPressed: ()
              {
                  if(_globalKey.currentState.validate())
                    {
                      _globalKey.currentState.save();
                    }
              },
              child: Text("Add Product"),
            )
          ],
        ),
      ),
    );
  }

}