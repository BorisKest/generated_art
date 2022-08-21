import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: const Text('Bubbles'),
            onTap: () => Navigator.of(context).pushReplacementNamed('/home'),
          ),
          ListTile(
            title: const Text('OW'),
            onTap: () => Navigator.of(context).pushReplacementNamed('/ow'),
          ),
          ListTile(
            title: const Text('Lines'),
            onTap: () => Navigator.of(context).pushReplacementNamed('/lines'),
          ),
        ],
      ),
    );
  }
}
