import 'package:calendar_strip/calendar_strip.dart';
import 'package:flutter/material.dart';
import 'package:gold/Constants/Constants.dart';
import 'package:gold/Constants/SizeConfig.dart';
import 'package:gold/Models/BookingCreate.dart';
import 'package:gold/Screens/CustomDialog.dart';
import 'package:http/http.dart' as http;
import 'package:gold/Constants/Globals.dart';

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
var dateForAPI = "0";
var timeForAPI= "0";
Color checkedColor = Color(0xff00A9A5);
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
  DateTime startDate = DateTime.now().subtract(Duration(days: 2));
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
          color: Colors.white,
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
    // print(timeForAPI);
    print(dateForAPI);
    // print(timeForAPI.substring(0,timeForAPI.indexOf(" ")));



    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Center(
          child: Text(
            'Book an appointment',
            style: CustomFonts.googleHeaderFont(color: Colors.white),
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
                    bottom: BorderSide(color: Color(0xff3B3F52), width: 1))),
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
                                  color: Color(0xff3B3F52),
                                ),
                                child: Text(
                                  '1',
                                  style: CustomFonts.googleBodyFont(
                                      color: Colors.grey),
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
                                        color: Color(0xff3B3F52),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xff3B3F52),
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
                                  color: Color(0xff3B3F52),
                                ),
                                child: Text(
                                  '2',
                                  style: CustomFonts.googleBodyFont(
                                      color: Colors.grey),
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
                                        color: Color(0xff3B3F52),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            gradient: LinearGradient(
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                colors: [
                                                  Color(0xff1D747B),
                                                  Color(0xff3ABCB8)
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
                                  color: Color(0xff00A9A5),
                                ),
                                child: Text(
                                  '3',
                                  style: CustomFonts.googleBodyFont(
                                      color: Colors.white),
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
                                        color: Color(0xff3B3F52),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        color: Color(0xff3B3F52),
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
                                  color: Color(0xff3B3F52),
                                ),
                                child: Text(
                                  '4',
                                  style: CustomFonts.googleBodyFont(
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
                            padding: EdgeInsets.only(left: padding * 0.5),
                            child: Text(
                              'Login',
                              style: CustomFonts.googleBodyFont(
                                  color: Colors.grey,
                                  fontSize: SizeConfig.textMultiplier * 1.65),
                            ))),
                    Expanded(
                        flex: 3,
                        child: Container(
                            alignment: Alignment.topCenter,
                            padding: EdgeInsets.only(
                                right: SizeConfig.widthMultiplier * 2),
                            child: Text(
                              'Choose Services',
                              style: CustomFonts.googleBodyFont(
                                  color: Colors.grey,
                                  fontSize: SizeConfig.textMultiplier * 1.65),
                            ))),
                    Expanded(
                        flex: 2,
                        child: Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.only(right: padding),
                            child: Text(
                              'Pick Time',
                              style: CustomFonts.googleBodyFont(
                                  color: Colors.white,
                                  fontSize: SizeConfig.textMultiplier * 1.65),
                            ))),
                    Expanded(
                        child: Container(
                            alignment: Alignment.topRight,
                            padding: EdgeInsets.only(right: padding * 0),
                            child: Text(
                              'Payment',
                              style: CustomFonts.googleBodyFont(
                                  color: Colors.grey,
                                  fontSize: SizeConfig.textMultiplier * 1.8),
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
                    child:  Container(
                        child: CalendarStrip(
                          startDate: startDate,
                          endDate: endDate,
                          selectedDate: selectedDate,
                          onDateSelected: onSelect,
                          onWeekSelected: onWeekSelect,
                          dateTileBuilder: dateTileBuilder,
                          iconColor: Colors.white,
                          monthNameWidget: _monthNameWidget,
                          markedDates: markedDates,
                          containerDecoration: BoxDecoration(color: Colors.black12),
                          addSwipeGesture: true,
                        )),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Color(0xff3B3F52), width: 1))),
                  ),
                ),
                TimrForAppointment()
              ],
            ),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Color(0xff3B3F52), width: 1))),
          ),
          Container(
            height: height * 0.15,
            alignment: Alignment.center,
            child: Text(
              'Choose Stylist (Optional)',
              style: CustomFonts.googleHeaderFont(color: Colors.white),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: padding),
            height: height * 0.25,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (BuildContext context, index) {
                return Container(
                  height: height * 0.18,
                  width: width * 0.40,
                  decoration: BoxDecoration(
                      color: Color(0xffddc654),
                      borderRadius: BorderRadius.circular(padding)),
                  margin: EdgeInsets.only(left: padding),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.all(padding * 0.5),
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
                          alignment: Alignment.center,
                          child: Text(
                            'Christia Frank',
                            style: CustomFonts.googleHeaderFont(
                                color: Colors.white,
                                fontSize: SizeConfig.textMultiplier * 1.8),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
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
                      text: '\$ ${widget.price}',
                      style: CustomFonts.googleBodyFont(
                        color: Color(0xff00A9A5),
                      ),
                      children: [
                        TextSpan(
                          text: '   Total',
                          style: CustomFonts.googleBodyFont(color: Colors.grey),
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
                    final BookingCreate bookingCreate =
                        await createBooking();
                    setState(() {
                      _bookingCreate = bookingCreate;
                    });
                    if (_bookingCreate.status == 1) {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomDialogBox(
                              message: "Booking Created Successfully",
                              icon: Icons.check,
                            );
                          });
                      // Navigator.push(
                      //     context,
                      //     PageTransition(
                      //         type: PageTransitionType.rightToLeft,
                      //         child: AppointmentDetails()));
                    } else {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomDialogBox(
                              message: _bookingCreate.message,
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
    );
  }

  dateTileBuilder(
      date, selectedDate, rowIndex, dayName, isDateMarked, isDateOutOfRange) {
    bool isSelectedDate = date.compareTo(selectedDate) == 0;
    Color fontColor =
        isDateOutOfRange ? Colors.white.withOpacity(0.3) : Colors.white;
    TextStyle normalStyle =
        TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: fontColor);
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
        color: !isSelectedDate ? Color(0xff3B3F52) :  Color(0xff3ABCB8),
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
                        color: Colors.grey,
                        width: 1
                    )
                ),
                child: Text('${times[index]}',
                  style: CustomFonts.googleBodyFont(
                      color: Colors.white
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

