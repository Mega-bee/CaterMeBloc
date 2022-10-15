import 'package:cater_me_bloc/hive/hive.dart';
import 'package:cater_me_bloc/home_page/response/homepage_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../utils/Colors/colors.dart';

class counterafter extends StatefulWidget {
  int ID;
  int increment;
  int min;
  int max;
  final Function ontap;
  final Function onselect;
  final Function addtocart;
  final Function delete;
  final Function get;
  int price;

  counterafter(
      {Key? key,
      required this.increment,
      required this.max,
      required this.min,
      required this.ID,
      required this.price,
      required this.ontap,
      required this.onselect,
      required this.addtocart,
      required this.delete,
      required this.get})
      : super(key: key);

  @override
  State<counterafter> createState() => _counterafterState();
}

class _counterafterState extends State<counterafter> {
  OrderHomePage orderHomePage = OrderHomePage();
  int count = 0;
  bool isselected = false;
  bool _value=false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
// selectedCard=widget.index;

        _value = false;
        isselected = false;
        print("Hi");
        // widget.detailsProductResponse.isselected =
        // !widget.detailsProductResponse.isselected!;
        widget.ontap();
        widget.addtocart(
            // widget.detailsProductResponse.id, inc
        );
        widget.onselect();

        // Future.delayed(Duration(seconds: 3),(){
        //    selected=false;
        //    inc=1;
        //    setState(() {
        //
        //    });
        // });

        setState(() {});

        // widget.ontap();
      },

      child: isselected == false
          ? Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {
                  count = widget.min;
                  isselected = !isselected;
                  setState(() {});
                  print(isselected);
                },
                child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    height: MediaQuery.of(context).size.height * 0.04,
                    width: 30,
                    child: Center(child: Icon(Icons.add))),
              ),
            )
          : Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              height: MediaQuery.of(context).size.height * 0.04,
              width: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {
                        if (count > widget.min) {
                          print(orderHomePage.box);
                          orderHomePage.setOrder(widget.ID, count);
                          count = count - widget.increment;
                          widget.addtocart;
                          // widget.onselect();
                          // widget.detailsProductResponse.isselected =
                          // !widget.detailsProductResponse.isselected!;
                          // widget.detailsProductResponse.quantityInCart= widget.detailsProductResponse.quantityInCart!+1;
                          setState(() {
                            widget.ontap();
                          });
                          // widget.countt=count;
                          // print(widget.countt);
                          // widget.countt=widget.price*w
                          // print(widget.min);
                          // print(widget.increment);
                          // print(widget.max);
                          setState(() {});
                        } else {
                          widget.delete;
                        }

                        // if (count==1){
                        //
                        // }else
                        // count--;
                        // setState(() {
                        //
                        // });
                      },
                      icon: count == widget.min
                          ? Icon(
                              Icons.delete,
                              size: 15,
                              color: PrimaryColor,
                            )
                          : Icon(
                              FontAwesomeIcons.minus,
                              size: 15,
                              color: PrimaryColor,
                            )),
                  Text(count.toString()),
                  IconButton(
                      onPressed: () {
                        if (count < widget.max) {
                          orderHomePage.setOrder(widget.ID, count);
                          count = count + widget.increment;
                          // print(widget.min);
                          // print(widget.increment);
                          // print(widget.max);
                          setState(() {});
                        } else
                          ScaffoldMessenger(
                            child: Text("Wtf"),
                          );
                        //   count++;
                        // setState(() {
                        //
                        // });
                      },
                      icon: Icon(
                        FontAwesomeIcons.add,
                        size: 15,
                        color: PrimaryColor,
                      )),
                ],
              ),
            ),
    );
  }
}
