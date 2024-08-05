import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zajil_v2/src/features/menu/data/models/product_model.dart';
import 'package:zajil_v2/src/features/menu/logic/menu_cubit.dart';
import 'package:zajil_v2/src/features/menu/presentation/widgets/menu_item_widget.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuCubit, MenuState>(
      builder: (context, state) {
        return SizedBox(
          height: 230,
          child: ListView.builder(
            itemCount: context.read<MenuCubit>().searchResults.length ?? 0,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, indexItems) {
              Product Item =
                  context.read<MenuCubit>().searchResults[indexItems];

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: MenuItemWidget(
                  itemName: Item.name ?? "",
                  itemCategory: Item.ingredients ?? "",
                  itemPrice: "${Item.price} EGP",
                  itemStatus: Item.stock ?? "",
                ),
              );
            },
          ),
        );
      },
    );
  }
}
