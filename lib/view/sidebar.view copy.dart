import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

import '../controller/sidebar.controller.dart';

class SidebarView extends StatefulWidget {
  const SidebarView({super.key});

  @override
  State<SidebarView> createState() => _SidebarViewState();
}

class _SidebarViewState extends State<SidebarView> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Builder(
        builder: (context) {
          final isSmallScreen = MediaQuery.of(context).size.width < 600;
          return Scaffold(
            key: _key,
            appBar: isSmallScreen
                ? AppBar(
                    title: const Text('Minhas Finanças'),
                    leading: IconButton(
                      onPressed: () {
                        _key.currentState?.openDrawer();
                      },
                      icon: const Icon(Icons.menu),
                    ),
                  )
                : null,
            drawer: SideBarXExample(
              controller: _controller,
            ),
            body: Row(
              children: [
                if (!isSmallScreen) SideBarXExample(controller: _controller),
                Expanded(
                    child: Center(
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      switch (_controller.selectedIndex) {
                        case 0:
                          _key.currentState?.closeDrawer();
                          return const Center(
                            child: Text(
                              'Home',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 40),
                            ),
                          );
                        case 1:
                          _key.currentState?.closeDrawer();
                          return const Center(
                            child: Text(
                              'Search',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 40),
                            ),
                          );
                        case 2:
                          _key.currentState?.closeDrawer();
                          return const Center(
                            child: Text(
                              'Settings',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 40),
                            ),
                          );
                        case 3:
                          _key.currentState?.closeDrawer();
                          return const Center(
                            child: Text(
                              'Theme',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 40),
                            ),
                          );
                        default:
                          return const Center(
                            child: Text(
                              'Home',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 40),
                            ),
                          );
                      }
                    },
                  ),
                ))
              ],
            ),
          );
        },
      ),
    );
  }
}
