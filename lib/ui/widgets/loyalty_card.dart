import 'package:flutter/material.dart';
import 'package:oz_cofe/services/DummyUserService.dart';

class LoyaltyCard extends StatelessWidget {
  const LoyaltyCard({super.key});

  @override
  Widget build(BuildContext context) {
    final user = DummyUserService().currentUser;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
                Image.asset(
                  'assets/images/Bronze.png',
                  height: 50,
                  fit: BoxFit.contain,
                ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Oz Loyalty', style: TextStyle(color: Colors.grey[600])),
              Text(user?.tier ?? "Bronze",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text('Oz Points', style: TextStyle(color: Colors.grey)),
              Text('${user?.points ?? 0} pts',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}
