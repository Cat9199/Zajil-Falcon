import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zajil_v2/src/core/helpers/extensions.dart';
import 'package:zajil_v2/src/core/helpers/spacing.dart';
import 'package:zajil_v2/src/core/routes/app_router.dart';
import 'package:zajil_v2/src/features/menu/data/models/product_model.dart';
import 'package:zajil_v2/src/features/menu/logic/menu_cubit.dart';
import 'package:zajil_v2/src/features/menu/presentation/widgets/menu_divider.dart';
import 'package:zajil_v2/src/features/menu/presentation/widgets/menu_item_widget.dart';
import 'package:zajil_v2/src/features/menu/presentation/widgets/menu_shmir_loading.dart';

class AllCategory extends StatelessWidget {
  const AllCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuCubit, MenuState>(
      builder: (context, state) {
        return context.read<MenuCubit>().searchResults.isNotEmpty
            ? const SizedBox.shrink()
            : state == GetMenuLoading()
                ? const MenuShimerLoading()
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: context.read<MenuCubit>().catrgories.length,
                      separatorBuilder: (context, indexItems) {
                        return verticalSpace(15);
                      },
                      itemBuilder: (BuildContext context, int indexCategory) {
                        String categoryName = context
                            .read<MenuCubit>()
                            .catrgories
                            .keys
                            .toList()[indexCategory];
                        //  log(categoryName);

                        return Column(
                          children: [
                            MenuDivider(
                              title: categoryName,
                              onTap: () {
                                context.goTo(Routes.viewAll,
                                    arguments: context
                                        .read<MenuCubit>()
                                        .getProductsByCategory(categoryName));
                              },
                            ),
                            SizedBox(
                              height: 230,
                              child: ListView.builder(
                                itemCount: context
                                        .read<MenuCubit>()
                                        .menu
                                        .products
                                        ?.length ??
                                    0,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, indexItems) {
                                  Product Item = context
                                      .read<MenuCubit>()
                                      .menu
                                      .products![indexItems];

                                  if (categoryName == Item.category) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: MenuItemWidget(
                                        itemName: Item.name ?? "",
                                        itemCategory: Item.ingredients ?? "",
                                        itemPrice: "${Item.price} EGP",
                                        itemStatus: Item.stock ?? "",
                                      ),
                                    );
                                  } else {
                                    return const SizedBox.shrink();
                                  }
                                },
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  );
      },
    );
  }
}
