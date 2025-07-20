import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
           Icon(Icons.logout),
          TextButton(
            
            onPressed: () {
              // Add logout functionality
            },
            child: Text('Logout', style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
    );
  }
}