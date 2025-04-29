import 'package:flutter/material.dart';
import 'package:floodpath/screens/navbar/message_card.dart';

class ContactCard extends StatelessWidget {
  final String username;
  final String location;
  final String timeAndDate;

  const ContactCard({
    super.key,
    required this.username,
    required this.location,
    required this.timeAndDate,
  });

  void _showConfirmationDialog(BuildContext context, bool isCall) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(isCall ? "Make a call" : "Send a message"),
          content: Text("Would you like to use ${isCall ? 'in-app calling' : 'in-app messaging'} or ${isCall ? 'phone dialer' : 'SMS'}?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                if (isCall) {
                  // In-app call
                } else {
                  // In-app message - pass the username to the message sheet
                  showNewMessageSheet(context, username);
                }
              },
              child: Text(isCall ? 'In-app call' : 'In-app message'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                if (isCall) {
                  // Phone dialer
                } else {
                  // SMS
                }
              },
              child: Text(isCall ? 'Phone dialer' : 'SMS'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.purple[100],
          shape: BoxShape.circle,
          border: Border.all(color: Colors.purple, width: 2),
        ),
        child: const Icon(Icons.person, color: Colors.purple, size: 30),
      ),
      title: Text(
        username,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("At $location"),
          Text("Since $timeAndDate"),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.phone, color: Colors.black54),
            onPressed: () => _showConfirmationDialog(context, true),
          ),
          IconButton(
            icon: const Icon(Icons.chat, color: Colors.black54),
            onPressed: () => _showConfirmationDialog(context, false),
          ),
        ],
      ),
    );
  }
}

class ContactScreen extends StatelessWidget {
  final ScrollController scrollController;

  const ContactScreen({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: scrollController,
      itemCount: contactData.length,
      separatorBuilder: (_, __) => Divider(color: Colors.grey[300]),
      itemBuilder: (context, index) {
        final contact = contactData[index];
        return ContactCard(
          username: contact['username']!,
          location: contact['location']!,
          timeAndDate: contact['timeAndDate']!,
        );
      },
    );
  }
}

final List<Map<String, String>> contactData = [
  {
    'username': 'John Doe',
    'location': 'Park',
    'timeAndDate': '10:00 AM, Jan 1, 2024'
  },
  {
    'username': 'Jane Smith',
    'location': 'School',
    'timeAndDate': '11:30 AM, Jan 2, 2024'
  },
  {
    'username': 'David Lee',
    'location': 'Home',
    'timeAndDate': '1:00 PM, Jan 3, 2024'
  },
  {
    'username': 'Liam Cruz',
    'location': 'Market',
    'timeAndDate': '2:15 PM, Jan 4, 2024'
  },
];