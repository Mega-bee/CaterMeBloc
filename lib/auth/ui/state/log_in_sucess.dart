import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../abstracts/states/state.dart';
import '../../../utils/Colors/colors.dart';
import '../../../utils/images/images.dart';
import '../../auth_module_route.dart';
import '../../request/log_in_request.dart';
import '../screens/log_in_list.dart';
import '../widget/custom_button.dart';

class LoginInitState extends States{
  final loginScreenState _screenState;
  String? errorMessage;


  LoginInitState(this.errorMessage,this._screenState) : super(false);

  final _formKey = GlobalKey<FormState>();
  final phone = TextEditingController();
  final password = TextEditingController();


  @override
  Widget getUI(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(


                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image(
                      image: AssetImage(ImageAsset.logo),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.4,
                    ),
                  ),
                  Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 58,
                      child:TextField(
                        decoration: InputDecoration(
                          hintText: 'Email',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(right: 16,left: 16),
                            child: Icon(Icons.email_outlined, size: 22, color: Color(0xFF9E9E9E),),
                          ),
                          hintStyle: TextStyle(color:Color(0xFF9e9e9e)),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.0)),
                            borderSide: BorderSide(color: Colors.white, width: 0.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.black12, width: 2),
                          ),
                        ),)
                  ),
                  Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 70,

                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(right: 16,left: 16),
                            child: Icon(Icons.lock_outline_rounded, size: 22, color: Colors.grey),
                          ),
                          hintStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.0)),
                            borderSide: BorderSide(color: Colors.white, width: 0.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.black12, width: 2),
                          ),
                        ),)
                  ),
                  Row(
                    children: [
                      Spacer(),
                      TextButton(
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black
                          ),
                        ),
                        onPressed: (){},
                      ),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 14, top: 40),
                      child: SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(

                            primary: PrimaryColor,
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(15.0),
                            ),
                          ),
                          onPressed: (){
                          //   Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => Homepage()),
                          // );
                            }, child: Text('Log In',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                        ),
                      )
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      child: Text('Create New Account',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                      onPressed: (){
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => SignupScreen()),
                        // );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget getAlert(BuildContext context) {
    // TODO: implement getAlert
    throw UnimplementedError();
  }
}