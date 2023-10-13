import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:inteligencia_astral/theme.dart';
import 'package:flutter/material.dart';
import 'package:inteligencia_astral/components/navigation_menu.dart';
import 'package:inteligencia_astral/theme.dart';


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

  List<ChatMessage> messages = <ChatMessage>[
    ChatMessage(
      text: 'Olá!',
      user: ChatUser(
        id: '1',
        firstName: 'Gustavo',
        lastName: 'Lozerno',
      ),
      createdAt: DateTime.now(),
      
    ),
  ];

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
          // Customize message and user container colors here
          currentUserContainerColor: AppTheme.colors.purpura,
          currentUserTextColor: Colors.white,
          containerColor: AppTheme.colors.green,
          textColor: Colors.white,
        ),

        onSend: (ChatMessage m) {
          setState(() {
            messages.insert(0, m);
          });
        },
        messages: messages,
      ),
    );
  }
}
