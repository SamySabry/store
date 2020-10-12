import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/models/product.dart';
import 'package:store/services/store.dart';

import '../../constants.dart';
import 'editProduct.dart';

class ManageProducts extends StatefulWidget {
  static String id = "ManageProducts";

  @override
  _ManageProductsState createState() => _ManageProductsState();
}

class _ManageProductsState extends State<ManageProducts> {
  @override
  final _store = Store();

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
            stream: _store.loadProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Product> products = [];
                for (var doc in snapshot.data.docs) {
                  var data = doc.data();
                  products.add(Product(
                    pId: doc.id,
                      Pname: data[KProductName],
                      PPrice: data[KProductPrice],
                      PCategory: data[KProductCategory],
                      PLocation: data[KProductLocation],
                      PDescription: data[KProductDescription]));
                }

                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: .8),
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: GestureDetector(
                      onTapUp: (details) async{
                        double dx=details.globalPosition.dx;
                        double dy=details.globalPosition.dy;
                        double dx2=MediaQuery.of(context).size.width-dx;
                        double dy2=MediaQuery.of(context).size.height -dy;
                        showMenu(context: context, position: RelativeRect.fromLTRB(dx, dy, dx2, dy2), items: [
                         await MyPopupMenuItem(child: Text("edit"),
                            onClick:()
                            {
                              Navigator.pushNamed(context, EditProduct.id,arguments: products[index]);
                            }
                            ,),

                          MyPopupMenuItem(
                            onClick: ()
                              {
                                _store.deleteProduct(products[index].pId);
                                Navigator.pop(context);
                              }
                            ,child: Text('delete'))
                        ]);
                      },
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Image(
                              fit: BoxFit.fill,
                              //image: AssetImage(products[index].PLocation),
                              image: AssetImage("images/jackets/jacket1.jpg"),

                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: Opacity(
                              opacity: 0.6,
                              child: Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.white,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        products[index].Pname,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text("\$ ${products[index].PPrice}")
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  itemCount: products.length,
                );
              } else {
                return Center(child: Text("Loading...."));
              }
            }));
  }
}


class MyPopupMenuItem<T> extends PopupMenuItem<T>
{
final Widget child;
final Function onClick;

  @override
  PopupMenuItemState<T, PopupMenuItem<T>> createState() {
    return MyPopupMenuItemState();
  }

MyPopupMenuItem({@required this.child,@required this.onClick}):super(child:child);
}

class MyPopupMenuItemState <T, PopupMenuItem> extends PopupMenuItemState<T,MyPopupMenuItem<T>>{

  @override
  void handleTap() {
    widget.onClick();
  }
}