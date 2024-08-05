import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:zajil_v2/src/core/app%20states/app_states.dart';
import 'package:zajil_v2/src/features/ask_order/data/datasources/data_source.dart';
import 'package:zajil_v2/src/features/ask_order/data/models/message_model.dart';
import 'package:zajil_v2/src/features/ask_order/data/repositories/chat_repo_implmenter.dart';
import 'dart:math' as math;

part 'chat_cubit_state.dart';

class ChatCubit extends Cubit<ChatCubitState> {
  ChatCubit() : super(ChatCubitInitial());

  List<MessageModel> messages = [];
  ScrollController scrollController = ScrollController();

  ChatRepoImpl chatRepoImpl = ChatRepoImpl(chatDataSource: ChatDataSource());
  String chatID = '';
  String generateRandomId({int length = 10}) {
    const String chars =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    math.Random random = math.Random();
    return List.generate(length, (index) => chars[random.nextInt(chars.length)])
        .join('');
  }

  void sendMessage(String messageContent) {
    //adding user message to the chat
    var message = MessageModel(isSender: true, message: messageContent);
    messages.add(message);
    //scroole down to show user message
    emit(SendMessageSuccess());

    moveDown();

    //send message api
    chatRepoImpl
        .sendMessage(message: messageContent, chatId: chatID)
        .then((value) {
      value.fold((failure) => () {}, (data) {
        //adding Ai responce to the chat

        var message = MessageModel(isSender: false, message: data.message);
        messages.add(message);
        emit(RecieveMessageSuccess());
      });

      //scroole down to show Ai message
      moveDown();
    });
  }

  moveDown() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.jumpTo(
        scrollController.position.maxScrollExtent,
      );
    });
  }

  void init() {
    chatID = generateRandomId();
  }
}
