

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_hiring/daashboard/controller/favorite_company_controller.dart';
import 'package:school_hiring/daashboard/controller/favorite_job_controller.dart';
import 'package:school_hiring/daashboard/screen/favorite_School_sreen.dart';
import 'package:school_hiring/daashboard/screen/favorite_job_sreen.dart';
class FavoriteTabScreen extends StatefulWidget {
  @override
  _FavoriteTabScreenState createState() => _FavoriteTabScreenState();
}

class _FavoriteTabScreenState extends State<FavoriteTabScreen> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  final FavoriteSchoolController _favoriteSchoolController = Get.put(FavoriteSchoolController());

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this)
      ..addListener(() {
        if (_tabController!.indexIsChanging && _tabController!.index == 0) {
          // When the "Schools" tab is selected
          _favoriteSchoolController.getDataRefresh();
        }
      });
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FavoriteJobController favoritejobcontroller = Get.put(FavoriteJobController());
    FavoriteSchoolController favoriteSchoolcontroller = Get.put(FavoriteSchoolController());

    return Scaffold(
      appBar: AppBar(
        title: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Academy'),
            Tab(text: 'Jobs'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          RefreshIndicator(
            onRefresh: () async {
              await favoriteSchoolcontroller.getData();
            },
            child: FavoriteSchoolScreen(),
          ),
          RefreshIndicator(
            onRefresh: () async {
              await favoritejobcontroller.getData();
            },
            child: FavoriteJobScreen(),
          ),
        ],
      ),
    );
  }
}
