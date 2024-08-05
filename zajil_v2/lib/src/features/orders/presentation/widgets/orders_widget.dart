import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zajil_v2/src/features/orders/logic/order_cubit.dart';
import 'package:zajil_v2/src/features/orders/presentation/widgets/order_item_widget.dart';
import 'package:zajil_v2/src/features/orders/presentation/widgets/order_shimmer_loading.dart';

class OrdersWidget extends StatelessWidget {
  const OrdersWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        return state == GetOrderLoading()
            ? const OrderShimmerLoading()
            : Expanded(
                child: ListView.builder(
                  itemCount: context.read<OrderCubit>().searchResults?.length,
                  itemBuilder: (context, index) {
                    var Order =
                        context.read<OrderCubit>().searchResults?[index];

                    return OrderItemWidget(
                      orderName: Order?.order ?? '',
                      orderLocation: Order?.location ?? '',
                      orderPrice: Order?.price ?? '',
                      orderStatus: Order?.status ?? '',
                    );
                  },
                ),
              );
      },
    );
  }
}
