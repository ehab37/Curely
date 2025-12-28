import 'package:curely/core/widgets/custom_search_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(25.0),
          child: Column(
            children: [
              CustomSearchField(text: "Search about user's record"),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Icon(CupertinoIcons.exclamationmark_circle),
                  SizedBox(width: 10,),
                  Text(
                    "Please, Search by National Id",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
