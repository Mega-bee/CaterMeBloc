//import 'package:flutter/material.dart';
//
//class CustomThemeDialog extends StatefulWidget {
//  final String title;
//  final String content;
//  final Function darkBtn;
//  final Function() lightBtn;
//
//  CustomThemeDialog(
//      {required this.title,
//      required this.content,
//      required this.darkBtn,
//      required this.lightBtn});
//
//  @override
//  State<CustomThemeDialog> createState() => _CustomThemeDialog();
//}
//
//class _CustomThemeDialog extends State<CustomThemeDialog> {
//  @override
//  Widget build(BuildContext context) {
//    return AlertDialog(
////      backgroundColor: ThemeHelper().getisDark() ? blackColor : primaryColor,
//      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//      title: Text(
//        widget.title,
//        style: TextStyle(
////            color: whiteColor,
//            fontSize: 20,
//            fontWeight: FontWeight.bold,
//            fontFamily: "BerlinSansFB"),
//        textAlign: TextAlign.center,
//      ),
//      content: Column(
//        mainAxisSize: MainAxisSize.min,
//        children: [
//          Text(
//            widget.content,
//            style: TextStyle(
////              color: whiteColor,
//              fontSize: 17,
//              fontFamily: "BerlinSansFB",
//            ),
//            textAlign: TextAlign.center,
//          ),
//          // const SizedBox(
//          //   height: 10,
//          // ),
//          Row(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: [
//              TextButton(
//                  onPressed: () {
//                  widget.lightBtn();
//
//                  },
//                  child: Text(
//                     "Light",
//                    style: TextStyle(
//                        fontSize: 15,
//                        fontWeight: FontWeight.bold,
//                        fontFamily: "BerlinSansFB",
////                        color: whiteColor
//                    ),
//                  )),
//              TextButton(
//                onPressed: () {
//                 widget.darkBtn();
//                },
//                child: Text("Dark",
//                    style: TextStyle(
////                      color: whiteColor,
//                      fontSize: 15,
//                      fontWeight: FontWeight.bold,
//                      fontFamily: "BerlinSansFB",
//                    )),
//              )
//            ],
//          ),
//        ],
//      ),
//    );
//  }
//}
