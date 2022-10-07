import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../response/testModel/homepage_test_model.dart';
import 'Counter.dart';
import 'counterafter.dart';



class List3widget extends StatelessWidget {
  late final Thirdlistmodle list3key;
  List3widget({required this.list3key});



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      width: 130,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 2,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
              children:[ Positioned.fill(
                child: Image.asset(
                  list3key.img.toString(),fit: BoxFit.cover,
                ),
              ),
                Positioned.fill(child: Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: Align(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: counterafter(),
                    ),
                    alignment: Alignment.topRight,
                  ),
                ))
              ]
          ),
        ),
      ),
    );
  }
}
