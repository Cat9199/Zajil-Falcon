import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zajil_v2/di.dart';

import 'package:zajil_v2/src/config/theme/styles.dart';
import 'package:zajil_v2/src/config/utils/app_strings.dart';
import 'package:zajil_v2/src/features/ask_order/presentation/widgets/common_back_ground.dart';
import 'package:zajil_v2/src/features/orders/logic/order_cubit.dart';
import 'package:zajil_v2/src/config/utils/common_widgets/search_bar.dart';
import 'package:zajil_v2/src/features/orders/presentation/widgets/order_shimmer_loading.dart';

import '../../../../config/utils/common_widgets/arrow_back.dart';
import '../widgets/order_item_widget.dart';
import '../widgets/orders_widget.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  void initState() {
    preOrder();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => OrderCubit()..getOrders(),
        child: Column(
          children: [
            Stack(
              children: [
                CommonBackGround(
                    hightFactor: 0.4,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        AppStrings.Orders,
                        style: font32BlackBold,
                      )),
                ),
                BlocBuilder<OrderCubit, OrderState>(
                  builder: (context, state) {
                    return Positioned(
                        bottom: 20,
                        left: 50,
                        child: SearchBarWidget(
                          onChanged: (keyword) {
                            context
                                .read<OrderCubit>()
                                .searchInOrdersLocally(keyword);
                          },
                        ));
                  },
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const OrdersWidget()
          ],
        ),
      ),
    );
  }
}
