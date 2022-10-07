import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../testModel/Flowerslist.dart';
import 'Counter.dart';



class List4widget extends StatelessWidget {
  late final Forthlistmodle list4key;
  List4widget({required this.list4key});



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
                  list4key.img.toString(),fit: BoxFit.cover,
                ),
              ),
                Positioned.fill(child: Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: Align(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: counter(),
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
