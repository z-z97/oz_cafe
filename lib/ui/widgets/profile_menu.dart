import 'package:flutter/material.dart';
import 'package:oz_cofe/services/DummyUserService.dart';
import 'package:oz_cofe/ui/widgets/logout_button.dart';

class ProfileMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        MenuItem(icon: Icons.local_shipping, title: 'Shipping Address'),
        MenuItem(icon: Icons.card_membership, title: 'Membership'),
        MenuItem(icon: Icons.favorite, title: 'Favorite'),
        MenuItem(icon: Icons.contact_phone, title: 'Contact Us'),
        MenuItem(icon: Icons.help, title: 'FAQ'),
        ListTile(leading:Icon(Icons.logout , color: Color(0xFF056780),)  , title: Text('logout' , style: TextStyle(color: Color(0xFF056780) ),) , onTap: DummyUserService().logout,)
       
      ],
    );
  }
}

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;

  MenuItem({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {

        // Navigatei to the respective page
      },
    );
  }
}