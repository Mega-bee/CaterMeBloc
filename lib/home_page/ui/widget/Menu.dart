// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import '../../../utils/Colors/colors.dart';
// import '../../response/homepage_response.dart';
// import '../../response/testModel/homepage_test_model.dart';
// import 'Counter.dart';
// class List2widget extends StatefulWidget {
//   final HomePageModel? homepage;
//   final model;
//   final index;
//   List2widget({required this.homepage, this.model, this.index});
//
//   @override
//   State<List2widget> createState() => _List2widgetState();
// }
//
// class _List2widgetState extends State<List2widget> {
//   bool check=false;
//   @override
//   Widget build(BuildContext context) {
//     widget.list2key.check==false;
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Card(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20.0),
//         ),
//       elevation: 2,
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(20),
//           child: Stack(
//             children:[ Positioned.fill(
//               child: Image.asset(
//                 widget.list2key.img.toString(),fit: BoxFit.cover,
//               ),
//             ),
//               Positioned.fill(child: Padding(
//                 padding: const EdgeInsets.only(right: 5.0),
//                 child: Align(
//                   alignment: Alignment.topRight,
//                   child: Padding(
//                     padding: const EdgeInsets.all(5.0),
//                     child: Container(
//                       alignment: Alignment.center,
//                       height: 30,
//                       width: 30,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(100),
//                         color: Colors.white,
//                       ),
//                       child:InkWell(
//                         onTap:(){ widget.ontap();
//                         setState(() {
//
//                         });},
//                         child: widget.list2key.check==false?
//                         Icon(Icons.add,color: PrimaryColor,):
//                         Icon(Icons.check,color: PrimaryColor,),
//
//
//                       ),
//                     ),
//                   ),
//                 ),
//               ))
//             ]
//             ),
//           ),
//         ),
//     );
//   }
// }
