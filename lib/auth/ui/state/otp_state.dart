import 'dart:async';
import 'package:cater_me_bloc/utils/Colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../abstracts/states/state.dart';
import '../../request/confirm_phone_number_request.dart';
import '../../request/generate_otp_request.dart';
import '../screens/otp_screen.dart';
import '../widget/custom_button.dart';



class OtpInitState extends States{
  final String? phone;
  final PinCodeVerificationScreenState screenState;
  String? errorMessage;
  OtpInitState({this.phone,required this.screenState,this.errorMessage,}) : super(false);
  TextEditingController otptext = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;


  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();
  // snackBar(String? message) {
  //   return ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(message!),
  //       duration: const Duration(seconds: 2),
  //     ),
  //   );
  // }

  @override
  Widget getUI(BuildContext context){
    return  SingleChildScrollView(
        child: GestureDetector(
          onTap: () {},
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              children: <Widget>[
                // SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                // SizedBox(
                //   height: MediaQuery.of(context).size.height / 5,
                //   child: ClipRRect(
                //     borderRadius: BorderRadius.circular(30),
                //     child: Image.asset('assets/images/hooka_logo.png',
                //         fit: BoxFit.cover),
                //   ),
                // ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Phone Number Verification',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
                  child:
                  RichText(
                    text: TextSpan(
                        text: "Enter the code sent to ",
                        children: [
                          TextSpan(
                              text: "${phone}",
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                        ],
                        style:
                        const TextStyle(color: Colors.black54, fontSize: 15)),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Form(
                  key: formKey,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 18.0, horizontal: 50),
                      child: PinCodeTextField(
                        appContext: context,
                        pastedTextStyle: TextStyle(
                          color: PrimaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                        length: 4,
                        obscureText: true,
                        obscuringCharacter: '*',
                        // obscuringWidget:
                        // Image.asset("assets/images/shisha.png", width: 20),

                        blinkWhenObscuring: true,
                        animationType: AnimationType.fade,
                        validator: (v) {
                          if (v!.length < 3) {
                            return "I'm from validator";
                          } else {
                            return null;
                          }
                        },
                        pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: 40,
                            fieldWidth: 60,
                            activeFillColor: Colors.white,
                            activeColor: Colors.black,
                            selectedColor: Colors.black,
                            selectedFillColor: Colors.white,
                            inactiveColor: PrimaryColor,
                            disabledColor: Colors.black,
                            inactiveFillColor: Colors.black),
                        cursorColor: PrimaryColor,
                        animationDuration: const Duration(milliseconds: 300),
                        enableActiveFill: true,
                        errorAnimationController: errorController,
                        controller: otptext,
                        keyboardType: TextInputType.number,
                        boxShadows: const [
                          BoxShadow(
                            offset: Offset(0, 1),
                            color: Colors.black12,
                            blurRadius: 10,
                          )
                        ],
                        onCompleted: (v) {
                          debugPrint("Completed");
                        },
                        // onTap: () {
                        //   print("Pressed");
                        // },
                        onChanged: (value) {
                          debugPrint(value);
                          // setState(() {
                          //   currentText = value;
                          // });
                        },
                        beforeTextPaste: (text) {
                          debugPrint("Allowing to paste $text");
                          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                          //but you can show anything you want here, like your pop up saying wrong paste format or etc
                          return true;
                        },
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    hasError ? "*Please fill up all the cells properly" : "",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Didn't receive the code? ",
                      style: TextStyle(color: Colors.black54, fontSize: 15),
                    ),
                    Container(
                        child: TextButton(
                          onPressed: () => {
                            screenState.ResendOtp(GenOtpRequest(phone: phone))
                          },
                          child: Text(
                            "RESEND",
                            style: TextStyle(
                                color: PrimaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        )),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomButton(
                    buttonTab: () {
                      formKey.currentState!.validate();
                      screenState.ConfirmPhoneRequest(ConfPhoneNumbRequest(
                        phoneNumber:phone,
                        otp:otptext.text,
                      ));
                    },
                    loading: screenState.loadingSnapshot.connectionState ==
                        ConnectionState.waiting,
                    text: 'VERIFY',
                    bgColor: PrimaryColor,
                    textColor: Colors.black,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                        child: TextButton(
                          child: const Text("Clear"),
                          onPressed: () {
                            otptext.clear();
                          },
                        )),
                    // Flexible(
                    //     child: TextButton(
                    //   child: const Text("Set Text"),
                    //   onPressed: () {
                    //     setState(() {
                    //       textEditingController.text = "1234";
                    //     });
                    //   },
                    // )),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                )
              ],
            ),
          ),
        ));
  }

  @override
  Widget getAlert(BuildContext context) {
    // TODO: implement getAlert
    throw UnimplementedError();
  }

}