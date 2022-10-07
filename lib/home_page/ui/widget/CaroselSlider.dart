import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../testModel/CaroselList.dart';



class List1widget extends StatelessWidget {
  late final Firslistmodle list1key;
  List1widget({required this.list1key});



  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () => null,
        child: SizedBox(
          height: 500,
          width: 400,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(

              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                list1key.img.toString(),fit: BoxFit.cover,height: 250,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
