// import 'package:flutter/material.dart';
// import 'package:open_weather_example_flutter/src/features/weather/presentation/weather_page.dart';


// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final bodies = const [
//    WeatherPage(),
//    WeatherPage(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final controller = context.watch<WeatherPage>();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'CEKAWAN',
//           style: TextStyle(fontWeight: FontWeight.w500),
//         ),
//       ),
//       body: bodies[controller.selectedIndex], // Render sesuai tab
//       bottomNavigationBar: BottomNavigationBar(
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             activeIcon: Icon(Icons.home),
//             icon: Icon(Icons.home_outlined),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             activeIcon: Icon(Icons.bookmark),
//             icon: Icon(Icons.bookmark_outline),
//             label: 'Maps',
//           ),
//         ],
//         currentIndex: controller.selectedIndex,
//         unselectedItemColor: Colors.grey,
//         selectedItemColor: Colors.black,
//         onTap: (index) {
//           controller.changeIndex(index);
//         },
//       ),
//     );
//   }
// }