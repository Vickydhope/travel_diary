

import 'package:flutter/material.dart';
import 'package:travel_diary/constants/app_colors.dart';
import 'package:travel_diary/views/adapter_view.dart';
import 'package:travel_diary/views/everithing_view.dart';
import 'package:travel_diary/views/info_view.dart';
import 'package:travel_diary/views/playground_view.dart';
import 'package:travel_diary/views/visual_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Animate Demo',
      debugShowCheckedModeBanner: false,
      home: FlutterAnimateExample(),
    );
  }
}

// this is a very quick and dirty example.
class FlutterAnimateExample extends StatefulWidget {
  const FlutterAnimateExample({Key? key}) : super(key: key);

  static final List<TabInfo> tabs = [
    TabInfo(Icons.info_outline, (_) => InfoView(key: UniqueKey()), 'Info',
        'Simple example of Widget & List animations.'),
    TabInfo(Icons.palette_outlined, (_) => VisualView(key: UniqueKey()),
        'Visual', 'Visual effects like saturation, tint, & blur.'),
    TabInfo(Icons.format_list_bulleted, (_) => const AdapterView(), 'Adapters',
        'Animations driven by scrolling & user input.'),
    TabInfo(Icons.grid_on_outlined, (_) => const EverythingView(),
        'Kitchen Sink', 'Grid view of effects with default settings.'),
    TabInfo(Icons.science_outlined, (_) => TestView(key: UniqueKey()),
        'Sandbox', 'A blank canvas for experimenting.'),
  ];

  @override
  State<FlutterAnimateExample> createState() => _FlutterAnimateExampleState();
}

class _FlutterAnimateExampleState extends State<FlutterAnimateExample> {
  int _viewIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _viewIndex,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.unselectedTabColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.bottomAppBarColor,
        elevation: 0,
        onTap: (index) => setState(() => _viewIndex = index),
        items: [
          for (final tab in FlutterAnimateExample.tabs)
            BottomNavigationBarItem(
              icon: Icon(tab.icon),
              label: tab.label,
            )
        ],
      ),
      body: DefaultTextStyle(
        style: const TextStyle(
          color: AppColors.textColor,
          fontSize: 14,
          height: 1.5,
        ),
        child: SafeArea(
          bottom: false,
          child: FlutterAnimateExample.tabs[_viewIndex].builder(context),
        ),
      ),
    );
  }
}

class TabInfo {
  const TabInfo(this.icon, this.builder, this.label, this.description);

  final IconData icon;
  final WidgetBuilder builder;
  final String label;
  final String description;
}