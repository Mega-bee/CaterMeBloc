import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cater_me_bloc/home_page/ui/widgets/Listview_gridview/destination_with_places_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../abstracts/states/state.dart';
import '../../../hive/hive.dart';
import '../../../utils/Colors/colors.dart';
import '../../response/homepage_response.dart';
import '../../response/testModel/homepage_test_model.dart';
import '../screens/home_page_list.dart';
import '../widget/Addons.dart';
import '../widget/CaroselSlider.dart';
import '../widget/Flowers.dart';
import '../widget/Menu.dart';
import '../widget/gridView_images_details_homepage.dart';
import '../widget/images_details/category_details.dart';
import '../widget/images_details/homepage_ads_details.dart';
import '../widget/images_details/images_details.dart';
import '../widget/view_all_categories.dart';
import '../widgets/Carousel_slider_widget/carousel_image_slider.dart';
import '../widgets/Listview_gridview/gridView_images_details_homepage.dart';
class HomePageSuccess extends States {
  final HomePageModel homepage;
  HomePageState homepageState;
  HomePageSuccess({required this.homepage, required this.homepageState})
      : super(false);
  int _currentIndex = 0;
  ScrollController? _controller = ScrollController();
  List<Packages> packages = [];

  @override
  Widget getUI(BuildContext context) {
    ///cutsom cache image manager
     final customCacheManager = CacheManager(
      Config(
        'customCacheKey',
        stalePeriod: Duration(days: 15),
        maxNrOfCacheObjects: 100,
      ),
    );

    return RefreshIndicator(
          color: PrimaryColor,
          onRefresh: () async {
            homepageState.getHome();
          },
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CarouselSlider.builder(
                      options: CarouselOptions(

                          viewportFraction: 1,
                          height: 250,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          enableInfiniteScroll: true,
                          onPageChanged: (index, reason) {
                            _currentIndex = index;
                            homepageState.refresh();}),
                      itemCount: homepage.ads.length,
                      itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                          CarouselImageSlider(
                            homepage: homepage,
                            itemIndex: itemIndex,)),
                ),
                // CarouselImageSlider(
                //   homepage: null,
                // ),
                // Padding(
                //   padding: const EdgeInsets.all(10),
                //   child: SizedBox(
                //     height: 250,
                //     width: MediaQuery.of(context).size.width,
                //     child: CarouselSlider.builder(
                //       options: CarouselOptions(
                //         viewportFraction: 1,
                //         autoPlay: true,
                //       ),
                //       itemCount: List1.length,
                //       itemBuilder: (context, itemIndex, realIndex) {
                //         return List1widget(list1key: List1[itemIndex]);
                //       },
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Menus",
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
                    Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height*0.25,
                        width: double.infinity,
                        child: GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            childAspectRatio: (1 / 1.5),
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 0,
                          ),
                          controller: _controller,
                          scrollDirection: Axis.horizontal,
                          itemCount: homepage.packages.items.length,
                          itemBuilder: (context, index) {
                            return GridViewDetails(
                              homepage: homepage,
                              index: index,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: homepage.addons.length,
                        itemBuilder: (context, index) {
                          final model = homepage.addons[index];
                          print(homepage.addons);
                          return DestinationWithPlacesList(
                            homepage: homepage,
                            model: model,
                            index: index,
                          );
                        }),
                  ],
                ),

                // Padding(
                //   padding: const EdgeInsets.only(right: 10, left: 10),
                //   child: Text(
                //     '  Menus',
                //     style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(right: 10, left: 10),
                //   child: Text(
                //     '   Choose one of our special menus',
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(right: 10, left: 10),
                //   child: SizedBox(
                //     height: 300,
                //     width: double.infinity,
                //     child: GridView.builder(
                //       shrinkWrap: false,
                //       scrollDirection: Axis.horizontal,
                //       itemCount: List2.length,
                //       itemBuilder: (context, index) {
                //         return List2widget(
                //             list2key: List2[index],
                //             ontap: () {
                //               List2.forEach((element) {
                //                 print(element);
                //                 element.check == !element.check! ;
                //               });
                //               List2[index].check == true;
                //               print(List2.where((element) => element.check=false));
                //             });
                //       },
                //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //         crossAxisCount: 2,
                //         childAspectRatio: 3 / 4.7,
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 50,
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(right: 10, left: 10),
                //   child: Text(
                //     '  Add-ons',
                //     style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(right: 10, left: 10),
                //   child: Text(
                //     '   Extra add-ons to your special menu',
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.all(10.0),
                //   child: SizedBox(
                //     height: 150,
                //     child: ListView.builder(
                //       scrollDirection: Axis.horizontal,
                //       itemCount: List3.length,
                //       itemBuilder: (context, index) {
                //         return List3widget(list3key: List3[index]);
                //       },
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 50,
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(right: 10, left: 10),
                //   child: Text(
                //     '  Flowers',
                //     style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(right: 10, left: 10),
                //   child: Text(
                //     '   Roses are red,violets are blue',
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.all(10.0),
                //   child: SizedBox(
                //     height: 150,
                //     width: MediaQuery.of(context).size.width,
                //     child: ListView.builder(
                //       scrollDirection: Axis.horizontal,
                //       itemCount: List4.length,
                //       itemBuilder: (context, index) {
                //         return List4widget(list4key: List4[index]);
                //       },
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 130,
                // ),
              ],
            ),
          ));
        //   floatingActionButton: Padding(
        //     padding: const EdgeInsets.only(left: 8, right: 8),
        //     child: SizedBox(
        //       width: 400.0,
        //       height: 68.0,
        //       child: FloatingActionButton.extended(
        //         backgroundColor: PrimaryColor,
        //         onPressed: () {
        //           // showModalBottomSheet(
        //           //   context: context,
        //           //   isScrollControlled: true,
        //           //   backgroundColor: Colors.transparent,
        //           //   builder: (context) => Modelsheet(),
        //           // );
        //         },
        //         label: Container(
        //           width: 315,
        //           child: Row(
        //
        //               // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               children: [
        //                 Icon(Icons.calendar_month),
        //                 SizedBox(
        //                   width: 20,
        //                 ),
        //                 Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   children: [
        //                     Text(
        //                       'What s your event?',
        //                       style: TextStyle(fontSize: 11),
        //                     ),
        //                     Text(
        //                       'Date,packagess,guests...',
        //                       style: TextStyle(fontSize: 11),
        //                     )
        //                   ],
        //                 ),
        //                 Spacer(),
        //                 Container(
        //                     decoration: BoxDecoration(
        //                       borderRadius: BorderRadius.circular(200),
        //                       color: Colors.white,
        //                     ),
        //                     height: 30,
        //                     width: 30,
        //                     child: Center(
        //                         child: Icon(
        //                       Icons.keyboard_arrow_up_outlined,
        //                       color: PrimaryColor,
        //                       size: 30,
        //                     ))),
        //               ]),
        //         ),
        //       ),
        //     ),
        //   ),
        // );
  }

  @override
  Widget getAlert(BuildContext context) {
    // TODO: implement getAlert
    throw UnimplementedError();
  }
}
