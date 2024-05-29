import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final Function(int) onItemTapped;
  final int selectedIndex;

  const CustomDrawer({
    Key? key,
    required this.onItemTapped,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black, // Set the background color of the drawer
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 30.0, 8.0, 8.0), // Changed padding here
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white, size: 32),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Text('', style: TextStyle(color: Colors.white)),
                  const SizedBox(width: 50), // Spacing for the icon button
                ],
              ),
            ),
            const Divider(color: Color.fromARGB(255, 0, 0, 0)), // Divider below header
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ListTile(
                      contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0), // Increase the padding here
                      title: const Text('Explore', style: TextStyle(color: Colors.white,fontSize: 30.0, fontWeight: FontWeight.bold)),
                      selectedTileColor: Colors.grey,
                      selected: selectedIndex == 0,
                      onTap: () {
                        onItemTapped(0);
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0), // Increase the padding here
                      title: const Text('Profile', style: TextStyle(color: Colors.white,fontSize: 30.0, fontWeight: FontWeight.bold)),
                      selectedTileColor: Colors.grey,
                      selected: selectedIndex == 1,
                      onTap: () {
                        onItemTapped(1);
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0), // Increase the padding here
                      title: const Text('Settings', style: TextStyle(color: Colors.white,fontSize: 30.0, fontWeight: FontWeight.bold)),
                      selectedTileColor: Colors.grey,
                      selected: selectedIndex == 2,
                      onTap: () {
                        onItemTapped(2);
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
