import 'package:calendar_strip/calendar_strip.dart' as calendarr;
import 'package:flutter/material.dart';
import 'package:gold/Constants/Constants.dart';
import 'package:gold/Constants/SizeConfig.dart';
import 'package:gold/Models/BookingCreate.dart';
import 'package:gold/Screens/AppointmentDetailsScreen.dart';
import 'package:gold/Screens/CustomDialog.dart';
import 'package:http/http.dart' as http;
import 'package:gold/Constants/Globals.dart';
import 'package:page_transition/page_transition.dart';
import 'package:gold/Constants/ConstantColors.dart';
import 'package:gold/Models/GetStylistModel.dart';

class CalendarScreen extends StatefulWidget {
  var accessToken;
  var idServices;
  var price;
  CalendarScreen({
   this.accessToken,
   this.idServices,
    this.price
});
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}
String stylistName;
String stylistId;
var _radioValue = 0;
var dateForAPI = "0";
var timeForAPI= "0";
Color checkedColor = ConstantColors.buttonColor;
var height = SizeConfig.heightMultiplier * 50;
var width = SizeConfig.widthMultiplier * 100;
class _CalendarScreenState extends State<CalendarScreen> {


  Color simpleColor = Colors.transparent;
  bool check=false;
  int selectedIndex;
  List<Color> options = [
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
  ];
  BookingCreate _bookingCreate;
  Future<BookingCreate> createBooking() async {
    final String url = "http://15.185.204.189/webapi/server.php";
    final response = await http.post(url, headers: {
      "key": "542A9M87SDKL2M728WQIMC4DSQLU9LL3"
    }, body: {
      "accessToken": widget.accessToken,
      "action": "booking/create",
      "services[0]": "${widget.idServices}",
      "date": "$dateForAPI",
      "time": "${timeForAPI.substring(0,timeForAPI.indexOf(" "))}",
      "lang": App.localStorage.getString("lang"),
      "stylist": "$stylistId"
      ,
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      // print(responseString.toString());
      return BookingCreate.fromRawJson(responseString);
    } else {
      print(response.statusCode);
    }
  }

  List<bool> _selections = List.generate(26, (_) => false);
  Color color = Colors.transparent;
  var counter = 0;
  List<bool> isSelected = [false,false,false,];
  final List<Color> colors = <Color>[Colors.transparent];

  var padding = CustomSizes.padding;
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(Duration(days: 10));
  DateTime selectedDate = DateTime.now().subtract(Duration(days: 0));
  List<DateTime> markedDates = [
    DateTime.now().subtract(Duration(days: 1)),
    DateTime.now().subtract(Duration(days: 2)),
    DateTime.now().add(Duration(days: 4))
  ];
  @override
  void initState() {
    super.initState();
  }

  onSelect(data) {
    String formattedDate=data.toString();
    dateForAPI =formattedDate.substring(0,formattedDate.indexOf(" "));
    // setState(() {
    //   dateForAPI =formattedDate.substring(0,formattedDate.indexOf(" "));
    // });
  }

  onWeekSelect(data) {
    print("Selected week starting at -> $data");
  }

  _monthNameWidget(monthName) {
    return Container(
      child: Text(
        monthName,
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: Colors.black,
          fontStyle: FontStyle.italic,
        ),
      ),
      padding: EdgeInsets.only(top: 8, bottom: 4),
    );
  }

  @override
  Widget build(BuildContext context) {
    // print(isSelected);
    // print("ID Services is      ${widget.idServices}");
    // print("Access Token      ${widget.accessToken}");
    print(timeForAPI);
    print(dateForAPI);
    // print(timeForAPI.substring(0,timeForAPI.indexOf(" ")));

    return Scaffold(
      backgroundColor: ConstantColors.mainBackground,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ConstantColors.mainBackground,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: ConstantColors.textColor,
          ),
        ),
        title: Text(
          App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
          'Book an appointment':'احجز موعدًا',
          style: CustomFonts.googleHeaderFont(
              color: ConstantColors.textColor,
            height: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                1.5:1.0
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: padding, bottom: padding),
            height: height * 0.25,
            margin:
                EdgeInsets.only(top: padding, left: padding, right: padding),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: ConstantColors.buttonColor, width: 1))),
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
                                  color: ConstantColors.buttonColor,
                                ),
                                child: Text(
                                  '1',
                                  style: CustomFonts.googleBodyFont(
                                      color: ConstantColors.textColor),
                                )),
                          ),
                          Expanded(
                              flex: 2,
                              //fit: FlexFit.loose,
                              child: Container(
                                height: height * 0.02,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        color: ConstantColors.buttonColor,
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: ConstantColors.buttonColor,
                                        ),
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
                                  color: ConstantColors.buttonColor,
                                ),
                                child: Text(
                                  '2',
                                  style: CustomFonts.googleBodyFont(
                                      color: ConstantColors.textColor),
                                )),
                          ),
                          Expanded(
                              flex: 2,
                              // fit: FlexFit.loose,
                              child: Container(
                                height: height * 0.02,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        color: ConstantColors.buttonColor,
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: ConstantColors.buttonColor,
                                            gradient: LinearGradient(
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                colors: [
                                                  ConstantColors.buttonColor,
                                                  ConstantColors.backgroundColor
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
                                  color: ConstantColors.backgroundColor,
                                ),
                                child: Text(
                                  '3',
                                  style: CustomFonts.googleBodyFont(
                                      color: ConstantColors.textColor),
                                )),
                          ),
                          Expanded(
                              flex: 2,
                              //fit: FlexFit.loose,
                              child: Container(
                                height: height * 0.02,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        color: ConstantColors.buttonColor,
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        color: ConstantColors.buttonColor,
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
                                  color: ConstantColors.buttonColor,
                                ),
                                child: Text(
                                  '4',
                                  style: CustomFonts.googleBodyFont(
                                      color: ConstantColors.textColor),
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
                            padding: EdgeInsets.only(left: padding * 0.5),
                            child: Text(
                              App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                              'Login' : 'تسجيل الدخول',
                              style: CustomFonts.googleBodyFont(
                                height: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                                  1.5:1.0,
                                  color: ConstantColors.textColor,
                                  fontSize: SizeConfig.textMultiplier * 1.65),
                            ))),
                    Expanded(
                        flex: 3,
                        child: Container(
                            alignment: Alignment.topCenter,
                            padding: EdgeInsets.only(
                                right: SizeConfig.widthMultiplier * 2),
                            child: Text(
                              App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                              'Choose Services' : 'اختر الخدمات',
                              style: CustomFonts.googleBodyFont(
                                height: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                                  1.5:1.0,
                                  color: ConstantColors.textColor,
                                  fontSize: SizeConfig.textMultiplier * 1.65),
                            ))),
                    Expanded(
                        flex: 2,
                        child: Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.only(right: padding),
                            child: Text(
                              App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                              'Pick Time': 'اختر وقت',
                              style: CustomFonts.googleBodyFont(
                                  color: ConstantColors.textColor,
                                  fontSize: SizeConfig.textMultiplier * 1.65),
                            ))),
                    Expanded(
                        child: Container(
                            alignment: Alignment.topRight,
                            padding: EdgeInsets.only(right: padding * 0),
                            child: Text(
                              App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                              'Payment' : 'دفع',
                              style: CustomFonts.googleBodyFont(
                                  color: ConstantColors.textColor,
                                  fontSize: SizeConfig.textMultiplier * 1.55),
                            ))),
                  ])),
                ),
              ],
            ),
          ),
          //////////////////////////////////////////////////////////////
          Container(
            margin: EdgeInsets.only(top: padding),
            height: height * 1,
            // color: Color(0xff3B3F52),
            //   color: Colors.white,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xff3B3F52)
                        )
                      )
                    ),
                      child: calendarr.CalendarStrip(
                        startDate: startDate,
                        endDate: endDate,
                        selectedDate: selectedDate,
                        // weekStartsOnSunday: false,
                        onDateSelected: onSelect,
                        onWeekSelected: onWeekSelect,
                        dateTileBuilder: dateTileBuilder,
                        iconColor: ConstantColors.textColor,
                        monthNameWidget: _monthNameWidget,
                       // markedDates: markedDates,
                        containerDecoration: BoxDecoration(color: Colors.white),
                        addSwipeGesture: true,
                      )),
                ),
                TimrForAppointment()
              ],
            ),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Color(0xff3B3F52), width: 1),

                )
            ),
          ),
          Container(
            height: height * 0.15,
            alignment: Alignment.center,
            child: Text(
              App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
              'Choose Stylist (Optional)' : 'اختر المصمم (اختياري)',
              style: CustomFonts.googleHeaderFont(color: ConstantColors.textColor),
            ),
          ),
          Stylists(
            accessToken: widget.accessToken,
          )
        ],
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
                      text: 'KD ${widget.price}',
                      style: CustomFonts.googleBodyFont(
                        color: ConstantColors.buttonColor,
                      ),
                      children: [
                        TextSpan(
                          text: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                          '   Total': 'مجموع   ',
                          style: CustomFonts.googleBodyFont(color: ConstantColors.textColor),
                        )
                      ]),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(padding),
                child: InkWell(
                  onTap: () async {
                    if (dateForAPI != '0' && timeForAPI != '0') {
                      final BookingCreate bookingCreate =
                      await createBooking();
                      setState(() {
                        _bookingCreate = bookingCreate;
                      });
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomDialogBox(
                              message: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                              "Booking Created Successfully" : 'تم إنشاء الحجز بنجاح',
                              icon: Icons.check,
                            );
                          });
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: AppointmentDetails(
                                date: dateForAPI,
                                time: timeForAPI,
                                price: widget.price,
                                idCart: _bookingCreate.data.idCart,
                                accessToken: widget.accessToken,
                                stylistName: stylistName,
                              )));
                    } else {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomDialogBox(
                              message: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                              'Please select date and time': 'الرجاء تحديد التاريخ والوقت',
                              icon: Icons.error_outline,
                            );
                          });
                    }
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(padding),
                        color: ConstantColors.buttonColor,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                                'Next' : 'التالي',
                                style: CustomFonts.googleBodyFont(
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                                alignment: Alignment.centerLeft,
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.black,
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
    );
  }

  dateTileBuilder(
      date, selectedDate, rowIndex, dayName, isDateMarked, isDateOutOfRange) {
    bool isSelectedDate = date.compareTo(selectedDate) == 0;
    Color fontColor =
        isDateOutOfRange ? ConstantColors.textColor : ConstantColors.textColor;
    TextStyle normalStyle =
        TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: ConstantColors.textColor);
    TextStyle selectedStyle = TextStyle(
        fontSize: 17, fontWeight: FontWeight.w800, color: Colors.white);
    TextStyle dayNameStyle = TextStyle(fontSize: 14.5, color: fontColor);
    List<Widget> _children = [
      Text(dayName, style: dayNameStyle),
      Text(date.day.toString(),
          style: !isSelectedDate ? normalStyle : selectedStyle),
    ];

    if (isDateMarked == true) {
      // _children.add(getMarkedIndicatorWidget());
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 8, left: 5, right: 5, bottom: 5),
      decoration: BoxDecoration(
        color: !isSelectedDate ? ConstantColors.buttonColor.withOpacity(0.4):  ConstantColors.buttonColor,
        borderRadius: BorderRadius.all(Radius.circular(60)),
        // shape: BoxShape.circle
      ),
      child: Column(
        children: _children,
      ),
    );
  }

  getMarkedIndicatorWidget() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        margin: EdgeInsets.only(left: 1, right: 1),
        width: 7,
        height: 7,
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Colors.transparent),
      ),
      Container(
        width: 7,
        height: 7,
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Colors.transparent),
      )
    ]);
  }


}
class TimrForAppointment extends StatefulWidget {
  @override
  _TimrForAppointmentState createState() => _TimrForAppointmentState();
}
Iterable<TimeOfDay> getTimes(TimeOfDay startTime, TimeOfDay endTime, Duration step) sync* {
  var hour = startTime.hour;
  var minute = startTime.minute;

  do {
    yield TimeOfDay(hour: hour, minute: minute);
    minute += step.inMinutes;
    while (minute >= 60) {
      minute -= 60;
      hour++;
    }
  } while (hour < endTime.hour ||
      (hour == endTime.hour && minute <= endTime.minute));
}
final startTime = TimeOfDay(hour: 9, minute: 0);
final endTime = TimeOfDay(hour: 22, minute: 0);
final step = Duration(minutes: 30);
class _TimrForAppointmentState extends State<TimrForAppointment> {
  bool check=false;
  int selectedIndex;

  @override
  Widget build(BuildContext context) {
    final times = getTimes(startTime, endTime, step)
        .map((tod) => tod.format(context))
        .toList();
    return Expanded(
      flex: 2,
      child: Padding(
        padding: EdgeInsets.only(
          left: SizeConfig.widthMultiplier * 0.5,
          right: SizeConfig.widthMultiplier * 1,
          bottom: SizeConfig.heightMultiplier * 1,
          top: SizeConfig.heightMultiplier * 0.25
        ),
        child: Container(
          child: GridView.builder(
            itemCount: times.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio:  width * 2/ height * 1.1,
                crossAxisCount: (SizeConfig.isMobilePortrait) ? 4 : 3),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap:(){
                  if(check==true){
                    print('trueeeeeeeeeeeeeeeeeeeeeeeee');
                    setState(() {
                      selectedIndex=index;
                      check=false;
                      timeForAPI = times[index];
                    });
                  }
                  else{
                    print('falseeeeeeeeeeeeeeeeeeeeeeeeeee');
                    setState(() {
                      selectedIndex=200;
                      check=true;
                    });
                  }
                },

                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                      top: SizeConfig.heightMultiplier * 0.9,
                      left: SizeConfig.widthMultiplier * 1.2
                  ),
                  decoration: BoxDecoration(
                      color: selectedIndex==index?checkedColor:Colors.transparent,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                          color: ConstantColors.buttonColor,
                          width: 1
                      )
                  ),
                  child: Text('${times[index]}',
                    style: CustomFonts.googleBodyFont(
                        color: ConstantColors.textColor
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
          ),
          // decoration: BoxDecoration(
          //   border: Border(
          //     top: BorderSide(
          //       color: Color(0xff3B3F52)
          //     )
          //   )
          // ),
        ),
      ),
    );
  }
}

class Stylists extends StatefulWidget {
  var accessToken;
  Stylists({this.accessToken});
  @override
  _StylistsState createState() => _StylistsState();
}

class _StylistsState extends State<Stylists> {
  Future<GetStylists> getStylistList() async {
    final String url = "http://15.185.204.189/webapi/server.php";
    final response = await http.post(url, headers: {
      "key": "542A9M87SDKL2M728WQIMC4DSQLU9LL3"
    }, body: {
      "accessToken": widget.accessToken,
      "action": "booking/getSylistData",
      "lang": App.localStorage.getString("lang")
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      // print(responseString.toString());
      return GetStylists.fromRawJson(responseString);
    } else {
      print(response.statusCode);
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _radioValue = null;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.symmetric(vertical: padding),
      height: height * 0.25,
      child: FutureBuilder(
          future: getStylistList(),
          builder: (BuildContext context, snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                padding: EdgeInsets.only(right: SizeConfig.widthMultiplier * 2),
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data.data.stylistData.length,
                itemBuilder: (BuildContext context, index) {
                  return InkWell(
                    onTap: (){
                      setState(() {
                        _radioValue = index;
                        stylistId=snapshot.data.data.stylistData[index].idStylist;
                      });
                      print(stylistId);
                    },
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: height * 0.13,
                        width: width * 0.40,
                        decoration: BoxDecoration(
                            color:ConstantColors.backgroundColor,
                            borderRadius: BorderRadius.circular(8.0)),
                        margin: EdgeInsets.only(left: 8.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: EdgeInsets.all(8.0 * 0.5),
                                child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage('images/face.jpg'),
                                          fit: BoxFit.cover),
                                      border:
                                      Border.all(color: Colors.white, width: 1)),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '${snapshot.data.data.stylistData[index].fullName}',
                                  style: CustomFonts.googleHeaderFont(
                                      color: ConstantColors.textColor,
                                      fontSize: SizeConfig.textMultiplier * 1.8),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Radio(
                                activeColor: ConstantColors.buttonColor,
                                value: index,
                                groupValue: _radioValue,
                                onChanged: (value) {
                                  setState(() {
                                    _radioValue = value;
                                    stylistId=snapshot.data.data.stylistData[index].idStylist;
                                    stylistName = snapshot.data.data.stylistData[index].fullName;
                                  });
                                  print(stylistId);
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else{
              return Center(child: CircularProgressIndicator());
            }
          }

      ),
    );
  }
}
