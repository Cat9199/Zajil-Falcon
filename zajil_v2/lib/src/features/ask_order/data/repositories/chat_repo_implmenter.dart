import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:zajil_v2/src/core/api/error_handler.dart';
import 'package:zajil_v2/src/core/api/failure.dart';
import 'package:zajil_v2/src/features/ask_order/data/datasources/data_source.dart';
import 'package:zajil_v2/src/features/ask_order/data/models/message_model.dart';

class ChatRepoImpl {
  final ChatDataSource chatDataSource;

  ChatRepoImpl({required this.chatDataSource});

  @override
  Future<Either<Failure, MessageModel>> sendMessage(
      {required String message, required String chatId}) async {
    try {
      var result =
          await chatDataSource.sendMessage(message: message, chatId: chatId);
      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  Future<Either<Failure, MessageModel>> sendVoice(
      {required String message, required String chatId}) async {
    try {
      var result =
          await chatDataSource.sendVoice(message: message, chatId: chatId);
      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  Future<Either<Failure, Response>> closeOrder({required String chatId}) async {
    try {
      var result = await chatDataSource.closeOrder(chatId: chatId);
      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}
