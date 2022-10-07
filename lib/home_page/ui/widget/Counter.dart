import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/Colors/colors.dart';

class counter extends StatefulWidget {



  @override
  State<counter> createState() => _counterState();
}


class _counterState extends State<counter> {
  bool? check=false;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.white,
            ),
            child:InkWell(
              onTap: (){check=!check!;
              setState(() {

              });},
               child: check==false?
          Icon(Icons.add,color: PrimaryColor,):
          Icon(Icons.check,color: PrimaryColor,),


        ),
    );



  }
}
