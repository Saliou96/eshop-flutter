import 'package:eshop/model/category.dart';
import 'package:eshop/service/category_service.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController with StateMixin<List<Category>> {
  final CategoryService categoryService;

  CategoryController({required this.categoryService});

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  // Méthode pour récupérer les produits
  void fetchCategories() async {
    change(null, status: RxStatus.loading()); // Passer en état "loading"

    try {
      final categories = await categoryService.fetchCategories();
      change(categories,
          status:
              RxStatus.success()); // Passer en état "success" avec les données
    } catch (error) {
      change(null,
          status: RxStatus.error("Erreur lors du chargement des categories"));
    }
  }

  //  Future<void> addProduct(Product product) async {
  //   try {
  //     change(null, status: RxStatus.loading());
  //     print(state);
  //     final newProduct = await productService.createProduct(product);
  //     if (newProduct != null) {
  //       // Mise à jour de la liste des produits
  //       // final updatedProducts = [...?state, newProduct];
  //       // change(updatedProducts, status: RxStatus.success());
  //       fetchProducts();
  //     }
  //   } catch (error) {
  //     change(null, status: RxStatus.error("Erreur lors de la création du produit"));
  //   }
  // }
}
