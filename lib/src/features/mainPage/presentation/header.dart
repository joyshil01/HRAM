import 'package:flutter/material.dart';
import '../../../utils/colors.dart';

class HeaderMainScreen extends StatefulWidget {
  const HeaderMainScreen({super.key});

  @override
  State<HeaderMainScreen> createState() => _HeaderMainScreenState();
}

class _HeaderMainScreenState extends State<HeaderMainScreen> {
  bool _isBalanceVisible = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: appBarBg,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Card(
          elevation: 1.25,
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Text(
                          'Total balance',
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 13,
                        )
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Text(
                          _isBalanceVisible ? '2,030' : '***000',
                          style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          ' RS',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _isBalanceVisible = !_isBalanceVisible;
                    });
                  },
                  icon: Icon(
                    _isBalanceVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                    size: 35,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
