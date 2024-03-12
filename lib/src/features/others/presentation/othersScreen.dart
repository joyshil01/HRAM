import 'package:flutter/material.dart';
import 'detailsCard.dart';
import 'favoriteCard.dart';
import 'header.dart';
import 'recentCard.dart';

class othersScreen extends StatefulWidget {
  const othersScreen({super.key});

  @override
  State<othersScreen> createState() => _othersScreenState();
}

class _othersScreenState extends State<othersScreen> {
  int _notificationCount = 1;
  void _onNewNotification() {
    setState(() {
      _notificationCount++;
    });
  }

  List<Map<String, dynamic>> dataList = [
    {
      'image': 'assets/image/budget.png',
      'titleName': 'Sales Order',
    },
    {
      'image': 'assets/image/categories.png',
      'titleName': 'Quotations',
    },
    {
      'image': 'assets/image/shop.png',
      'titleName': 'Delivery',
    },
    {
      'image': 'assets/image/recurring.png',
      'titleName': 'Inventory',
    },
    {
      'image': 'assets/image/template.png',
      'titleName': 'Customers',
    },
    {
      'image': 'assets/image/travel.png',
      'titleName': 'Invoice',
    },
    {
      'image': 'assets/image/income.png',
      'titleName': 'Budgets',
    },
    {
      'image': 'assets/image/export.png',
      'titleName': 'Targets',
    },
  ];

  List<Map<String, dynamic>> dataLists = [
    {
      'images': 'assets/image/rate.png',
      'titleNames': 'Exchange rates utility',
    },
    {
      'images': 'assets/image/loan.png',
      'titleNames': 'Calculate loan interest',
    },
    {
      'images': 'assets/image/savings.png',
      'titleNames': 'Savings',
    },
    {
      'images': 'assets/image/personal.png',
      'titleNames': 'Personal Income Tax',
    },
    {
      'images': 'assets/image/split.png',
      'titleNames': 'Split money',
    },
    {
      'images': 'assets/image/widget.png',
      'titleNames': 'Widget',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            Header(notificationCount: _notificationCount),
            const SizedBox(height: 5),
            FavoriteCard(dataList: dataList),
            const SizedBox(height: 5),
            RecentCard(dataLists: dataLists),
            const SizedBox(height: 5),
            const DetailsCard(),
          ],
        ),
      ),
    );
  }
}
