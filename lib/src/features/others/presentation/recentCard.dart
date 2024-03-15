// ignore_for_file: file_names

import 'package:flutter/material.dart';

class RecentCard extends StatelessWidget {
  const RecentCard({
    super.key,
    required this.dataLists,
  });

  final List<Map<String, dynamic>> dataLists;

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
                'Recent',
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
                itemCount: dataLists.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    Image.asset(
                      dataLists[index]['images'],
                      height: 60,
                      width: 70,
                    ),
                    Text(
                      dataLists[index]['titleNames'],
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
