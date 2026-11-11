import 'package:flutter/material.dart';

import 'widgets/custom_app_bar.dart';
import 'widgets/custom_bottom_nav.dart';
import 'widgets/custom_fab.dart';
import 'widgets/scroll_widget.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: CustomAppBar(title: 'My first app'),
        body: ScrollWidget(),
        floatingActionButton: CustomFab(),
        bottomNavigationBar: CustomBottomNav(),
      ),
    );
  }
}
