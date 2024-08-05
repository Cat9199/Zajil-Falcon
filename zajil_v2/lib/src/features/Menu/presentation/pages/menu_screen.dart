import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zajil_v2/di.dart';

import 'package:zajil_v2/src/config/theme/styles.dart';
import 'package:zajil_v2/src/config/utils/app_strings.dart';
import 'package:zajil_v2/src/core/helpers/spacing.dart';
import 'package:zajil_v2/src/features/ask_order/presentation/widgets/common_back_ground.dart';
import 'package:zajil_v2/src/features/menu/data/models/product_model.dart';
import 'package:zajil_v2/src/features/menu/logic/menu_cubit.dart';
import 'package:zajil_v2/src/config/utils/common_widgets/search_bar.dart';
import 'package:zajil_v2/src/features/menu/presentation/widgets/menu_item_widget.dart';
import 'package:zajil_v2/src/features/menu/presentation/widgets/menu_shmir_loading.dart';

import '../widgets/all_category.dart';
import '../widgets/search_result_widget.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  void initState() {
    preMenu();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: BlocProvider(
          create: (context) => MenuCubit()..getMenu(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    CommonBackGround(
                      hightFactor: 0.4,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            AppStrings.MENU,
                            style: font32BlackBold,
                          )),
                    ),
                    BlocBuilder<MenuCubit, MenuState>(
                      builder: (context, state) {
                        return Positioned(
                            bottom: 20,
                            left: 50,
                            child: SearchBarWidget(
                              onChanged: (keyword) {
                                context
                                    .read<MenuCubit>()
                                    .searchInMenuLocally(keyword);
                              },
                            ));
                      },
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const AllCategory(),
                const SearchResultWidget(),
                verticalSpace(80),
              ],
            ),
          ),
        ));
  }
}
