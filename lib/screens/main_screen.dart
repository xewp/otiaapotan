import 'package:floodpath/screens/ARScreen.dart';
import 'package:flutter/material.dart';
import 'package:floodpath/constants.dart';
import 'navbar/hotline_screen.dart';
import 'navbar/contact_card.dart';
import 'navbar/settings_sheet.dart';
import 'settings/customdropdown_menu.dart';
import 'navbar/notification_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = -1;
  bool _isPressed = false;
  String? _selectedLabel;
  bool _showNotifications = false;
  bool _showHotline = false;

  double _notificationPanelHeight = 0.7;
  double _hotlinePanelHeight = 0.7;
  double _contactPanelHeight = 0.7;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _selectedLabel = null;
      _showNotifications = index == 3;
      _showHotline = index == 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final bottomPadding = mediaQuery.padding.bottom;

    Widget buildPanel(String title, double height, Widget child) {
      return Positioned(
        bottom: kBottomNavigationBarHeight + bottomPadding,
        left: 0,
        right: 0,
        child: GestureDetector(
          onVerticalDragUpdate: (details) {
            setState(() {
              double delta = details.primaryDelta! / mediaQuery.size.height;
              if (title == "Contacts") {
                _contactPanelHeight = (_contactPanelHeight - delta).clamp(0.3, 0.9);
              } else if (title == "Emergency Hotlines") {
                _hotlinePanelHeight = (_hotlinePanelHeight - delta).clamp(0.3, 0.9);
              } else if (title == "Notifications") {
                _notificationPanelHeight = (_notificationPanelHeight - delta).clamp(0.3, 0.9);
              }
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: mediaQuery.size.height * height,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  spreadRadius: 0,
                  offset: Offset(0, -5),
                ),
              ],
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Container(
                    width: 40,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(child: child),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: const Text("Main Screen"),
        centerTitle: true,
        leading: InkWell(
          onTap: () => showSettingsSheet(context),
          borderRadius: BorderRadius.circular(30),
          child: SizedBox(
            width: 50,
            height: 50,
            child: Image.asset('assets/images/settings.png'),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Container(
            margin: const EdgeInsets.only(top: 10, right: 16),
            child: InkWell(
              onTap: () => setState(() => _isPressed = !_isPressed),
              borderRadius: BorderRadius.circular(30),
              child: SizedBox(
                width: 50,
                height: 50,
                child: Image.asset('assets/images/dropdown.png'),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Center(
            child: Text("Selected Page: ${_selectedLabel ?? _selectedIndex}"),
          ),

          if (_selectedIndex == 0)
            Positioned.fill(
              child: GestureDetector(
                onTap: () => setState(() => _selectedIndex = -1),
                child: Container(color: Colors.black.withOpacity(0.5)),
              ),
            ),

          if (_selectedIndex == 0)
            buildPanel("Contacts", _contactPanelHeight,
                ContactScreen(scrollController: ScrollController())),

          if (_showHotline)
            Positioned.fill(
              child: GestureDetector(
                onTap: () => setState(() {
                  _showHotline = false;
                  _selectedIndex = -1;
                }),
                child: Container(color: Colors.black.withOpacity(0.5)),
              ),
            ),

          if (_showHotline)
            buildPanel("Emergency Hotlines", _hotlinePanelHeight,
                HotlineScreen(scrollController: ScrollController())),

          if (_showNotifications)
            Positioned.fill(
              child: GestureDetector(
                onTap: () => setState(() {
                  _showNotifications = false;
                  _selectedIndex = -1;
                }),
                child: Container(color: Colors.black.withOpacity(0.5)),
              ),
            ),

          if (_showNotifications)
            buildPanel("Notifications", _notificationPanelHeight,
                const NotificationScreen()),

          CustomDropdownMenu(
            isVisible: _isPressed,
            onSelect: (label) {
              setState(() {
                _selectedLabel = label;
                _isPressed = false;
              });
            },
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              spreadRadius: 0,
              blurRadius: 10,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: BottomAppBar(
            color: BTN,
            notchMargin: 8.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        _selectedIndex == 0 ? Colors.black : Colors.white,
                        BlendMode.srcIn,
                      ),
                      child: Image.asset('assets/images/contactp.png', width: 30, height: 30),
                    ),
                    onPressed: () {
                      _onItemTapped(0);
                      _contactPanelHeight = 0.7;
                    },
                  ),
                  IconButton(
                    icon: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        _selectedIndex == 1 ? Colors.black : Colors.white,
                        BlendMode.srcIn,
                      ),
                      child: Image.asset('assets/images/runin.png', width: 30, height: 30),
                    ),
                    onPressed: () {
                      _onItemTapped(1);
                      setState(() => _selectedLabel = "evacuation");
                    },
                  ),
                  const SizedBox(width: 60),
                  IconButton(
                    icon: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        _selectedIndex == 2 ? Colors.black : Colors.white,
                        BlendMode.srcIn,
                      ),
                      child: Image.asset('assets/images/hotlines.png', width: 30, height: 30),
                    ),
                    onPressed: () {
                      _onItemTapped(2);
                      _hotlinePanelHeight = 0.7;
                    },
                  ),
                  IconButton(
                    icon: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        _selectedIndex == 3 ? Colors.black : Colors.white,
                        BlendMode.srcIn,
                      ),
                      child: Image.asset('assets/images/notif.png', width: 30, height: 30),
                    ),
                    onPressed: () {
                      _onItemTapped(3);
                      _notificationPanelHeight = 0.7;
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
       floatingActionButton: SizedBox(
        width: 85,
        height: 85,
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ARScreen()),
            );
          },
          child: Image.asset('assets/images/arlogo.png', width: 55, height: 55),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}