import 'package:coherent/src/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

import '../../../../model/message_model.dart';

class MessagingScreen extends StatefulWidget {
  const MessagingScreen({super.key});

  @override
  State<MessagingScreen> createState() => _MessagingScreenState();
}

class _MessagingScreenState extends State<MessagingScreen> {
  List<Message> messages = [
    Message(
        text: "Hello MR Fayyaz Ali This is Dr Saleem your new prescription have been assigned please check your "
            "prescription notification",
        date: DateTime.now(),
        isSentByMe: false),
    Message(text: "Hi DR thank you yes its assigned", date: DateTime.now(), isSentByMe: true),
  ];
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Messages list
          Expanded(
            child: GroupedListView<Message, DateTime>(
              reverse: true,
              order: GroupedListOrder.DESC,
              useStickyGroupSeparators: true,
              floatingHeader: true,
              elements: messages,
              groupBy: (message) => DateTime(message.date!.year, message.date!.month, message.date!.day),
              groupHeaderBuilder: (Message message) => SizedBox(
                height: 40,
                child: Center(
                  child: Card(
                    color: AppColors.primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                      child: Text(
                        DateFormat('MMM dd,yyyy').format(message.date),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              itemBuilder: (context, Message message) => Align(
                alignment: message.isSentByMe! ? Alignment.centerRight : Alignment.centerLeft,
                child: LayoutBuilder(
                  // Wrap message content with LayoutBuilder
                  builder: (context, constraints) {
                    // Calculate max width based on half screen size
                    final maxWidth = constraints.maxWidth / 1.5;

                    return ConstrainedBox(
                      // Constrain message width
                      constraints: BoxConstraints(maxWidth: maxWidth),
                      child: Card(
                        color: message.isSentByMe! ? Colors.white38 : AppColors.primaryColor,
                        elevation: 8,
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            message.text ?? "",
                            style: TextStyle(
                              color: message.isSentByMe! ? Colors.black : Colors.white,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          // Input section
          Container(
            padding: const EdgeInsets.all(8.0),
            // color: Colors.grey.shade200,
            child: Row(
              children: [
                // Text input
                Expanded(
                  child: TextFormField(
                    controller: messageController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: "Type your message here...",
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                // Send button
                CircleAvatar(
                  backgroundColor: AppColors.primaryColor,
                  child: IconButton(
                    onPressed: () {
                      // Handle message sending logic here
                      if (messageController.text.isNotEmpty) {
                        final message = Message(text: messageController.text, date: DateTime.now(), isSentByMe: true);
                        print("Sending message...");

                        setState(() {
                          messages.add(message);
                          messageController.clear();
                        });
                      }
                    },
                    icon: const Icon(Icons.send, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
