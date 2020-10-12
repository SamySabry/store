import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/constants.dart';
import 'package:store/screens/admin/ManageProducts.dart';

import 'AddProduct.dart';

class AdminHome extends StatelessWidget
{
  @override
  static String id = 'AdminHome';
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: kMainColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
          ),
          RaisedButton(
            onPressed: ()
            {
    Navigator.pushNamed(context, AddProduct.id);
            },
            child: Text(
              "Add Product"
            ),
          ),
          RaisedButton(
            onPressed: ()
            {
              Navigator.pushNamed(context, ManageProducts.id);
            },
            child: Text(
                "Edit Product"
            ),
          ),
          RaisedButton(
            onPressed: ()
            {

            },
            child: Text(
                "View orders"
            ),
          )
        ],
      ),
    );
  }

}