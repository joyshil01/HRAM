// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.requestFocus();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.maybePop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Material(
          borderRadius: BorderRadius.circular(7),
          elevation: 1,
          child: TextFormField(
            focusNode: _focusNode,
            textInputAction: TextInputAction.search,
            onFieldSubmitted: (_) {},
            decoration: InputDecoration(
              prefixIcon: InkWell(
                onTap: () {},
                child: const Padding(
                  padding: EdgeInsets.only(
                    left: 0,
                  ),
                  child: Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 23,
                  ),
                ),
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.only(top: 10),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(7),
                ),
                borderSide: BorderSide.none,
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(7),
                ),
                borderSide: BorderSide(
                  color: Colors.black38,
                  width: 1,
                ),
              ),
              hintText: 'Search',
              hintStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 17,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
