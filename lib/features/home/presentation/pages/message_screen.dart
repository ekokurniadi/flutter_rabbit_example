import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/cubit/rabbit_messaging/rabbit_messaging_cubit.dart';
import '../../../../core/helper/theme_helper.dart';
import '../../data/models/message_model.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<RabbitMessagingCubit>(context).startStream();
    List<MessageModel> message = [];

    Widget chatInput() {
      return Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                        color: backgroundColor1,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: TextFormField(
                        decoration: InputDecoration.collapsed(
                          hintText: "Type Message...",
                          hintStyle: subtitleTextStyle,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Image.asset(
                  "assets/button_send.png",
                  width: 45,
                )
              ],
            ),
          ],
        ),
      );
    }

    return BlocBuilder<RabbitMessagingCubit, RabbitMessagingState>(
      builder: (context, state) {
        if (state is RabbitMessagingStreamComplete) {
          message.add(state.amqpData);
        }
        return Scaffold(
          backgroundColor: backgroundColor3,
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            elevation: 0,
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
          bottomNavigationBar: chatInput(),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                message.isEmpty
                    ? Center(
                        child: Text(
                          "Chat Masih Kosong",
                          style: primaryTextStyle.copyWith(
                            fontWeight: medium,
                            fontSize: 18,
                          ),
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
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
                                        MediaQuery.of(context).size.width * 0.6,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(
                                        message[index].isSender ? 12 : 0,
                                      ),
                                      topRight: const Radius.circular(12),
                                      bottomLeft: const Radius.circular(12),
                                      bottomRight: Radius.circular(
                                        message[index].isSender ? 0 : 12,
                                      ),
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
                        },
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
