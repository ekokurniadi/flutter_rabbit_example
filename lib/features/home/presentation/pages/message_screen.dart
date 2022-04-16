import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rabbitmq_flutter/core/cubit/rabbit_messaging/rabbit_messaging_cubit.dart';
import 'package:rabbitmq_flutter/core/helper/theme_helper.dart';
import 'package:rabbitmq_flutter/features/home/data/models/message_model.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<RabbitMessagingCubit>(context).startStream();
    List<MessageModel> message = [];

    return BlocBuilder<RabbitMessagingCubit, RabbitMessagingState>(
      builder: (context, state) {
        if (state is RabbitMessagingStreamComplete) {
          message.add(state.amqpData);
        }
        return Scaffold(
          backgroundColor: backgroundColor3,
          appBar: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            backgroundColor: backgroundColor1,
            centerTitle: true,
            title: Text(
              "Flutter RabbitMQ Messaging",
              style: primaryTextStyle.copyWith(
                fontWeight: medium,
                fontSize: 18,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: message.isEmpty
                      ? Center(
                          child: Text("Chat Masih Kosong",
                              style: primaryTextStyle.copyWith(
                                fontWeight: medium,
                                fontSize: 18,
                              )),
                        )
                      : ListView.builder(
                          itemCount: message.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              mainAxisAlignment: message[index].isSender
                                  ? MainAxisAlignment.end
                                  : MainAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 8,
                                    ),
                                    constraints: BoxConstraints(
                                      maxWidth:
                                          MediaQuery.of(context).size.width *
                                              0.6,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 12),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(
                                            message[index].isSender ? 12 : 0),
                                        topRight: const Radius.circular(12),
                                        bottomLeft: const Radius.circular(12),
                                        bottomRight: Radius.circular(
                                            message[index].isSender ? 0 : 12),
                                      ),
                                      color: message[index].isSender
                                          ? primaryColor
                                          : priceColor,
                                    ),
                                    child: Text(
                                      message[index].message,
                                      style: primaryTextStyle.copyWith(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            );
                          }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
