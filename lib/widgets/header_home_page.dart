import 'package:flutter/material.dart';

import '../theme/colors.dart';

class HeaderHomePage extends StatelessWidget {
  const HeaderHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Ensure spacing between start, center, and end
      children: <Widget>[
        Image.asset(
          'assets/discovery.png' ,
          width: 24,
          height: 24,
          color: white,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Following",
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 16,
              ),
            ),
            SizedBox(width: 8),
            Text(
              "|",
              style: TextStyle(
                color: Colors.white.withOpacity(0.3),
                fontSize: 17,
              ),
            ),
            SizedBox(width: 8),
            Text(
              "For You",
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        IconButton(
          icon: Icon(Icons.search, color: white), // Search icon at the end
          onPressed: () {
            // Add functionality for the search icon if needed
          },
        ),
      ],
    );
  }

}