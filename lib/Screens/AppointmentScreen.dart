import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gold/Constants/Constants.dart';
import 'package:gold/Constants/SizeConfig.dart';
import 'package:gold/Models/GetServiceList.dart';
import 'package:gold/Screens/CustomDialog.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;
import 'CalendarScreen.dart';
import 'package:gold/Constants/Globals.dart';

class AppointmentScreen extends StatefulWidget {
  var accessToken;

  AppointmentScreen({this.accessToken});

  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  var idServices = "0";
  var height = SizeConfig.imageSizeMultiplier * 100;
  var width = SizeConfig.imageSizeMultiplier * 200;
  var padding = CustomSizes.padding;
  List<String> totalPrice = ["0"];
  double grandtotal = 0.0;
  List<bool> checkedIndex = List<bool>();
  GetServiceList _getServiceList;
  Future<GetServiceList> getList() async {
    final String url = "http://15.185.204.189/webapi/server.php";
    final response = await http.post(url, headers: {
      "key": "542A9M87SDKL2M728WQIMC4DSQLU9LL3"
    }, body: {
      "accessToken": widget.accessToken,
      "action": "services/getServicesList",
      "lang": App.localStorage.getString("lang"),
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
     // print(responseString.toString());
      return getServiceListFromJson(responseString);
    } else {
      print(response.statusCode);
    }
  }
  Future<void>fetchData() async{
    checkedIndex.clear();
    GetServiceList getServiceList = await getList();
    _getServiceList = getServiceList;
    for(int i=0;i<_getServiceList.data.length;i++){
      checkedIndex.add(false);
    }

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkedIndex.clear();
    fetchData();

    // checkedIndex = List<bool>.filled(_getServiceList.data.length, false);
  }

  @override
  Widget build(BuildContext context) {
    print('At appointment screen **************** ${widget.accessToken}');
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
              color: Color(0xffddc654),
              // color: Colors.red,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20))),
          child: Column(
            children: [
              Flexible(
                flex: 3,
                fit: FlexFit.loose,
                child: Container(
                  margin: EdgeInsets.only(
                      //top: padding * 4
                      ),
                  height: SizeConfig.heightMultiplier * 26,
                  width: width,
                  decoration: BoxDecoration(
                      color: Color(0xffD4AF37),
                      // color: Colors.red,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(padding * 3),
                          topRight: Radius.circular(padding * 3))),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        fit: FlexFit.loose,
                        child: Container(
                          height: height * 0.10,
                          margin: EdgeInsets.only(
                              top: padding * 2, left: padding, right: padding),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Icon(
                                      Icons.clear,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 8,
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Book an appointment',
                                    style: CustomFonts.googleBodyFont(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.loose,
                        child: Container(
                          padding:
                              EdgeInsets.only(top: padding, bottom: padding),
                          height: height * 0.25,
                          margin: EdgeInsets.only(
                              top: padding, left: padding, right: padding),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.black, width: 2))),
                          child: Column(
                            children: [
                              Expanded(
                                  flex: 3,
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.black),
                                              child: Text(
                                                '1',
                                                style:
                                                    CustomFonts.googleBodyFont(
                                                        color: Colors.grey,
                                                        fontSize: SizeConfig
                                                                .textMultiplier *
                                                            2),
                                              )),
                                        ),
                                        Flexible(
                                            flex: 2,
                                            fit: FlexFit.loose,
                                            child: Container(
                                              height: height * 0.02,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          color: Colors.black,
                                                          gradient: LinearGradient(
                                                              begin: Alignment
                                                                  .centerLeft,
                                                              end: Alignment
                                                                  .centerRight,
                                                              colors: [
                                                                // Color(0xffffffff),
                                                                Color(
                                                                    0xff1D747B),
                                                                Color(
                                                                    0xff3ABCB8),
                                                              ])),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )),
                                        Expanded(
                                          child: Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color(0xff3ABCB8)),
                                              child: Text(
                                                '2',
                                                style:
                                                    CustomFonts.googleBodyFont(
                                                        color: Colors.white),
                                              )),
                                        ),
                                        Flexible(
                                            flex: 2,
                                            fit: FlexFit.loose,
                                            child: Container(
                                              height: height * 0.02,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      color: Colors.black,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )),
                                        Expanded(
                                          child: Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.black),
                                              child: Text(
                                                '3',
                                                style:
                                                    CustomFonts.googleBodyFont(
                                                        color: Colors.grey),
                                              )),
                                        ),
                                        Flexible(
                                            flex: 2,
                                            fit: FlexFit.loose,
                                            child: Container(
                                              height: height * 0.02,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      color: Colors.black,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )),
                                        Expanded(
                                          child: Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.black),
                                              child: Text(
                                                '4',
                                                style:
                                                    CustomFonts.googleBodyFont(
                                                        color: Colors.grey),
                                              )),
                                        ),
                                      ],
                                    ),
                                  )),
                              Expanded(
                                flex: 4,
                                child: Container(
                                    child: Row(children: [
                                  Expanded(
                                      child: Container(
                                          alignment: Alignment.topLeft,
                                          padding: EdgeInsets.only(
                                              left: padding * 0.5),
                                          child: Text(
                                            'Login',
                                            style: CustomFonts.googleBodyFont(
                                                color: Colors.grey,
                                                fontSize:
                                                    SizeConfig.textMultiplier *
                                                        1.8),
                                          ))),
                                  Expanded(
                                      flex: 3,
                                      child: Container(
                                          alignment: Alignment.topCenter,
                                          padding: EdgeInsets.only(
                                              right:
                                                  SizeConfig.widthMultiplier *
                                                      2),
                                          child: Text(
                                            'Choose Services',
                                            style: CustomFonts.googleBodyFont(
                                                color: Colors.white,
                                                fontSize:
                                                    SizeConfig.textMultiplier *
                                                        1.8),
                                          ))),
                                  Expanded(
                                      flex: 2,
                                      child: Container(
                                          alignment: Alignment.topLeft,
                                          padding:
                                              EdgeInsets.only(right: padding),
                                          child: Text(
                                            'Pick Time',
                                            style: CustomFonts.googleBodyFont(
                                                color: Colors.grey,
                                                fontSize:
                                                    SizeConfig.textMultiplier *
                                                        1.8),
                                          ))),
                                  Expanded(
                                      child: Container(
                                          alignment: Alignment.topRight,
                                          padding: EdgeInsets.only(
                                              right: padding * 0),
                                          child: Text(
                                            'Payment',
                                            style: CustomFonts.googleBodyFont(
                                                color: Colors.grey,
                                                fontSize:
                                                    SizeConfig.textMultiplier *
                                                        1.8),
                                          ))),
                                ])),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 6,
                fit: FlexFit.loose,
                child: Container(
                  height: SizeConfig.heightMultiplier * 85,
                  child: FutureBuilder(
                    future: getList(),
                    builder: (BuildContext context,
                        AsyncSnapshot<GetServiceList> snapshot) {
                      if (snapshot.hasData) {
                        // for(int i=0;i<snapshot.data.data.length;i++){
                        //   checkedIndex.add(false);
                        // }
                        for (int i=0;i<snapshot.data.data.length;i++) {
                          checkedIndex.add(false);
                        }
                        return ListView.builder(
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.widthMultiplier * 1.5),
                          shrinkWrap: true,
                          itemCount: snapshot.data.data.length,
                          itemBuilder: (BuildContext context, index) {
                             // checkedIndex.add(false);
                            return Container(
                              margin: EdgeInsets.only(bottom: padding),
                              height: height * 0.30,
                              // width: width * 0.25,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(padding),
                                  color: Colors.black),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Expanded(
                                              flex: 80,
                                              child: Container(
                                                padding:
                                                    EdgeInsets.all(padding),
                                                child: Row(children: [
                                                  Expanded(
                                                    child: Container(
                                                        height: height * 0.08,
                                                        margin: EdgeInsets.only(
                                                            top: padding * 0.3,
                                                            bottom:
                                                                padding * 0.3,
                                                            left: padding * 0.3,
                                                            right:
                                                                padding * 0.3),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      padding *
                                                                          0.5),
                                                          border: Border.all(
                                                            // color: Colors.grey,
                                                            width: 1,
                                                          ),
                                                        ),
                                                        child: Theme(
                                                          data: ThemeData(
                                                              unselectedWidgetColor:
                                                                  Colors.grey),
                                                          child: Checkbox(
                                                            value: checkedIndex[index],
                                                            checkColor:
                                                                Colors.white,
                                                            activeColor: Color(
                                                                0xff00A9A5),
                                                            focusColor:
                                                                Colors.grey,
                                                            hoverColor:
                                                                Colors.white,
                                                            onChanged:
                                                                (bool val) {
                                                              setState(() {
                                                                checkedIndex[index] = val;
                                                                idServices = snapshot.data.data[index].idServices;
                                                              });
                                                              if(checkedIndex[index]== true){
                                                                print('im here');
                                                                totalPrice.add(snapshot.data.data[index].charges);
                                                                grandtotal = grandtotal + int.parse(snapshot.data.data[index].charges).toDouble();

                                                              }else{
                                                                totalPrice[index]="0.0";
                                                                grandtotal =grandtotal - int.parse(snapshot.data.data[index].charges).toDouble();
                                                              }
                                                            },
                                                          ),
                                                        )),
                                                  ),
                                                  Expanded(
                                                    flex: 5,
                                                    child: Container(
                                                      padding: EdgeInsets.only(
                                                          left: padding),
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        "${snapshot.data.data[index].title}",
                                                        style: CustomFonts
                                                            .googleBodyFont(
                                                                color: Colors
                                                                    .white),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 3,
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        '${snapshot.data.data[index].timeConsuming} Minutes',
                                                        style: CustomFonts
                                                            .googleBodyFont(
                                                                color:
                                                                    Colors.grey,
                                                                fontSize: SizeConfig
                                                                        .textMultiplier *
                                                                    1.8),
                                                        overflow: TextOverflow.ellipsis,
                                                        maxLines: 1,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Container(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Text(
                                                        '\$ ${snapshot.data.data[index].charges}',
                                                        style: CustomFonts
                                                            .googleBodyFont(
                                                          color:
                                                              Color(0xff00A9A5),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ]),
                                              )),
                                          Expanded(
                                              child: Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: padding * 6),
                                            color: Colors.white,
                                          )),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                        alignment: Alignment.topLeft,
                                        margin: EdgeInsets.only(
                                            top: padding,
                                            left: padding * 6,
                                            right: padding * 6),
                                        child: Text(
                                          '${snapshot.data.data[index].fullDescription}',
                                          style: CustomFonts.googleBodyFont(
                                            color:
                                                Colors.white.withOpacity(0.6),
                                            fontWeight: FontWeight.w300,
                                            fontSize: 16,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        )),
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: height * 0.18,
          width: width,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                        text: '\$${grandtotal}',
                        style: CustomFonts.googleBodyFont(
                          color: Color(0xff00A9A5),
                        ),
                        children: [
                          TextSpan(
                            text: '   Total',
                            style:
                                CustomFonts.googleBodyFont(color: Colors.grey),
                          )
                        ]),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(padding),
                  child: InkWell(
                    onTap: () {
                   if(grandtotal>0){
                     Navigator.push(
                         context,
                         PageTransition(
                             type: PageTransitionType.rightToLeft,
                             child: CalendarScreen(
                                 accessToken: widget.accessToken,
                                 idServices: idServices,
                                 price : grandtotal
                             )));
                   }else{
                     showDialog(
                         context: context,
                         builder: (BuildContext context) {
                           return CustomDialogBox(
                             message: "Please Select atleast one Service",
                             icon: Icons.error_outline,
                           );
                         });
                   }
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(padding),
                          color: Color(0xff00A9A5),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  'Next',
                                  style: CustomFonts.googleBodyFont(
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  )),
                            ),
                          ],
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
