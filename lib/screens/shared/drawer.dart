import 'package:flutter/material.dart';
import 'package:safetravel/screens/auth/login_screen.dart';
import 'package:safetravel/screens/history_order/history_order_screen.dart';

import 'package:safetravel/screens/main_screen.dart';
import 'package:safetravel/screens/profile/profile_screen.dart';
import 'package:safetravel/utilities/constants.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Material(
      color: kPrimaryColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 64),
                const SizedBox(height: 16),
                buildMenuItem(
                  text: 'Home',
                  icon: Icons.cabin,
                  onClicked: () => selectedItem(context, 0),
                ),
                const SizedBox(height: 16),
                buildMenuItem(
                  text: 'Profile',
                  icon: Icons.people_alt_rounded,
                  onClicked: () => selectedItem(context, 1),
                ),
                const SizedBox(height: 16),
                buildMenuItem(
                  text: 'Your Booking',
                  icon: Icons.add_shopping_cart,
                  onClicked: () => selectedItem(context, 2),
                ),
                const SizedBox(height: 16),
                buildMenuItem(
                  text: 'Certification Covid 19',
                  icon: Icons.add_moderator_outlined,
                  onClicked: () => selectedItem(context, 4),
                ),
                const SizedBox(height: 16),
                buildMenuItem(
                  text: 'History',
                  icon: Icons.history,
                  onClicked: () => selectedItem(context, 5),
                ),
                const SizedBox(height: 16),
                buildMenuItem(
                  text: 'Setting',
                  icon: Icons.settings,
                  onClicked: () => selectedItem(context, 6),
                ),
                const SizedBox(height: 24),
                Divider(color: Colors.white70),
                buildMenuItem(
                  text: 'Updates',
                  icon: Icons.update,
                  onClicked: () => selectedItem(context, 7),
                ),
                const SizedBox(height: 16),
                buildMenuItem(
                  text: 'Logout',
                  icon: Icons.logout,
                  onClicked: () => selectedItem(context, 8),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MainScreen(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProfileScreen(),
        ));
        break;
      case 5:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HistoryOrderScreen(),
        ));
        break;
      case 8:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ));
        break;
    }
  }
}
