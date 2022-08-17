import 'package:adminfirebas/AppRouter/AppRouter.dart';
import 'package:adminfirebas/models/Category.dart';
import 'package:adminfirebas/models/Product.dart';
import 'package:adminfirebas/providers/fireStoreProvider.dart';
import 'package:adminfirebas/views/screens/addNewProduct.dart';
import 'package:adminfirebas/views/widgets/ProductWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatefulWidget {
  List<Product> products;
  Category category;
  ProductsScreen(this.products, this.category);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          widget.category.name + " Products",
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      // bottomNavigationBar: Container(
      //   decoration: const BoxDecoration(
      //     borderRadius: BorderRadius.only(
      //         topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      //     color: Colors.black,
      //   ),
      //   child: Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      //     child: GNav(
      //       backgroundColor: Colors.black,
      //       activeColor: Colors.white,
      //       color: Colors.white,
      //       tabBackgroundColor: Colors.grey.shade800,
      //       padding: EdgeInsets.all(8),
      //       tabs: const [
      //         GButton(
      //           icon: Icons.home,
      //           gap: 8,
      //           text: "Home",
      //         ),
      //         GButton(
      //           icon: Icons.shopping_cart,
      //           gap: 8,
      //           text: "cart",
      //         ),
      //         GButton(
      //           icon: Icons.notifications,
      //           gap: 8,
      //           text: "Notification",
      //         ),
      //         GButton(
      //           icon: Icons.person,
      //           gap: 8,
      //           text: "Profile",
      //         )
      //       ],
      //     ),
      //   ),
      // ),
      body: Container(
        margin: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
        child: Column(
          children: [
            Container(
                height: 780.h,
                child: Provider.of<FireStoreProvider>(context).products == null
                    ? Lottie.asset('assets/images/empty.json')
                    : GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: (0.66),
                        mainAxisSpacing: 10,
                        children: List.generate(
                            widget.products.length + 1,
                            (index) => index == widget.products.length
                                ? InkWell(
                                    onTap: () {
                                      AppRoute.PushToWidget(
                                          addNewProduct(widget.category));
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(top: 8),
                                          width: 200.w,
                                          height: 200.h,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            border: Border.all(
                                                width: 2, color: Colors.black),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.add_box_rounded),
                                              Text("Add Product",
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 20.sp,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0),
                                                  )),
                                            ],
                                          ),
                                        ),SizedBox(height:88.h ,)
                                      ],
                                    ),
                                  )
                                : ProductWidget(
                                    widget.products[index], widget.category)).reversed.toList()  )

                // GridView.builder(
                //     itemCount: widget.products.length,
                //     gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                //       crossAxisCount: 2,mainAxisSpacing: 200
                //     ),
                //     itemBuilder: (BuildContext context, int index) {
                //       return ProductWidget(
                //           widget.products[index], widget.category);
                //     },
                //   ),

                //  ListView.builder(
                //     itemCount: Provider.of<FireStoreProvider>(context)
                //         .categories!
                //         .length,
                //     itemBuilder: (context, index) {
                //       return CatWidget(
                //           Provider.of<FireStoreProvider>(context)
                //               .categories![index],
                //           index);
                //     })
                ),
            SizedBox(height: 0.h),
            // SizedBox(
            //   width: 350.w,
            //   height: 80.h,
            //   child: ElevatedButton(
            //       onPressed: () {
            //         // print(Provider.of<FireStoreProvider>(context,
            //         //         listen: false)
            //         //     .categories);
            //         AppRoute.PushToWidget(addNewProduct(widget.category));
            //       },
            //       style: ButtonStyle(
            //           backgroundColor: MaterialStateProperty.all(Colors.black),
            //           shape: MaterialStateProperty.all(StadiumBorder())),
            //       child: Text(
            //         "Add New Product",
            //         style: GoogleFonts.poppins(
            //             textStyle: TextStyle(
            //                 fontSize: 20.sp,
            //                 color: Colors.white,
            //                 fontWeight: FontWeight.bold)),
            //       )),
            // ),
          ],
        ),
      ),
    );
  }
}
