import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class CategoriesService {
  Future<List<ProductModel>> getCategoriesProduct(
      {required String categoryName}) async {
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$categoryName');
    List<ProductModel> categories = [];
    for (var i = 0; i < data.length; i++) {
      categories.add(ProductModel.fromJson(data[i]));
    }
    return categories;
  }
}

//https://fakestoreapi.com/products/category/$categoryName