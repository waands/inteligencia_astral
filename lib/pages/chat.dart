import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:inteligencia_astral/backend/localDatabase.dart';
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

      Map<String, dynamic> row = {
        LocalDatabaseHelper.columnRole:
            message.user.id == user.id ? 'user' : 'assistant',
        LocalDatabaseHelper.columnContent: message.text,
        LocalDatabaseHelper.columnDate: message.createdAt.toIso8601String(),
      };
      dbHelper.insert(row);
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
      streamedResponse.stream.transform(utf8.decoder).listen(
        (value) {
          print(value);
          setState(() {
            placeholderMessage.text += value;
          });
        },
        onError: (error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Stream error: $error")),
          );
        },
        onDone: () async {
          // Insert the message into the database
          Map<String, dynamic> row = {
            LocalDatabaseHelper.columnRole: 'assistant',
            LocalDatabaseHelper.columnContent: placeholderMessage.text,
            LocalDatabaseHelper.columnDate:
                placeholderMessage.createdAt.toIso8601String(),
          };
          await dbHelper.insert(row);
        },
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Exception occurred: $error")),
      );
    }
  }

  final dbHelper = LocalDatabaseHelper.instance;
  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  _loadMessages() async {
    final allRows = await dbHelper.queryAllRows();
    List<ChatMessage> dbMessages = [];
    for (var row in allRows) {
      dbMessages.insert(
          0,
          ChatMessage(
            text: row[LocalDatabaseHelper.columnContent],
            user: row[LocalDatabaseHelper.columnRole] == 'user'
                ? user
                : ChatUser(id: '2', firstName: 'Assistant', lastName: ''),
            createdAt: DateTime.parse(row[LocalDatabaseHelper.columnDate]),
          ));
    }
    setState(() {
      messages = dbMessages;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Inteligencia Astral'),
          backgroundColor: AppTheme.colors.purpura,
        ),
        drawer: const NavMenu(),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppTheme.colors.purpura, AppTheme.colors.roxo2],
            ),
          ),
          child: DashChat(
            currentUser: user,

            //inicio de configuracao UI
            messageOptions: MessageOptions(
              currentUserContainerColor: AppTheme.colors.purpura,
              currentUserTextColor: Colors.white,
              containerColor: AppTheme.colors.green,
              textColor: Colors.white,
              messageDecorationBuilder:
                  (message, previousMessage, nextMessage) {
                return BoxDecoration(
                  color: message.user.id == user.id
                      ? AppTheme.colors.purpura
                      : const Color.fromARGB(255, 143, 212, 193), //mudei um pouco a cor pra ficar mais fácil de ler
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 3.0,
                      blurRadius: 5.0,
                    ),
                  ],
                );
              },
            ),
            inputOptions: InputOptions(
              inputDecoration: InputDecoration(
                filled: true,
                iconColor: AppTheme.colors.green,
                fillColor: AppTheme.colors.white,
                hintText: "Me faça uma pergunta...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppTheme.colors.roxo2),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              sendButtonBuilder: (onPressed) {
                return Container(
                  decoration: BoxDecoration(
                    color: AppTheme.colors.green, // Cor do botão de enviar
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  margin: EdgeInsets.only(left: 4.0),
                  child: IconButton(
                    onPressed: onPressed,
                    icon: Icon(
                      Icons.send,
                      color: AppTheme
                          .colors.white, // Cor do ícone do botão de enviar
                    ),
                  ),
                );
              },
            ),
            //fim de configuracao UI

            onSend: (ChatMessage m) {
              setState(() {
                messages.insert(0, m);
              });
              sendMessage(m);
            },
            messages: messages,
          ),
        ));
  }
}
