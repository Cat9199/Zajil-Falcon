import 'package:zajil_v2/src/core/api/constant_end_points.dart';
import 'package:zajil_v2/src/core/api/dio_factory.dart';
import 'package:zajil_v2/src/features/menu/data/models/product_model.dart';

class MenuDataSource {
  Future<MenuModel> getMenu() async {
    var result = await DioFactory.getdata(
      url: EndPoints.getAllProducts,
    );
    return MenuModel.fromJson(result.data);
  }
}
