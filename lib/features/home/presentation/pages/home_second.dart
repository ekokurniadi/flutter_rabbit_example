import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rabbitmq_flutter/app.dart';
import 'package:rabbitmq_flutter/main.dart';

class HomeSeccond extends StatefulWidget {
  const HomeSeccond({Key? key}) : super(key: key);

  @override
  State<HomeSeccond> createState() => _HomeSeccondState();
}

class _HomeSeccondState extends State<HomeSeccond>
    with
        TickerProviderStateMixin,
        WidgetsBindingObserver,
        AutomaticKeepAliveClientMixin<HomeSeccond> {
  late StreamSubscription<String> _subscription;
  late List<String> messages;

  @override
  void initState() {
    App().init();
    messages = [];
    _startStreamRabbitService();

    super.initState();
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  Future<void> _startStreamRabbitService() async {
    _subscription = output.listen((data) {
      messages.add(data);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (BuildContext context, int index) {
                  return messages.isNotEmpty
                      ? Row(
                          mainAxisAlignment: (index % 2 == 0)
                              ? MainAxisAlignment.start
                              : MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 10,
                              ),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.blueAccent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    "${index + 1}. ",
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 16),
                                  ),
                                  Text(
                                    messages[index],
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      : const Center(child: Text("Pesan masih kosong"));
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 28.0),
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    messages.clear();
                  });
                },
                child: const Text("Clear Message")),
          )
        ],
      ),
    );
  }
}
