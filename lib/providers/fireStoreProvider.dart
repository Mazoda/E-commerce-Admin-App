import 'dart:developer';
import 'dart:io';
import 'package:adminfirebas/AppRouter/AppRouter.dart';
import 'package:adminfirebas/data/fireStore_Helper.dart';
import 'package:adminfirebas/data/storage_Helper.dart';
import 'package:adminfirebas/models/Category.dart';
import 'package:adminfirebas/models/Product.dart';
import 'package:adminfirebas/views/screens/ProdcutsScreen.dart';
import 'package:adminfirebas/views/screens/UpdateProductScreen.dart';
import 'package:adminfirebas/views/widgets/success_Cat.dart';
import 'package:adminfirebas/views/widgets/successfulProduct.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// ignore: camel_case_types
class FireStoreProvider extends ChangeNotifier {
  TextEditingController categoryNameControllor = TextEditingController();
  TextEditingController producttypeControllor = TextEditingController();
  TextEditingController productNameControllor = TextEditingController();
  TextEditingController productDesControllor = TextEditingController();
  TextEditingController productPriceControllor = TextEditingController();
  TextEditingController productQuantitiyControllor = TextEditingController();
  FireStoreProvider() {
    getAllCategories();
  }

  List<Category> categories = [];
  List<Product>? products;
  File? selectedImage;
  int counter = 0;
  insertCollection(String colName) async {
    await FireStoreHelper.firestore.insertCollection(colName);
  }

  String? CatNamee(String? v) {
    if (v!.length < 3) {
      return 'Name should be more than 3';
    }
  }

  String? desc(String? v) {
    if (v!.length < 16) {
      return 'Name should be more than 16';
    }
  }

  String? type(String? v) {
    if (v!.length < 5 || v.length > 20) {
      return 'Name should between 5 and 16';
    }
  }

  String? QuanPrice(String? v) {
    if (v!.length <= 0) {
      return 'Value must be more than zero';
    } else if (v == null) {
      return "Value cant be null";
    }
  }

  // TextEditingController CatName = TextEditingController();

  selectImage() async {
    XFile? xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    selectedImage = File(xfile!.path);
    notifyListeners();
  }

  addUserToFireBase(String userName, String email, String id) async {
    await FireStoreHelper.firestore.addUserToFireBase(userName, email, id);
    notifyListeners();
  }

  getUserFromFireBase(String id) async {
    await FireStoreHelper.firestore.getUserFromFireBase(id);
    notifyListeners();
  }

  addNewCategory(GlobalKey<FormState> category) async {
    if (category.currentState!.validate()) {
      if (selectedImage != null) {
        String imageUrl = await StorageHelper.storageHelper
            .uploadImage(File(selectedImage!.path));
        Category category =
            Category(name: categoryNameControllor.text, imageUrl: imageUrl);
        FireStoreHelper.firestore.addNewCategory(category);
      }
      selectedImage = null;
      categoryNameControllor.clear();
      AppRoute.PushWithReplacementToWidget(
          SuccessfulCat("you have successfully Added a category"));
      getAllCategories();
      notifyListeners();
    }
  }

  getAllCategories() async {
    categories = await FireStoreHelper.firestore.getAllCategories();
    notifyListeners();
  }

  deleteCategory(Category category) async {
    await FireStoreHelper.firestore.deleteCategory(category);
    categories.removeWhere(
      (element) => element.catId == category.catId,
    );
    getAllCategories();
  }

  updateCategory(Category category) async {
    String? imageUrl;
    if (selectedImage != null) {
      imageUrl = await StorageHelper.storageHelper.uploadImage(selectedImage!);
    }

    Category newcategory = Category(
        name: categoryNameControllor.text,
        imageUrl: imageUrl ?? category.imageUrl);
    newcategory.catId = category.catId;
    await FireStoreHelper.firestore.updateCategory(newcategory);
    selectedImage = null;
    categoryNameControllor.clear();
    AppRoute.PushToWidget(
        SuccessfulCat("you have successfully Updated a category"));
    getAllCategories();
    notifyListeners();
  }

  getAllProducts(Category category) async {
    products = await FireStoreHelper.firestore.getAllProducts(category.catId);
    AppRoute.PushToWidget(ProductsScreen(products!, category));
    notifyListeners();
  }

  getAllProductsFromAdd(Category category) async {
    products = await FireStoreHelper.firestore.getAllProducts(category.catId);
    AppRoute.PushWithReplacementToWidget(ProductsScreen(products!, category));
    notifyListeners();
  }

  getProductsCount(Category category) async {
    List<Product> kpro =
        await FireStoreHelper.firestore.getAllProducts(category.catId);
        log("message");
    if (kpro.length != null) counter = kpro.length;
    notifyListeners();
  }

  addNewProduct(Category category, GlobalKey<FormState> productKey) async {
    if (productKey.currentState!.validate()) {
      if (selectedImage != null) {
        String imageUrl = await StorageHelper.storageHelper
            .uploadImage(File(selectedImage!.path));
        Product product = Product(
            name: productNameControllor.text,
            image: imageUrl,
            type: producttypeControllor.text,
            description: productDesControllor.text,
            price: num.parse(productPriceControllor.text),
            quantity: int.parse(productQuantitiyControllor.text));
        Product NewProduct = await FireStoreHelper.firestore
            .addNewProduct(product, category.catId);
        products!.add(NewProduct);
      }

      AppRoute.PushWithReplacementToWidget(
          SuccessfulPro("you have successfully Added a Product", category));
      producttypeControllor.clear();
      productNameControllor.clear();
      productDesControllor.clear();
      productPriceControllor.clear();
      productQuantitiyControllor.clear();
      selectedImage = null;

      notifyListeners();
    }
  }

  updateProduct(Product product, Category category) async {
    String? imageUrl;
    if (selectedImage != null) {
      imageUrl = await StorageHelper.storageHelper.uploadImage(selectedImage!);
    }

    Product newproduct = Product(
        name: productNameControllor.text,
        description: productDesControllor.text,
        type: producttypeControllor.text,
        image: imageUrl ?? product.image,
        price: num.parse(productPriceControllor.text),
        quantity: int.parse(productQuantitiyControllor.text));
    newproduct.id = product.id;

    await FireStoreHelper.firestore.updateProduct(newproduct, category.catId);

    selectedImage = null;
    AppRoute.PushWithReplacementToWidget(
        SuccessfulPro("you have successfully Updated a Prodcut", category));
    producttypeControllor.clear();
    productNameControllor.clear();
    productDesControllor.clear();
    productPriceControllor.clear();
    productQuantitiyControllor.clear();

    // getAllProducts(category);
    notifyListeners();
  }

  pushToUpdateScreen(Product product, Category category) {
    productDesControllor.text = product.description;
    productNameControllor.text = product.name;
    productPriceControllor.text = product.price.toString();
    productQuantitiyControllor.text = product.quantity.toString();
    producttypeControllor.text = product.type;
    ;
    AppRoute.PushWithReplacementToWidget(
        UpdateProductScreen(product, category));
  }

  deleteProduct(Product product, Category category) async {
    await FireStoreHelper.firestore.deleteProduct(product, category.catId);

    getAllProducts(category);
    notifyListeners();
  }
}
