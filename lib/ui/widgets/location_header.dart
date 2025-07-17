import 'package:flutter/material.dart';

class LocationHeader extends StatelessWidget {
  const LocationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        
        const Expanded(
          child: Column(
            children: [
              Row(
                children: [const Icon(Icons.location_on, color: Colors.white),
        const SizedBox(width: 8),
                  Text(
                    'Bahrain Financial Harbour',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                   SizedBox(width:34),
                  Text(
                              'Oz Muharraq',
                              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w100),
                            ),
                ],
              ),
            ],
          ),
        ),

        IconButton(
          icon: const Icon(Icons.notifications_none, color: Colors.white),
          onPressed: () {},
        ),  
        IconButton(
          icon: const Icon(Icons.search, color: Colors.white),
          onPressed: () {},
        ),
      
      ],
    );
  }
}
