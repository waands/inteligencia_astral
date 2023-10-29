import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:inteligencia_astral/theme.dart';
import 'package:flutter/material.dart';
import 'package:inteligencia_astral/components/navigation_menu.dart';
import 'package:inteligencia_astral/theme.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  ChatUser user = ChatUser(
    id: '1',
    firstName: 'Charles',
    lastName: 'Leclerc',
  );

  List<ChatMessage> messages = <ChatMessage>[];

  Future<void> sendMessage(ChatMessage message) async {
    final apiUrl = "https://esoteria.vercel.app/api/1/chat";
    List<Map<String, dynamic>> messageList = [];

    for (var m in messages) {
      if (m.user.id == user.id) {
        messageList.insert(0, {"role": "user", "content": m.text});
      } else {
        messageList.insert(0, {"role": "assistant", "content": m.text});
      }
    }

    try {
      final request = http.Request('POST', Uri.parse(apiUrl))
        ..headers['Content-Type'] = 'application/json'
        ..body = jsonEncode({"messages": messageList});

      final streamedResponse = await request.send();

      // Add a placeholder message to be updated in real-time
      ChatMessage placeholderMessage = ChatMessage(
        text: "",
        user: ChatUser(
          id: '2', // different ID for assistant
          firstName: 'Assistant',
          lastName: '',
        ),
        createdAt: DateTime.now(),
      );
      setState(() {
        messages.insert(0, placeholderMessage);
      });

      // Update the placeholder message word by word as chunks come in
      // TODO: (not working)
      streamedResponse.stream.transform(utf8.decoder).listen((value) {
        print(value);
        setState(() {
          placeholderMessage.text += value + " ";
        });
      }, onError: (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Stream error: $error")),
        );
      });
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Exception occurred: $error")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inteligencia Astral'),
        backgroundColor: AppTheme.colors.purpura,
      ),
      drawer: const NavMenu(),
      body: DashChat(
        currentUser: user,
        messageOptions: MessageOptions(
          currentUserContainerColor: AppTheme.colors.purpura,
          currentUserTextColor: Colors.white,
          containerColor: AppTheme.colors.green,
          textColor: Colors.white,
        ),
        onSend: (ChatMessage m) {
          setState(() {
            messages.insert(0, m);
          });
          sendMessage(m);
        },
        messages: messages,
      ),
    );
  }
}
