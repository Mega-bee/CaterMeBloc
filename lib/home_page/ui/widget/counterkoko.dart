// import 'package:caterme_v2/utils/style/colors.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:loading_indicator/loading_indicator.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// class DetailsProdCard extends StatefulWidget {
//   final DetailsProductResponse detailsProductResponse;
//   final Function ontap;
//   final Function onselect;
//   final Function addtocart;
//
//   DetailsProdCard(
//       {required this.detailsProductResponse, required this.ontap,  required this.onselect,required this.addtocart});
//
//   @override
//   State<DetailsProdCard> createState() => _DetailsProdCardState();
// }
//
// class _DetailsProdCardState extends State<DetailsProdCard> {
//   bool _value = false;
//   bool selected = false;
//   late bool valu;
//   int selectedCard = -1;
//   int inc = 1;
//
//
//   @override
//   Widget build(BuildContext context) {
//     _value = widget.detailsProductResponse.isselected!;
//
//
//     return InkWell(
//       splashColor: Colors.white,
//       highlightColor: Colors.white,
//       onTap: () {
// // selectedCard=widget.index;
//
//
//
//         if(widget.detailsProductResponse.quantityInCart==0){
//           null;
//         }else{
//           _value = false;
//           selected = true;
//           widget.detailsProductResponse.isselected =
//           !widget.detailsProductResponse.isselected!;
//           widget.ontap();
//           widget.addtocart(widget.detailsProductResponse.id,  widget.detailsProductResponse.quantityInCart);
//           widget.onselect();}
//
//         // Future.delayed(Duration(seconds: 3),(){
//         //    selected=false;
//         //    inc=1;
//         //    setState(() {
//         //
//         //    });
//         // });
//
//         setState(() {});
//
//         // widget.ontap();
//       },
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
//           Stack(
//             children: [
//               Center(
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(15),
//                       topLeft: Radius.circular(15)),
//                   child: CachedNetworkImage(
//                     imageUrl: widget.detailsProductResponse.image.toString(),
//                     fit: BoxFit.cover,
//                     height: 110,
//                     imageBuilder: (context, imageProvider) => Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.only(
//                           bottomRight: Radius.circular(40),
//                         ),
//                         image: DecorationImage(
//                           image: imageProvider,
//                           fit: BoxFit.contain,
//                         ),
//                       ),
//                     ),
//                     placeholder: (context, url) => const Padding(
//                       padding: EdgeInsets.all(15.0),
//                       child: LoadingIndicator(
//                         indicatorType: Indicator.ballBeat,
//                         colors: [Colors.black],
//                       ),
//                     ),
//                     errorWidget: (context, url, error) => Icon(Icons.error),
//                   ),
//                 ),
//               ),
//               Container(
//                 height: 40,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(""),
//                     _value == false
//                         ? Container(
//                       width: 40,
//                       height: 40,
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(40)),
//                       child: Card(
//                         elevation: 3,
//                         color: selected == false &&
//                             widget.detailsProductResponse
//                                 .quantityInCart ==
//                                 0
//                             ? Colors.white
//                             : PrimaryColor,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20.0),
//                         ),
//                         child: InkWell(
//                           onTap: () {
//                             widget.ontap();
//
//                             _value = true;
//                             widget.detailsProductResponse.quantityInCart=widget.detailsProductResponse.quantityInCart! +1;
//
//                             setState(() {});
//                           },
//                           child: selected == false
//                               ? widget.detailsProductResponse
//                               .quantityInCart ==
//                               0
//                               ? Icon(
//                             CupertinoIcons.add,
//                             color: PrimaryColor,
//                             size: 25,
//                           )
//                               : Center(
//                               child: Text(
//                                 "${widget.detailsProductResponse.quantityInCart!} "
//                                 ,
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold),
//                               ))
//                               : Center(
//                               child: Text(
//                                 widget.detailsProductResponse.quantityInCart.toString(),
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 25,
//                                     fontWeight: FontWeight.bold),
//                               )),
//                         ),
//                       ),
//                     )
//                         : Container(
//                       width: 110,
//                       height: 40,
//                       decoration: BoxDecoration(
//                           color: Colors.transparent,
//                           borderRadius: BorderRadius.circular(40)),
//                       child: Card(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20.0),
//                         ),
//                         elevation: 3,
//                         child: Row(
//                           mainAxisAlignment:
//                           MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(left: 8.0),
//                               child:  widget.detailsProductResponse.quantityInCart == 0
//                                   ? InkWell(
//                                   onTap: () {
//                                     _value = false;
//                                     selected = false;
//
//                                     setState(() {});
//                                   },
//                                   child: Icon(
//                                     CupertinoIcons.delete,
//                                     color: PrimaryColor,
//                                     size: 20,
//                                   ))
//                                   : InkWell(
//                                   onTap: () {
//                                     if ( widget.detailsProductResponse.quantityInCart! > 1) {
//                                       widget.detailsProductResponse.quantityInCart = widget.detailsProductResponse.quantityInCart! -1;
//                                       setState(() {});
//                                     }
//                                     ;
//                                   },
//                                   child: Icon(
//                                     CupertinoIcons.minus,
//                                     color: PrimaryColor,
//                                     size: 20,
//                                   )),
//                             ),
//                             InkWell(
//                                 onTap: () {
//                                   _value = false;
//                                   selected = true;
//
//                                   widget.addtocart(
//                                       widget.detailsProductResponse.id,
//                                       widget.detailsProductResponse.quantityInCart!);
//                                   widget.onselect();
//                                 },
//                                 child: Text(
//                                   "${widget.detailsProductResponse.quantityInCart!} ",
//                                   style: GoogleFonts.anekLatin(
//                                       fontSize: 22,
//                                       fontWeight: FontWeight.bold),
//                                 )),
//                             Padding(
//                               padding: const EdgeInsets.only(right: 8.0),
//                               child: InkWell(
//                                   onTap: () {
//                                     widget.detailsProductResponse.quantityInCart= widget.detailsProductResponse.quantityInCart!+1;
//                                     setState(() {
//                                       widget.ontap();
//                                     });
//                                   },
//                                   child: Icon(
//                                     CupertinoIcons.add,
//                                     color: PrimaryColor,
//                                     size: 25,
//                                   )),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//
//           Container(
//               height: 50,
//               child: Column(
//                 children: [
//                   Text(
//                     "USD ${widget.detailsProductResponse.customerInitialPrice.toString()}",
//                     style: GoogleFonts.rubik(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 15),
//                   ),
//                   Text(
//                     "${widget.detailsProductResponse.title.toString()}",
//                     style: GoogleFonts.comfortaa(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 15),
//                   ),
//                 ],
//               )),
//
//           // Container(
//           //   decoration: BoxDecoration(
//           //       color: Color.fromRGBO(250, 216, 1,0.6),
//           //       borderRadius: BorderRadius.only(
//           //         topRight: Radius.circular(5),bottomRight: Radius.circular(65),
//           //         bottomLeft: Radius.circular(35),topLeft: Radius.circular(5),
//           //
//           //       )),
//           //   width:50,
//           //   child:
//           //
//           // ),
//         ],
//       ),
//     );
//   }
// }