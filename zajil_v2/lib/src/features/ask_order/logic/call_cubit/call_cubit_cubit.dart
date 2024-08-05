import 'dart:developer';
import 'dart:math' as math;

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:just_audio/just_audio.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:zajil_v2/src/core/api/constant_end_points.dart';
import 'package:zajil_v2/src/features/ask_order/data/datasources/data_source.dart';
import 'package:zajil_v2/src/features/ask_order/data/repositories/chat_repo_implmenter.dart';

part 'call_cubit_state.dart';

class CallCubit extends Cubit<CallCubitState> {
  CallCubit() : super(CallCubitInitial());

  String chatID = '';
  String generateRandomId({int length = 10}) {
    const String chars =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    math.Random random = math.Random();
    return List.generate(length, (index) => chars[random.nextInt(chars.length)])
        .join('');
  }

  final AudioPlayer _audioPlayer = AudioPlayer();

  bool isAISpeaking = false;

  void init() {
    chatID = generateRandomId();

    _audioPlayer.playerStateStream.listen((playerState) {
      if (playerState.processingState == ProcessingState.completed) {
        isAISpeaking = false;
        emit(AIStoped());
      }
    });
  }

  SpeechToText speech = SpeechToText();
  bool isUserSpeaking = false;

  Future<void> startListening() async {
    try {
      bool available = await speech.initialize(
          onStatus: statusListener,
          onError: errorListener,
          debugLogging: false);

      if (available) {
        isUserSpeaking = true;

        await speech.listen(
            onResult: resultListener,
            localeId: Constants.language,
            listenOptions: SpeechListenOptions(
                listenMode: ListenMode.dictation, partialResults: true
                //   onDevice: true,
                ));
        emit(UserSpeaking());
      } else {
        log("The user has denied the use of speech recognition.");
      }
    } catch (e) {
      await speech.stop();
    }
  }

  Future<void> stopListening() async {
    //if (lastWords.isNotEmpty) {
    // sendVoice(message: lastWords.replaceAll('- true', ''));
    //  }
    // await speech.stop();

    //lastWords = '';
    isUserSpeaking = false;
    emit(StopListening());
  }

  Future<void> statusListener(String status) async {
    log('Received listener status: $status, listening: ${speech.isListening}');
  }

  void errorListener(SpeechRecognitionError error) {
    log('Received error status: $error, listening: ${speech.isListening}');
  }

  String lastWords = '';

  Future<void> resultListener(SpeechRecognitionResult result) async {
    log('Result listener final: ${result.finalResult}, words: ${result.recognizedWords}');
    lastWords = '${result.recognizedWords} - ${result.finalResult}';
    if (result.finalResult && lastWords.isNotEmpty) {
      sendVoice(message: lastWords.replaceAll('- true', ''));
      await speech.stop();
    }
  }

  ChatRepoImpl chatRepoImpl = ChatRepoImpl(chatDataSource: ChatDataSource());
  sendVoice({
    required String message,
  }) async {
    chatRepoImpl.sendVoice(message: message, chatId: chatID).then((value) {
      value.fold(
          (failure) => () {
                //    AppStates.ErrorState(failure.message);
              }, (data) async {
        isAISpeaking = true;

        _audioPlayer.setUrl(data.message);
        emit(AISpeaking());

        await _audioPlayer.play();
        lastWords = '';
      });
    });
  }

  Future<void> cancelCall() async {
    await speech.stop();
    emit(CallEnded());
  }
}
