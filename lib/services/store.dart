import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:store/constants.dart';
import 'package:store/models/product.dart';

class Store
{
  //final Firestore _firestore=Firestore.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  addProduct(Product Product) async
  {
    await _firebaseFirestore.collection(KProductsCollections).add({
      KProductName : Product.Pname,
      KProductPrice: Product.PPrice,
      KProductDescription :Product.PDescription,
      KProductCategory : Product.PCategory,
      KProductLocation :Product.PLocation
    });
    print("save");
  }

 Stream<QuerySnapshot> loadProducts()
  {
    return _firebaseFirestore.collection(KProductsCollections).snapshots();
  }

  deleteProduct(documentId)
  {
    _firebaseFirestore.collection(KProductsCollections).doc(documentId).delete();
  }
  editProduct(data,documentId)
  {
    _firebaseFirestore.collection(KProductsCollections).doc(documentId).update(data);
  }














 /* Future<List<Product>> loadProducts() async
  {
    List<Product> products = [];

    await for(var snapshot in _firebaseFirestore.collection(KProductsCollections).snapshots()) {
       for (var doc in snapshot.docs) {
         var data = doc.data();
         products.add(Product(
             Pname: data[KProductName],
             PPrice: data[KProductPrice],
             PCategory: data[KProductCategory],
             PLocation: data[KProductLocation],
             PDescription: data[KProductDescription]
         ));
       }
     }
    return products;
  }
*/
}