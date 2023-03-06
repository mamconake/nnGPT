import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nngpt/main.dart';
import 'package:nngpt/providers/chat_provider.dart';
import 'package:nngpt/widgets/chat_item.dart';
import 'package:nngpt/widgets/my_app_bar.dart';
import 'package:nngpt/widgets/text_and_voice_field.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(),
        body: Column(
          children: [
            Expanded(
              child: Consumer(builder:
                  (BuildContext context, WidgetRef ref, Widget? child) {
                final chats = ref.watch(chatProvider);
                return ListView.builder(
                  itemCount: chats.length,
                  itemBuilder: (context, index) => ChatItem(
                    text: chats[index].message,
                    isMe: chats[index].isMe,
                  ),
                );
              }),
            ),
            const Padding(
              padding: const EdgeInsets.all(12.0),
              child: const TextAndVoiceField(),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ));
  }
}
