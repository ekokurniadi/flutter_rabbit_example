import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../app_config.dart';
import '../../../features/home/data/models/message_model.dart';
import '../../../main.dart';

part 'rabbit_messaging_state.dart';

class RabbitMessagingCubit extends Cubit<RabbitMessagingState> {
  RabbitMessagingCubit() : super(RabbitMessagingInitial());

  late StreamSubscription<String> _subscription;

  Future<void> startStream() async {
    AppConfig().rabbitInitial();
    _subscription = output.listen((data) {
      emit(RabbitMessagingStreamComplete(
          amqpData: MessageModel.fromJSON(json.decode(data))));
    });
  }

  void dispose() {
    _subscription.cancel();
  }
}
