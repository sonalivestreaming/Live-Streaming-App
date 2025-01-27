import 'package:flutter/material.dart';

import '../theme/colors.dart';
class UploadIcon extends StatelessWidget {
  const UploadIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 35,
      child: Stack(
        children: <Widget>[
          Positioned(
            right: 5,
               child: Container(
              width: 40,
              height: 35,
              decoration: BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.circular(8)
              ),
              child: Icon(Icons.add,color: Colors.white,),
            ),
          )
        ],
      ),
    );
  }
}