import 'package:flutter/material.dart';
import 'package:seyahat/widgets/bottomnavbar.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Messages',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A76D2),
          ),),
        backgroundColor: Colors.white, // Adjust color as needed
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(8.0),
          ),
          // Conversations List
          Expanded(
            child: ListView.builder(
              itemCount: conversations.length, // Number of conversations
              itemBuilder: (context, index) {
                final conversation = conversations[index];
                return ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(conversation['avatarUrl']),
                  ),
                  title: Text(
                    conversation['username'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(conversation['lastMessage']),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        conversation['time'],
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      if (conversation['unreadCount'] > 0)
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            conversation['unreadCount'].toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ),
                    ],
                  ),
                  onTap: () {
                    // Navigate to conversation details
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(
                          username: conversation['username'],
                          avatarUrl: conversation['avatarUrl'],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(), // Include the bottom nav bar here
    );
  }
}

// Mock conversation data
final List<Map<String, dynamic>> conversations = [
  {
    'username': 'Muhammad Rashid',
    'lastMessage': 'Hi, are you available?',
    'time': '10:30 AM',
    'unreadCount': 2,
    'avatarUrl': 'https://via.placeholder.com/150'
  },
  {
    'username': 'Shahzad',
    'lastMessage': 'Thanks for the update!',
    'time': 'Yesterday',
    'unreadCount': 0,
    'avatarUrl': 'https://via.placeholder.com/150'
  },
  {
    'username': 'Shoaib',
    'lastMessage': 'Can we negotiate the price?',
    'time': 'Yesterday',
    'unreadCount': 7,
    'avatarUrl': 'https://via.placeholder.com/150'
  },
  // Add more conversations as needed
];

// ChatScreen for individual conversation
class ChatScreen extends StatelessWidget {
  final String username;
  final String avatarUrl;

  const ChatScreen({super.key, required this.username, required this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(avatarUrl),
            ),
            const SizedBox(width: 10),
            Text(
              username,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A76D2),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              // Chat messages area
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    final isMe = message['isMe'];

                    return Align(
                      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.all(12.0),
                        margin: const EdgeInsets.symmetric(vertical: 4.0),
                        decoration: BoxDecoration(
                          color: isMe ? Colors.blue[100] : Colors.grey[200],
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(12),
                            topRight: const Radius.circular(12),
                            bottomLeft: isMe ? const Radius.circular(12) : Radius.zero,
                            bottomRight: isMe ? Radius.zero : const Radius.circular(12),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                          children: [
                            Text(
                              message['text'],
                              style: TextStyle(
                                color: isMe ? Colors.black : Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              message['time'],
                              style: const TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Message input field
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Type a message...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(Icons.send, color: Color(0xFF1A76D2)),
                      onPressed: () {
                        // Handle send message action
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Custom positioned button
          Positioned(
            bottom: 70, // Position it above the message input
            right: 16, // Position it on the right side
            child: ElevatedButton.icon(
              onPressed: () {
                // Handle the "Create an Offer" action
              },
              icon: const Icon(Icons.add, color: Color(0xFFFFFFFF),),
              label: const Text('Create an Offer',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFFFFF),
                  )
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                backgroundColor: Color(0xFF1A76D2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final List<Map<String, dynamic>> messages = [
  {
    'text': 'Hi, are you available?',
    'isMe': false,
    'time': '10:30 AM',
  },
  {
    'text': 'Yes, I am. How can I help you?',
    'isMe': true,
    'time': '10:31 AM',
  },
  {
    'text': 'I need assistance with my project.',
    'isMe': false,
    'time': '10:32 AM',
  },
  {
    'text': 'Sure! Let’s discuss the details.',
    'isMe': true,
    'time': '10:33 AM',
  },
];
