// import 'package:flutter/material.dart';
//
// class DrawerMenu extends StatefulWidget {
//   final DrawerMenuItem _drawerMenuItemActive;
//   final Function(DrawerMenuItem) _onChangeContentPage;
//
//   const DrawerMenu(this._drawerMenuItemActive, this._onChangeContentPage,
//       {super.key});
//
//   @override
//   State<DrawerMenu> createState() => _DrawerMenuState();
// }
//
// class _DrawerMenuState extends State<DrawerMenu> {
//   @override
//   Widget build(BuildContext context) {
//     final user = ModalRoute.of(context)!.settings.arguments as UserCredential;
//
//     return Drawer(
//       child: ListView(
//         children: [
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//             color: Theme.of(context).primaryColor,
//             height: 240,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Expanded(child: SizedBox()),
//                 const CircleAvatar(
//                   backgroundColor: Colors.white,
//                   radius: 24,
//                   child: Icon(
//                     Icons.face,
//                     size: 48,
//                     color: Colors.black87,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 8,
//                 ),
//                 Text(
//                   Strings.HOME_DRAWER_LABEL_WELCOME
//                       .replaceFirst("%1s", user.email),
//                   style: Theme.of(context)
//                       .textTheme
//                       .labelLarge
//                       ?.copyWith(color: Colors.white),
//                 ),
//                 const Expanded(child: SizedBox()),
//                 SizedBox(
//                   height: 48,
//                   width: double.maxFinite,
//                   child: OutlinedButton(
//                       style: OutlinedButton.styleFrom(
//                         foregroundColor: Colors.white,
//                         side: const BorderSide(color: Colors.white, width: 2),
//                       ),
//                       onPressed: logout,
//                       child: const Text(Strings.HOME_DRAWER_BUTTON_EXIT)),
//                 )
//               ],
//             ),
//           ),
//           const Divider(
//             height: 2,
//             color: Colors.blueGrey,
//           ),
//           ListTile(
//               selected: isDrawerMenuItemTarget(DrawerMenuItem.HOME),
//               leading: const Icon(Icons.home),
//               title: const Text(Strings.HOME_DRAWER_HOME),
//               onTap: () => changeDrawerMenuItem(DrawerMenuItem.HOME)),
//           ListTile(
//             selected: isDrawerMenuItemTarget(DrawerMenuItem.CATEGORIES),
//             leading: const Icon(Icons.list),
//             title: const Text(Strings.HOME_DRAWER_CATEGORIES),
//             onTap: () {
//               Navigator.of(context).push(
//                   MaterialPageRoute(builder: (_) => const CategoriesPage()));
//             },
//           ),
//           ListTile(
//             selected: isDrawerMenuItemTarget(DrawerMenuItem.INVITE),
//             leading: const Icon(Icons.people_alt),
//             title: const Text(Strings.HOME_DRAWER_INVITE),
//             onTap: () => changeDrawerMenuItem(DrawerMenuItem.INVITE),
//           ),
//           ListTile(
//             leading: const Icon(Icons.info),
//             title: const Text(Strings.HOME_DRAWER_ABOUT),
//             onTap: () {
//               Navigator.of(context)
//                   .push(MaterialPageRoute(builder: (_) => const AboutPage()));
//             },
//           )
//         ],
//       ),
//     );
//   }
//
//   void changeDrawerMenuItem(DrawerMenuItem newItem) {
//     widget._onChangeContentPage(newItem);
//     Navigator.pop(context);
//   }
//
//   bool isDrawerMenuItemTarget(DrawerMenuItem itemTarget) =>
//       widget._drawerMenuItemActive == itemTarget;
//
//   void logout() {
//     Navigator.pushReplacement(
//         context, MaterialPageRoute(builder: (_) => const LoginPage()));
//   }
// }
//
// enum DrawerMenuItem { HOME, CATEGORIES, INVITE, ABOUT }
//
// // Widget build(BuildContext context) {
// //   return SafeArea(
// //     child: Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Four Finance'),
// //       ),
// //       drawer: Drawer(backgroundColor: Colors.blue[900]),
// //       body: Center(
// //         child: Padding(
// //           padding: EdgeInsets.all(8.0),
// //           child: Column(
// //             mainAxisSize: MainAxisSize.min,
// //             children: const [
// //               Expanded(
// //                 child: Text('Teste'),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     ),
// //   );
// // }
