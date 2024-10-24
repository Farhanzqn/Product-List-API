import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/product_controller.dart';

class ProductListPage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Obx(() {
        if (productController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (productController.products.isEmpty) {
          return Center(child: Text('No products available'));
        } else {
          return ListView.builder(
            itemCount: productController.products.length,
            itemBuilder: (context, index) {
              var product = productController.products[index];
              return Card(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color(
                        int.parse(product.color.replaceFirst('#', '0xff'))),
                    child: Text(product.name[0].toUpperCase(),
                        style: TextStyle(color: Colors.white)),
                  ),
                  title: Text(product.name,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Year: ${product.year}'),
                      Text('Pantone: ${product.pantoneValue}'),
                    ],
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
