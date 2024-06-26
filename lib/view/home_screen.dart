import 'package:favorite_item_test/view/all_members.dart';
import 'package:favorite_item_test/view/saved_members.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TabBar(
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.brown[600],
                  labelColor: Colors.brown[600],
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: const [
                    Tab(text: "ALL MEMBERS"),
                    Tab(text: "SAVED MEMBERS"),
                  ],
                ),
                const Expanded(
                  child: TabBarView(
                      children: [
                    AllMembersScreen(),
                    SavedMembersScreen(),
                  ]),
                )
              ],
            ),
        ),
      ),
    );
  }
}
