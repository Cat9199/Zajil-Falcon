import 'package:flutter/material.dart';

import 'package:zajil_v2/src/features/menu/data/models/product_model.dart';
import 'package:zajil_v2/src/features/menu/presentation/widgets/menu_item_widget.dart';
import 'package:zajil_v2/src/features/orders/presentation/widgets/order_item_widget.dart';

class ViewAllScreen extends StatelessWidget {
  List<Product> products;
  ViewAllScreen({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 20, crossAxisCount: 2),
            itemCount: products.length,
            itemBuilder: (context, index) {
              Product menu = products[index];
              return SizedBox(
                child: MenuItemWidget(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  itemName: menu.name ?? '',
                  itemCategory: menu.ingredients ?? '',
                  itemPrice: "${menu.price} EGP",
                  itemStatus: menu.stock ?? '',
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
