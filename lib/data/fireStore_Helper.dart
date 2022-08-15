import 'package:adminfirebas/models/Category.dart';
import 'package:adminfirebas/models/Product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';

class FireStoreHelper {
  FireStoreHelper._();
  static FireStoreHelper firestore = FireStoreHelper._();
  FirebaseFirestore firestoreinstance = FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> userCollection =
      FirebaseFirestore.instance.collection("users");
  CollectionReference<Map<String, dynamic>> catigoriesColletionRef =
      FirebaseFirestore.instance.collection("category");
  CollectionReference<Map<String, dynamic>> productColletionRef =
      FirebaseFirestore.instance.collection("category");

  insertCollection(String colName) async {
    firestoreinstance.collection(colName).add({"hi": "asdas"});
  }

  addUserToFireBase(String userName, String email, String id) async {
    userCollection
        .doc(id)
        .set({"email": email, "userID": id, "userName": userName});
  }

  getUserFromFireBase(String id) async {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await userCollection.doc(id).get();
    Map<String, dynamic>? datamap = documentSnapshot.data();
  }

  addNewCategory(Category category) async {
    await catigoriesColletionRef.add(category.toMap());
  }

  Future<List<Category>> getAllCategories() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await catigoriesColletionRef.get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> document =
        querySnapshot.docs;
    List<Category> categories = document.map((e) {
      Category category = Category.fromMap(e.data());
      category.catId = e.id;
      return category;
    }).toList();
    return categories;
  }

  deleteCategory(Category category) async {
    await catigoriesColletionRef.doc(category.catId).delete();
  }

  updateCategory(Category category) async {
    await catigoriesColletionRef.doc(category.catId).update(category.toMap());
  }

  Future<Product>addNewProduct(Product product, String catId)async {
  DocumentReference<Map<String, dynamic>> document =await  FirebaseFirestore.instance
        .collection("category")
        .doc(catId)
        .collection("products")
        .add(product.toMap());
        product.id=document.id;
        return product;
  }

  Future<List<Product>> getAllProducts(String catID) async {
    QuerySnapshot<Map<String, dynamic>> queryDocumentSnapshot =
        await FirebaseFirestore.instance
            .collection("category")
            .doc(catID)
            .collection("products")
            .get();
    List<Product> products = queryDocumentSnapshot.docs.map((e) {
      Product product = Product.formMap(e.data());
      product.id = e.id;
      return product;
    }).toList();
    return products;
  }

  deleteProduct(Product product,String catID) async{
        await FirebaseFirestore.instance
        .collection("category")
        .doc(catID)
        .collection("products")
        .doc(product.id)
        .delete();
  }

  updateProduct(Product product, String catID) async {
    await FirebaseFirestore.instance
        .collection("category")
        .doc(catID)
        .collection("products")
        .doc(product.id)
        .update(product.toMap());
  }
}
