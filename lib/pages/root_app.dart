import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../widgets/upload_icon.dart';
import 'home_page.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }
  Widget getBody(){
    return IndexedStack(
      index: pageIndex,
      children: <Widget>[
        HomePage(),
        Center(
          child: Text("Discover",style: TextStyle(
            color: black,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),),
        ),
        Center(
          child: Text("Upload",style: TextStyle(
            color: black,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),),
        ),
        Center(
          child: Text("All Activity",style: TextStyle(
            color: black,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),),
        ),
        Center(
          child: Text("Profile",style: TextStyle(
            color: black,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),),
        )
      ],
    );
  }

  Widget getFooter() {
    List bottomItems = [
      {"asset": 'assets/home_.png', "label": "Home", "isIcon": true},
      {"asset": 'assets/search_.png', "label": "Discover", "isIcon": true},
      {"asset": "", "label": "", "isIcon": false},
      {"asset": 'assets/inbox.png', "label": "Inbox", "isIcon": true},
      {"asset": 'assets/me.png', "label": "Me", "isIcon": true}
    ];

    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(color: appBgColor),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(bottomItems.length, (index) {
            bool isSelected = index == pageIndex; // Check if the icon is selected

            return bottomItems[index]['isIcon']
                ? InkWell(
              onTap: () {
                selectedTab(index);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Image.asset(
                    bottomItems[index]['asset'],
                    width: 24,
                    height: 24,
                    color: isSelected ? primary : Colors.white70, // Change color based on selection
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Text(
                      bottomItems[index]['label'],
                      style: TextStyle(
                          color: isSelected ? primary : Colors.white70, // Change text color as well
                          fontSize: 10),
                    ),
                  )
                ],
              ),
            )
                : InkWell(
              onTap: () {
                selectedTab(index);
              },
              child: UploadIcon(),
            );
          }),
        ),
      ),
    );
  }

  selectedTab(index){
    setState(() {
      pageIndex = index;
    });
  }
}


