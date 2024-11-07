import 'package:eshop/model/category.dart';
import 'package:eshop/model/product.dart';
import 'package:get/get.dart';

class CategoryService extends GetConnect {
  String urlCat = "https://api.escuelajs.co/api/v1/categories";

    Future<List<Category>?> fetchCategories() async {
    final response =
        await get(urlCat);
    print("response: $response");
    if (response.status.hasError) {
      return Future.error("Erreur lors du chargement des produits");
    } else {
      return (response.body as List)
          .map((data) => Category.fromJson(data))
          .toList();
    }
  }

}
