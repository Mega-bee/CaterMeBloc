import 'package:caterme_v2/Addresses/Models/addresses_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../AlertMessage/ui/screen/alert_message_card.dart';
import '../../../AlertMessage/ui/widget/alert_message_adresses.dart';
import '../../../Occasions/UI/Widget/calendar.dart';
import '../../../utils/style/colors.dart';
import '../../model/sheetaddonslist.dart';
import '../widget/sheetaddons.dart';

class Modelsheet extends StatefulWidget {
  const Modelsheet({Key? key}) : super(key: key);

  @override
  State<Modelsheet> createState() => _ModelsheetState();
}

class _ModelsheetState extends State<Modelsheet> {
  TimeOfDay _time = TimeOfDay(hour: 7, minute: 15);

  void _selectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
    }
  }

  late int n = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height * 0.95,
      decoration: new BoxDecoration(
        color: BackgroundColor,
        borderRadius: new BorderRadius.only(
          topLeft: const Radius.circular(30.0),
          topRight: const Radius.circular(30.0),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: SizedBox(
                width: 400.0,
                height: 68.0,
                child: FloatingActionButton.extended(
                  backgroundColor: PrimaryColor,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  label: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.calendar_month),
                        SizedBox(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.03,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'What s your event?',
                              style: TextStyle(fontSize: 11),
                            ),
                            Text(
                              'Date,Places,guests...',
                              style: TextStyle(fontSize: 11),
                            )
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.3,
                        ),
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200),
                              color: Colors.white,
                            ),
                            height: 35,
                            width: 35,
                            child: Center(
                                child: Icon(
                                  FontAwesomeIcons.close,
                                  color: PrimaryColor,
                                ))),
                      ]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(7, 20, 7, 20),
              child: Column(
                children: [
                  Container(
                    height: 40,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.85,
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)),
                          hintText: 'Title of occasion.',
                          hintStyle: TextStyle(fontSize: 14)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      width: double.infinity,
                      height: 500,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 35,
                            ),
                            Container(
                                width: double.infinity,
                                height:
                                MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.4,
                                child: DemoApp()),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text(
                                  '   Number of guests',
                                  style: TextStyle(fontWeight: FontWeight.w400),
                                ),
                                Spacer(),
                                IconButton(
                                    onPressed: () {
                                      n--;
                                      setState(() {});
                                    },
                                    icon: Icon(
                                      Icons.arrow_back_ios_new_sharp,
                                      color: PrimaryColor,
                                    )),
                                Text('  ' + n.toString() + '  '),
                                IconButton(
                                    onPressed: () {
                                      n++;
                                      setState(() {});
                                    },
                                    icon: Icon(
                                      Icons.arrow_forward_ios_sharp,
                                      color: PrimaryColor,
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  '   Time of the event',
                                  style: TextStyle(fontWeight: FontWeight.w400),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      0, 0, 12, 0),
                                  child: Container(
                                    width: 90,
                                    height: 40,
                                    margin: const EdgeInsets.all(2.0),
                                    padding: const EdgeInsets.all(3.0),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey)),
                                    child: TextButton(
                                      child: _time == null
                                          ? Text(
                                        'Choose time',
                                        style: TextStyle(
                                            color: PrimaryColor,
                                            fontSize: 12),
                                      )
                                          : Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('${_time.format(context)}',
                                              style: TextStyle(
                                                  color: PrimaryColor,
                                                  fontSize: 12)),
                                          Icon(
                                            Icons.arrow_drop_down,
                                            size: 15,
                                            color: PrimaryColor,
                                          )
                                        ],
                                      ),
                                      onPressed: () {
                                        _selectTime();
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    width: double.infinity,
                    height: 180,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Delivering to',
                                style: TextStyle(
                                    fontWeight: FontWeight.w800, fontSize: 15),
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext ctx) {
                                        return CustomDeleteDialog(
                                          // title: 'Confirm',
                                          // content:
                                          // 'Would you like to add this watch to your collection ?',
                                          // yesBtn: () {
                                          //   // Navigator.pop(context);
                                          //   // showModalBottomSheet(context: context, builder: (context)=>BottomSheett());
                                          //   // print("hi");
                                          //   // setState(() {
                                          //   //   favoriteList.add(AuctionsList[widget.index]);
                                          //   //   fav = Colors.red;
                                          //   //   Mycollection=true;
                                          //   // });
                                          // },
                                          // noBtn: () {
                                          //   Navigator.pop(context);
                                          // },
                                        );
                                      });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(color: PrimaryColor)),
                                  width: 70,
                                  height: 20,
                                  child: Center(
                                    child: Text(
                                      'Select',
                                      style: TextStyle(
                                          color: PrimaryColor, fontSize: 11),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          address.isEmpty?
                          Column(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              Text('Select address'),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Pick a saved delivery adress or create a new',
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'one to place your order',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ):ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return AlertMessageAdresses(address: address[index],);
                            },
                            itemCount: address.length,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    width: double.infinity,
                    height: 330,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12.0, 0.0, 0.0, 0.0),
                      child: SizedBox(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: Lists.length,
                          itemBuilder: (context, index) {
                            return Listswidget(listskey: Lists[index]);
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    height: 150,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Tax',
                                style: TextStyle(),
                              ),
                              Spacer(),
                              Text('SAR number')
                            ],
                          ),
                          Divider(
                            thickness: 2,
                          ),
                          Row(
                            children: [
                              Text('Dabernni price'),
                              Spacer(),
                              Text('SAR number')
                            ],
                          ),
                          Divider(
                            thickness: 2,
                          ),
                          Row(
                            children: [
                              Text('Total'),
                              Spacer(),
                              Text('SAR number')
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  FloatingActionButton.extended(
                    backgroundColor: PrimaryColor,
                    onPressed: null,
                    label: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: 300,
                      height: 50,
                      child: Center(
                          child: Text(
                            'Checkout',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
