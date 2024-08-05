import 'package:zajil_v2/src/core/api/constant_end_points.dart';
import 'package:zajil_v2/src/core/api/dio_factory.dart';
import 'package:zajil_v2/src/features/Menu/data/models/product_model.dart';
import 'package:zajil_v2/src/features/orders/data/models/order_model.dart';

class OrderDataSource {
  Future<OrderModel> getOrders() async {
    var result = await DioFactory.getdata(
      url: EndPoints.getAllOrders,
    );
    return OrderModel.fromJson(result.data);
  }
}
