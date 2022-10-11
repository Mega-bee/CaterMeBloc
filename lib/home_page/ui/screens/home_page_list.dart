import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
@injectable
class HomePage extends StatefulWidget {
  final HomePageCubit cubit;
  // final AuthPrefsHelper locationHelper;

  const HomePage(this.cubit);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  void initState() {
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
        elevation: 0,
        backgroundColor:
        // ThemeHelper().getisDark() ? Colors.black :
        Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: IconButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => Settings()),
                // );
              },
              icon: ImageIcon(
                AssetImage(ImageAsset.user.toString()),
                color:
                // ThemeHelper().getisDark() ? Colors.white :
                Colors.black,
              )),
        ),
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Image.asset(
            ImageAsset.logo2,
            fit: BoxFit.contain,
            height: 65,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () => null,
              icon: ImageIcon(
                AssetImage(ImageAsset.search.toString()),
                color:
                // ThemeHelper().getisDark() ? Colors.white :
                Colors.black,
              ))
        ],
      ),
      body: BlocBuilder<HomePageCubit, States>(
        bloc: widget.cubit,
        builder: (context, state) {
          print(state);
          return state.getUI(context);
        },
      ),
    );
  }
}
