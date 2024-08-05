import 'package:dartz/dartz.dart';
import 'package:zajil_v2/src/core/api/error_handler.dart';
import 'package:zajil_v2/src/core/api/failure.dart';
import 'package:zajil_v2/src/features/orders/data/datasources/order_data_source.dart';
import 'package:zajil_v2/src/features/orders/data/models/order_model.dart';

class OrderRepoImpl {
  OrderDataSource orderDataSource;

  OrderRepoImpl(this.orderDataSource);

  Future<Either<Failure, OrderModel>> getOrders() async {
    try {
      var result = await orderDataSource.getOrders();
      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}
