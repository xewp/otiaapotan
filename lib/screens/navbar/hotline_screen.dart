import 'package:flutter/material.dart';

class HotlineScreen extends StatelessWidget {
  final ScrollController scrollController;

  const HotlineScreen({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [
        

      

          const Divider(thickness: 1),

          // Hotline List
          Expanded(
            child: ListView.separated(
              controller: scrollController,
              padding: const EdgeInsets.only(top: 10),
              itemCount: 10,
              separatorBuilder: (_, __) => Divider(color: Colors.grey[300]),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.phone, color: Colors.white),
                  ),
                  title: Text(
                    'Emergency Hotline ${index + 1}',
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text("Call: 123-456-${index + 1}"),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Calling Hotline ${index + 1}...'),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
