import 'package:caterme_v2/HomePage/ui/Widget/counterafter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/sheetaddonslist.dart';




class Listswidget extends StatelessWidget {
  late final listslistmodle listskey;
  Listswidget({required this.listskey});



  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            listskey.img.toString(),height: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0,bottom: 8.0,left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

              Text(listskey.text.toString(),style: const TextStyle(fontWeight: FontWeight.bold),),
              const Text('100 sar',style: TextStyle(color: Colors.grey),),
              Card(
                  shape:  RoundedRectangleBorder( //
                    borderRadius: BorderRadius.circular(40),

                  ),
                  child: counterafter())
            ],),
          )
        ],
      ),

    );

  }
}
