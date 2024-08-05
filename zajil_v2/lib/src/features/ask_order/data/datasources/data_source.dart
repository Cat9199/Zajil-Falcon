import 'package:dio/dio.dart';
import 'package:zajil_v2/src/core/api/constant_end_points.dart';
import 'package:zajil_v2/src/core/api/dio_factory.dart';
import 'package:zajil_v2/src/features/ask_order/data/models/message_model.dart';

class ChatDataSource {
  Future<MessageModel> sendMessage(
      {required String message, required String chatId}) async {
    var result =
        await DioFactory.postdata(url: '${EndPoints.textToText}$chatId', data: {
      "text": message,
    });
    return MessageModel.fromMap(result.data);
  }

  Future<MessageModel> sendVoice(
      {required String message, required String chatId}) async {
    var result = await DioFactory.postdata(
        url: '${EndPoints.textToVoice}$chatId',
        data: {
          "text": message,
        });
    return MessageModel.fromMap(result.data, isVoice: true);
  }

  Future<Response> closeOrder({required String chatId}) async {
    var result = await DioFactory.getdata(
      url: '${EndPoints.closeOrder}$chatId',
    );
    return result;
  }
}
