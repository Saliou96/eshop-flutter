import 'package:eshop/controller/category_controller.dart';
import 'package:eshop/controller/product_controller.dart';
import 'package:eshop/service/category_service.dart';
import 'package:eshop/service/product_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  final CategoryController categoryController =
      Get.put(CategoryController(categoryService: CategoryService()));

final ProductController productController =
      Get.put(ProductController(productService: ProductService()));


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SHOP")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: categoryController.obx(
                (categories) => ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories?.length ?? 0,
                  itemBuilder: (context, index) {
                    final category = categories![index];
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(
                            onPressed: () {
                              print(category.name);
                            },
                            child: Text(category.name),
                            style: ButtonStyle(
                              backgroundColor:
                                  WidgetStateProperty.all(Colors.blue),
                              foregroundColor:
                                  WidgetStateProperty.all(Colors.white),
                              padding: WidgetStateProperty.all(
                                  EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10)),
                              side: WidgetStateProperty.all(
                                  BorderSide(color: Colors.blue, width: 2)),
                              shape: WidgetStateProperty.all(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              )),
                            )),
                        SizedBox(width: 10),
                      ],
                    );
                  },
                ),
                onLoading: Center(child: CircularProgressIndicator()),
                onError: (error) =>
                    Center(child: Text(error ?? "Erreur inconnue")),
              ),
            ),
            Expanded(
              flex: 6,
              child: productController.obx(
                (products) => ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: products?.length ?? 0,
                  itemBuilder: (context, index) {
                    final product = products![index];
                    return ListTile(
                      title: Text(product.title),
                      subtitle: Text(product.category.name),
                    );
                  },
                ),
                onLoading: Center(child: CircularProgressIndicator()),
                onError: (error) =>
                    Center(child: Text(error ?? "Erreur inconnue")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
