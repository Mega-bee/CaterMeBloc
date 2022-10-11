import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../../hive/hive.dart';
import '../../../../utils/Colors/colors.dart';
import '../../../response/homepage_response.dart';
import '../../widget/Counter.dart';
import '../counterafter.dart';
class DestinationWithPlacesList extends StatefulWidget {
  final HomePageModel homepage;
  final model;
  final index;

  DestinationWithPlacesList({required this.homepage, this.model, this.index});

  @override
  State<DestinationWithPlacesList> createState() =>
      _DestinationWithPlacesListState();
}

class _DestinationWithPlacesListState extends State<DestinationWithPlacesList> {
  bool rest = false;
  // ListCart cart = ListCart();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              "${widget.model.name}",
              style: GoogleFonts.poppins(
                fontStyle: FontStyle.normal,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 8.0),
          //   child: Text(
          //     "${widget.model.description}",
          //     style: GoogleFonts.poppins(
          //         fontStyle: FontStyle.normal,
          //         fontSize: 12,
          //         color: Colors.grey),
          //   ),
          // ),
          SizedBox(height: 34),
          Container(
            height: MediaQuery.of(context).size.height*0.2,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemCount: widget.model.items!.length,
                shrinkWrap: false,
                itemBuilder: (context, index) {
                  final F = widget.model.items![index];
                  return SizedBox(
                    width: MediaQuery.of(context).size.width*0.37,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      elevation: 2,
                      child: Stack(
                          children:[
                            Positioned.fill(
                            child:  Center(
                              child: CachedNetworkImage(
                                key: UniqueKey(),
                                imageUrl: F.image.toString(),
                                fit: BoxFit.cover,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ),
                                placeholder: (context, url) => Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: LoadingAnimationWidget.inkDrop(
                                      color: Theme.of(context).primaryColor,
                                      size: 20),
                                ),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                            Positioned.fill(child: Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: counterafter(
                                    increment: F.increment,
                                    max: F.max,
                                    min: F.min,
                                    function:(){
                                    }, ID: F.id,
                                    // countt: F.count,
                                    price: F.price,
                                  )
                                ),
                              ),
                            ))
                            // Align(
                            //   alignment:Alignment.bottomCenter,
                            //   child:Text("hi") ,
                            // )

                          ]
                      ),
                    ),
                  );


                  // Padding(
                  //   padding: const EdgeInsets.only(right: 18.0),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Padding(
                  //         padding: const EdgeInsets.only(right: 4.0, left: 8.0),
                  //         child: Container(
                  //           width: 280,
                  //           child: InkWell(
                  //             onTap: () {
                  //               print('iiiiiiii');
                  //               // Navigator.push(
                  //               //   context,
                  //               //   MaterialPageRoute(
                  //               //     builder: (BuildContext context) =>
                  //               //         ImageDetails(
                  //               //           creatingCartList:   cart.updatedCart(
                  //               //           placeCategory:  widget.model.title,
                  //               //           placeName:  F.title,
                  //               //           )!.toList(),
                  //               //       image: F.image,
                  //               //       title: F.title,
                  //               //       menu: F.menu,
                  //               //       categoryName: widget.model.title,
                  //               //     ),
                  //               //   ),
                  //               // );
                  //             },
                  //             child: ClipRRect(
                  //               borderRadius: BorderRadius.circular(14),
                  //               child: CachedNetworkImage(
                  //                 key: UniqueKey(),
                  //                 imageUrl: F.image.toString(),
                  //                 fit: BoxFit.cover,
                  //                 height: 170,
                  //                 imageBuilder: (context, imageProvider) =>
                  //                     Container(
                  //                   decoration: BoxDecoration(
                  //                     borderRadius: BorderRadius.circular(30),
                  //                     image: DecorationImage(
                  //                       image: imageProvider,
                  //                       fit: BoxFit.fitWidth,
                  //                     ),
                  //                   ),
                  //                 ),
                  //                 placeholder: (context, url) => Padding(
                  //                   padding: const EdgeInsets.all(15.0),
                  //                   child: LoadingAnimationWidget.inkDrop(
                  //                       color: Theme.of(context).primaryColor,
                  //                       size: 20),
                  //                 ),
                  //                 errorWidget: (context, url, error) =>
                  //                     Icon(Icons.error),
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //       SizedBox(
                  //         height: 15,
                  //       ),
                  //       Padding(
                  //         padding: const EdgeInsets.only(left: 9.0),
                  //         child: Text(
                  //           "${F.title}",
                  //           style: GoogleFonts.poppins(
                  //             fontStyle: FontStyle.normal,
                  //             fontSize: 14,
                  //             fontWeight: FontWeight.bold,
                  //           ),
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // );
                }),
          ),
        ],
      ),
    );
  }
}
