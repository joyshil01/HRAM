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
      'image': 'assets/icons/sale.png',
      'titleName': 'Sales Order',
    },
    {
      'image': 'assets/icons/quotation.png',
      'titleName': 'Quotations',
    },
    {
      'image': 'assets/icons/Delivery2.png',
      'titleName': 'Delivery',
    },
    {
      'image': 'assets/icons/inventory.png',
      'titleName': 'Inventory',
    },
    {
      'image': 'assets/icons/customers.png',
      'titleName': 'Customers',
    },
    {
      'image': 'assets/icons/invoice.png',
      'titleName': 'Invoice',
    },
    {
      'image': 'assets/icons/budget.png',
      'titleName': 'Budgets',
    },
    {
      'image': 'assets/icons/target.png',
      'titleName': 'Targets',
    },
  ];

  List<Map<String, dynamic>> dataLists = [
    {
      'images': 'assets/icons/exchange.png',
      'titleNames': 'Exchange rates utility',
    },
    {
      'images': 'assets/icons/calculate.png',
      'titleNames': 'Calculate loan interest',
    },
    {
      'images': 'assets/icons/saveings.png',
      'titleNames': 'Savings',
    },
    {
      'images': 'assets/icons/personal.png',
      'titleNames': 'Personal Income Tax',
    },
    {
      'images': 'assets/icons/split.png',
      'titleNames': 'Split money',
    },
    {
      'images': 'assets/icons/widget.png',
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
