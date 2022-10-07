import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:injectable/injectable.dart';
import '../../../abstracts/states/state.dart';
import '../../../hive/hive.dart';
import '../../../utils/Colors/colors.dart';
import '../../../utils/images/images.dart';
import '../../state_manager/homepage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../widget/Google_Map/google_maps.dart';
import '../widget/order_card_widget.dart';

@injectable
class HomePage extends StatefulWidget {
  final HomePageCubit cubit;
  final AuthPrefsHelper locationHelper;

  const HomePage(this.cubit, this.locationHelper);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  void initState() {
    currentLocation;
    widget.cubit.getHomePage(this);
    controller = BottomSheet.createAnimationController(this);
    controller.duration = Duration(milliseconds: 500);
  }

  getHome() {
    widget.cubit.getHomePage(this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  String dropdownValue = 'One';
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  late AnimationController controller;

  TextEditingController textFieldController = TextEditingController();

  String currentLocation = 'Zahle';

  // final DestinationWithPlaces homepage = DestinationWithPlaces();
  // final Destinations dest = Destinations();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Image.asset('assets/images/yallaJeyeLogo.png'),
        leadingWidth: 150,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black26,
                      ),
                      height: 6,
                      width: 40,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 17.0),
                          child: Text(
                            "Where should we deliver to?",
                            style: GoogleFonts.poppins(
                              fontStyle: FontStyle.normal,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 26,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    LocationMap(),
                              ),
                            ).then((value) async {
                              print("Current Loc = ${currentLocation}");

                              value as LatLng;
                              List<Placemark> newPlace = await GeocodingPlatform
                                  .instance
                                  .placemarkFromCoordinates(
                                      value.latitude, value.longitude,
                                      localeIdentifier: "en");

                              // print(newPlace[0].locality  + newPlace[0].subLocality +newPlace[0].thoroughfare );
                              currentLocation = newPlace[0].locality!;
                              widget.locationHelper
                                  .setLocation(currentLocation);
                              // +' '+newPlace[0].thoroughfare!;
                              print("Current Loc = ${currentLocation}");
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 17.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.my_location,
                                  color: redColor,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Deliver to my current location',
                                  style: GoogleFonts.poppins(
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 17.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.add,
                                color: redColor,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          LocationMap(),
                                    ),
                                  ).then((value) async {
                                    print("Current Loc = ${currentLocation}");

                                    value as LatLng;
                                    List<Placemark> newPlace =
                                        await GeocodingPlatform.instance
                                            .placemarkFromCoordinates(
                                                value.latitude, value.longitude,
                                                localeIdentifier: "en");

                                    // print(newPlace[0].locality  + newPlace[0].subLocality +newPlace[0].thoroughfare );
                                    currentLocation = newPlace[0].locality!;
                                    // +' '+newPlace[0].thoroughfare!;
                                    print("Current Loc = ${currentLocation}");
                                  });
                                },
                                child: Text(
                                  'Deliver somewhere else...',
                                  style: GoogleFonts.poppins(
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.26,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.only(
                              left: 120, right: 120, top: 16, bottom: 16),
                          backgroundColor: redColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13),
                          )),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          AddressRoutes.Createaddress,
                        );
                      },
                      child: Text(
                        "Add new address",
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ],
                );
              },
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Deliver to',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '${widget.locationHelper.getLocation()}',
                          style: GoogleFonts.poppins(
                            fontStyle: FontStyle.normal,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: redColor,
                          ),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: redColor,
                      size: 15,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Icon(
              CupertinoIcons.search,
              color: Colors.black,
              size: 35,
            ),
          )
        ],
      ),
      body: BlocBuilder<HomePageCubit, States>(
        bloc: widget.cubit,
        builder: (context, state) {
          return state.getUI(context);
        },
      ),
    );
  }
}
