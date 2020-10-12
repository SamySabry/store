import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/constants.dart';
import 'package:store/models/product.dart';
import 'package:store/services/store.dart';
import 'package:store/widgets/Product/PCustom_textField.dart';
import 'package:store/widgets/custom_textfield.dart';

import 'AdminHome.dart';

class AddProduct extends StatelessWidget
{
  @override
  static String id = 'AddProduct';

  String _name ,_price ,_description,_category,_imgLocation;
  final GlobalKey<FormState> _globalKey=GlobalKey<FormState>();
  final store =Store();
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
            SizedBox(height: 1,),

            PCustomTextField(
              type: "Price",
              onClick: (value)
              {
                _price=value;
              },
            ),
            SizedBox(height: 1,),
            PCustomTextField(
              type: "Description",
              onClick: (value)
              {
                _description=value;
              },
            ),
            SizedBox(height: 1,),
            PCustomTextField(
              type: "Category",
              onClick: (value)
              {
                _category=value;
              },
            ),
            SizedBox(height: 1,),
            PCustomTextField(
              type: "Location",
              onClick: (value)
              {
                _imgLocation=value;
              },
            ),
            SizedBox(height: 1,),
            RaisedButton(
              onPressed: ()
              async {
                  if(_globalKey.currentState.validate())
                    {
                      _globalKey.currentState.save();
                     print("1");
                      await store.addProduct(Product(
                        Pname: _name,
                        PPrice: _price,
                        PDescription: _category,
                        PCategory: _category,
                        PLocation: _imgLocation
                      ));
                      Navigator.pushNamed(context, AdminHome.id);
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