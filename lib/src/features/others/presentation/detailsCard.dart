import 'package:flutter/material.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.25,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              onTap: () {},
              leading: const CircleAvatar(
                radius: 20,
                backgroundColor: Colors.pinkAccent,
                child: Icon(Icons.apps),
              ),
              title: const Text(
                'All Categories',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
            const SizedBox(height: 8),
            ListTile(
              onTap: () {},
              leading: const CircleAvatar(
                radius: 20,
                backgroundColor: Colors.purpleAccent,
                child: Icon(Icons.settings),
              ),
              title: const Text(
                'General Settings',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
            const SizedBox(height: 8),
            ListTile(
              onTap: () {},
              leading: const CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blueGrey,
                child: Icon(Icons.menu),
              ),
              title: const Text(
                'Data',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
            const SizedBox(height: 8),
            ListTile(
              onTap: () {},
              leading: const CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.share,
                  color: Colors.white,
                ),
              ),
              title: const Text(
                'Tell friends',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
            const SizedBox(height: 8),
            ListTile(
              onTap: () {},
              leading: const CircleAvatar(
                radius: 20,
                backgroundColor: Color.fromARGB(255, 183, 182, 182),
                child: Icon(
                  Icons.star,
                  color: Colors.white,
                ),
              ),
              title: const Text(
                'Rate app',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
            const SizedBox(height: 8),
            ListTile(
              onTap: () {},
              leading: const CircleAvatar(
                radius: 20,
                backgroundColor: Color.fromARGB(255, 183, 182, 182),
                child: Icon(
                  Icons.email,
                  color: Colors.white,
                ),
              ),
              title: const Text(
                'Feedback',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
            const SizedBox(height: 8),
            ListTile(
              onTap: () {},
              leading: const CircleAvatar(
                radius: 20,
                backgroundColor: Color.fromARGB(255, 183, 182, 182),
                child: Icon(
                  Icons.info,
                  color: Colors.white,
                ),
              ),
              title: const Text(
                'Help and Information',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }
}
