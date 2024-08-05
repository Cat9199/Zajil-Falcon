import 'package:dartz/dartz.dart';
import 'package:zajil_v2/src/core/api/error_handler.dart';
import 'package:zajil_v2/src/core/api/failure.dart';
import 'package:zajil_v2/src/features/menu/data/datasources/menu_data_source.dart';
import 'package:zajil_v2/src/features/menu/data/models/product_model.dart';

class MenuRepoImpl {
  MenuDataSource menuDataSource;

  MenuRepoImpl(this.menuDataSource);

  Future<Either<Failure, MenuModel>> getMenu() async {
    try {
      var result = await menuDataSource.getMenu();
      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}
