// ignore_for_file: file_names

import 'package:flutter/material.dart';

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({
    super.key,
    required this.dataList,
  });

  final List<Map<String, dynamic>> dataList;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.25,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Favorite',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 225,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 14,
                  crossAxisCount: 4,
                ),
                itemCount: dataList.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    Image.asset(
                      dataList[index]['image'],
                      height: 60,
                      width: 70,
                    ),
                    Text(
                      dataList[index]['titleName'],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
