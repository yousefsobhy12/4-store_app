import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product_service.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_textfield.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({
    super.key,
  });
  static String id = 'Update Screen';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, description, image, price;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'Update Product',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextFormField(
                  onChaged: (data) {
                    productName = data;
                  },
                  hintText: 'Product Name',
                ),
                const SizedBox(height: 12),
                CustomTextFormField(
                  onChaged: (data) {
                    price = data;
                  },
                  hintText: 'Price',
                  inputType: TextInputType.number,
                ),
                const SizedBox(height: 12),
                CustomTextFormField(
                  onChaged: (data) {
                    description = data;
                  },
                  hintText: 'Description',
                ),
                const SizedBox(height: 12),
                CustomTextFormField(
                  onChaged: (data) {
                    image = data;
                  },
                  hintText: 'Image',
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: 'Update',
                  onTap: () async {
                    isLoading = true;
                    setState(() {});
                    try {
                      await updateProduct(product);
                      print('Success');
                    } catch (e) {
                      print("There's an exception${e.toString()}");
                    }
                    isLoading = false;
                    setState(() {});
                  },
                ),
              ],
            ),
          )),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
        id: product.id,
        title: productName == null ? product.title : productName!,
        price: price == null ? product.price : price!,
        description: description == null ? product.description : description!,
        image: image == null ? product.image : image!,
        category: product.category);
  }
}
