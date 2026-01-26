import 'package:curely/constants.dart';
import 'package:curely/core/utils/styles.dart';
import 'package:curely/core/widgets/custom_search_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Column(
            children: [
              const Row(
                children: [
                  Text(" Search", style: Styles.style33),
                  Spacer(),
                  Icon(
                    FontAwesomeIcons.magnifyingGlass,
                    size: 28,
                    color: kNavyColor,
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(4),
                      height: 35,
                      decoration: BoxDecoration(
                        color: kNavyColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text("Medicines", style: Styles.styleWhite20),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(4),
                      height: 35,
                      decoration: BoxDecoration(
                        color: kSkyBlueColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text("Prescriptions", style: Styles.style16),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(4),
                      height: 35,
                      decoration: BoxDecoration(
                        color: kSkyBlueColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(child: Text("Rays", style: Styles.style16)),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(4),
                      height: 35,
                      decoration: BoxDecoration(
                        color: kSkyBlueColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text("Analysis", style: Styles.style16),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              CustomSearchField(text: "Search about user's record"),
              SizedBox(height: 12),
              Row(
                children: [
                  Icon(CupertinoIcons.exclamationmark_circle),
                  SizedBox(width: 10),
                  Text(
                    "Please, Search by National Id",
                    style: TextStyle(fontSize: 20),
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
