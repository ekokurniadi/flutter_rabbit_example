import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helper/theme_helper.dart';
import '../../data/models/list_message_model.dart';
import '../cubit/message_cubit.dart';

class ListMessageScreen extends StatelessWidget {
  const ListMessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ListMessageModel> listMessageModel = [];
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
      body: BlocBuilder<MessageCubit, MessageState>(
        builder: (context, state) {
          if (state is MessageLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is MessageFetchSuccess) {
            listMessageModel.add(state.message!);
          }
          return ListView.builder(
            itemCount: listMessageModel.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.only(
                    top: 33, left: defaultMargin, right: defaultMargin),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                listMessageModel[index].senderName,
                                style: primaryTextStyle.copyWith(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Divider(
                      thickness: 1,
                      color: Color(0xff2B2939),
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
