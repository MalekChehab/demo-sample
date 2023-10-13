import 'package:echo_cash/core/constants/app_constants.dart';
import 'package:echo_cash/core/constants/app_globals.dart';
import 'package:flutter/material.dart';

class LoggedInCustomDrawer extends StatefulWidget {
  const LoggedInCustomDrawer({super.key});

  @override
  State<LoggedInCustomDrawer> createState() => _LoggedInCustomDrawerState();
}

class _LoggedInCustomDrawerState extends State<LoggedInCustomDrawer> {
  late bool isDark = false;
  late bool allowNotification = false;
  late bool showSettings = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(0)),
      child: Column(
        children: [
          const DrawerHeader(
            name: 'Rima Dardar',
            position: 'Manager',
            imageUrl: '',
          ),
          if (!showSettings) ...[
            drawerList(),
          ] else ...[
            settingsList(),
          ],
          const Spacer(),
          Column(
            children: [
              ListTile(
                dense: true,
                leading: const Icon(
                  Icons.help_rounded,
                  color: greyColor2,
                ),
                title: const Text('Help',
                    style: backAndSkipButtonTextWhiteBgStyle),
                onTap: () {},
              ),
              ListTile(
                dense: true,
                leading: const Icon(
                  Icons.logout,
                  color: redColor,
                ),
                title: const Text(
                  'Logout',
                  style: textStyle1Red,
                ),
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget drawerList() {
    return Column(
      children: [
        ListTile(
          dense: true,
          leading: const Icon(
            Icons.home_rounded,
            color: greyColor2,
          ),
          title: const Text(
            'Home',
            style: backAndSkipButtonTextWhiteBgStyle,
          ),
          onTap: () {},
        ),
        const DrawerDivider(),
        ListTile(
          dense: true,
          leading: const Icon(
            Icons.wallet_outlined,
            color: greyColor2,
          ),
          title: const Text(
            'Wallets',
            style: backAndSkipButtonTextWhiteBgStyle,
          ),
          onTap: () {},
        ),
        const DrawerDivider(),
        ListTile(
          dense: true,
          leading: const Icon(
            Icons.person,
            color: greyColor2,
          ),
          title: const Text(
            'My Profile',
            style: backAndSkipButtonTextWhiteBgStyle,
          ),
          onTap: () {},
        ),
        const DrawerDivider(),
        ListTile(
          dense: true,
          leading: const Icon(
            Icons.lock,
            color: greyColor2,
          ),
          title: const Text(
            'Change PIN',
            style: backAndSkipButtonTextWhiteBgStyle,
          ),
          onTap: () {},
        ),
        const DrawerDivider(),
        ListTile(
          dense: true,
          leading: const Icon(
            Icons.notifications,
            color: greyColor2,
          ),
          title: const Text(
            'Notifications',
            style: backAndSkipButtonTextWhiteBgStyle,
          ),
          onTap: () {},
        ),
        const DrawerDivider(),
        ListTile(
          dense: true,
          leading: const Icon(
            Icons.settings,
            color: greyColor2,
          ),
          trailing: const Icon(
            Icons.chevron_right_rounded,
          ),
          title: const Text(
            'Settings',
            style: backAndSkipButtonTextWhiteBgStyle,
          ),
          onTap: () => setState(() => showSettings = true),
        ),
        const DrawerDivider(),
      ],
    );
  }

  Widget settingsList() {
    return Column(
      children: [
        ListTile(
          dense: true,
          leading: IconButton(
            icon: const Icon(Icons.chevron_left_rounded),
            color: greyColor2,
            onPressed: () => setState(() => showSettings = false),
          ),
          title: const Text(
            'Back',
            style: backAndSkipButtonTextWhiteBgStyle,
          ),
          onTap: null,
        ),
        const DrawerDivider(),
        SwitchListTile(
          value: allowNotification,
          onChanged: (value) => setState(() => allowNotification = value),
          dense: true,
          title: const Text(
            'Allow Notifications',
            style: backAndSkipButtonTextWhiteBgStyle,
          ),
        ),
        const DrawerDivider(),
        SwitchListTile(
          value: isDark,
          onChanged: (value) => setState(() => isDark = value),
          dense: true,
          title: const Text(
            'Dark Mode',
            style: backAndSkipButtonTextWhiteBgStyle,
          ),
        ),
        const DrawerDivider(),
        ListTile(
          dense: true,
          trailing: IconButton(
            icon: const Icon(
              Icons.arrow_drop_down_rounded,
              color: greyColor2,
            ),
            onPressed: () {},
          ),
          title: const Text(
            'English',
            style: backAndSkipButtonTextWhiteBgStyle,
          ),
          onTap: () {},
        ),
        const DrawerDivider(),
      ],
    );
  }
}

class DrawerHeader extends StatelessWidget {
  const DrawerHeader({
    required this.name,
    required this.position,
    required this.imageUrl,
    super.key,
  });

  final String name;
  final String position;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: const BoxDecoration(
        color: secondaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              maxRadius: 30,
              // place image here
              // backgroundImage:
              backgroundColor: whiteColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      // name here
                      name,
                      style: buttonTextDarkBgStyle,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.verified,
                        color: primaryColor,
                      ),
                    )
                  ],
                ),
                Container(
                  width: 140,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(6.0),
                        child: CircleAvatar(
                          maxRadius: 10,
                          backgroundColor: secondaryColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(
                          // position here
                          position,
                          style: backAndSkipButtonTextWhiteBgStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerDivider extends StatelessWidget {
  const DrawerDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: greyColor,
    );
  }
}
