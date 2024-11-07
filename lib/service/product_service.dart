import 'package:eshop/model/product.dart';
import 'package:get/get.dart';

class ProductService extends GetConnect{
    String urlCat = "https://api.escuelajs.co/api/v1/products";

    Future<List<Product>?> fetchProducts() async {
    final response =
        await get(urlCat);
    print("response: $response");
    if (response.status.hasError) {
      return Future.error("Erreur lors du chargement des produits");
    } else {
      return (response.body as List)
          .map((data) => Product.fromJson(data))
          .toList();
    }
  }
}