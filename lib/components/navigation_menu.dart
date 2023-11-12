import 'package:flutter/material.dart';
import 'package:inteligencia_astral/pages/chat.dart';
import 'package:inteligencia_astral/pages/profile.dart';

class NavMenu extends StatelessWidget {
  const NavMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // const DrawerHeader(
          //   decoration: BoxDecoration(
          //     color: Colors.blue,
          //   ),
          //   child: Text('Drawer Header'),
          // ),
          const SizedBox(height: 25),
          ListTile(
            title: const Text('Chat'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Chat(),
              ));
            },
          ),
          ListTile(
            title: const Text('Pefil'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Profile(),
              ));
            },
          ),
        ],
      ),
    );
  }
}
