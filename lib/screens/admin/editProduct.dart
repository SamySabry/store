import 'package:flutter/material.dart';
import 'package:store/models/product.dart';
import 'package:store/services/store.dart';
import 'package:store/widgets/Product/PCustom_textField.dart';

import '../../constants.dart';

class EditProduct extends StatelessWidget {
  static String id = "EditProduct";

  String _name, _price, _description, _category, _imgLocation;
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final store = Store();

  @override
  Widget build(BuildContext context) {
    Product product = ModalRoute
        .of(context)
        .settings
        .arguments;
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      backgroundColor: kMainColor,
      body: Form(
        key: _globalKey,
        child:ListView(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*.2,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                PCustomTextField(
                  type: "Name",
                  onClick: (value) {
                    _name = value;
                  },
                ),
                SizedBox(height: 1,),

                PCustomTextField(
                  type: "Price",
                  onClick: (value) {
                    _price = value;
                  },
                ),
                SizedBox(height: 1,),
                PCustomTextField(
                  type: "Description",
                  onClick: (value) {
                    _description = value;
                  },
                ),
                SizedBox(height: 1,),
                PCustomTextField(
                  type: "Category",
                  onClick: (value) {
                    _category = value;
                  },
                ),
                SizedBox(height: 1,),
                PCustomTextField(
                  type: "Location",
                  onClick: (value) {
                    _imgLocation = value;
                  },
                ),
                SizedBox(height: 1,),
                RaisedButton(
                  onPressed: () async {
                    if (_globalKey.currentState.validate()) {
                      _globalKey.currentState.save();
                      store.editProduct((
                          {KProductName : _name,
                            KProductLocation:_imgLocation,
                            KProductDescription:_description,
                            KProductCategory:_category,
                            KProductPrice:_price})
                          , product.pId);
                    }
                  },
                  child: Text("Add Product"),
                )
              ],
            ),
          ],
        )
      ),
    );
  }
}
