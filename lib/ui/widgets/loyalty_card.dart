import 'package:flutter/material.dart';
import 'package:oz_cofe/services/DummyUserService.dart';
import 'package:oz_cofe/model/users.dart';

class LoyaltyCard extends StatefulWidget {
  const LoyaltyCard({super.key});

  @override
  State<LoyaltyCard> createState() => _LoyaltyCardState();
}

class _LoyaltyCardState extends State<LoyaltyCard> {
  late Future<UserModel?> _userFuture;

  @override
  void initState() {
    super.initState();
    _userFuture = DummyUserService().getuser();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserModel?>(
      future: _userFuture,
      builder: (context, snapshot) {
        final user = snapshot.data;

        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
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
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold , color: Color(0xFF056780))),
                ],
              ),
              const Spacer(),
SizedBox(
  height: 50, 
  child: VerticalDivider(
    color: Colors.grey[300],
    thickness: 1,
    width: 32,
  ),
),


              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text('Oz Points', style: TextStyle(color: Colors.grey)),
                  Row(
                    children: [
                                            Image.asset('assets/images/Vector.png', height: 20, width: 20),
                      Text('${user?.points ?? 0}',
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold )),
                          Text(' pts',
                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300 , color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
