import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gold/Constants/Constants.dart';
import 'package:gold/Constants/SizeConfig.dart';
import 'package:gold/Models/BookingHistory.dart';
import 'package:http/http.dart' as http;
import 'package:gold/Constants/Globals.dart';
import 'package:gold/Constants/ConstantColors.dart';

class BookingHistoryScreen extends StatefulWidget {
  var accessToken;
  BookingHistoryScreen({this.accessToken});

  @override
  _BookingHistoryScreenState createState() => _BookingHistoryScreenState();
}

class _BookingHistoryScreenState extends State<BookingHistoryScreen> {
  BookingHistory _bookingHistory;

  Future<BookingHistory> getBookingDetails() async {
    final String url = "http://15.185.204.189/webapi/server.php";
    final response = await http.post(url, headers: {
      "key": "542A9M87SDKL2M728WQIMC4DSQLU9LL3"
    }, body: {
      "accessToken": widget.accessToken,
      "action": "booking/getCustomerBookingHistory",
      "lang": App.localStorage.getString("lang"),
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      print(responseString.toString());
      return BookingHistory.fromRawJson(responseString);
    } else {
      print(response.statusCode);
    }
  }

  Future<void> fetchData() async {
    BookingHistory Details = await getBookingDetails();
    _bookingHistory = Details;
    return _bookingHistory;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
          backgroundColor: ConstantColors.mainBackground,
          appBar: AppBar(
            leading: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: ConstantColors.buttonColor,
              ),
            ),
            backgroundColor: ConstantColors.mainBackground,
            title: Text(
              App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
              'Booking History': 'سجل الحجز',
              style: CustomFonts.googleBodyFont(color: ConstantColors.textColor),
            ),
            centerTitle: true,
          ),
          body: FutureBuilder(
            future: fetchData(),
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  padding: EdgeInsets.only(
                      left: SizeConfig.widthMultiplier * 2,
                      right: SizeConfig.widthMultiplier * 2),
                  itemCount: snapshot.data.data.bookings.length,
                  itemBuilder: (BuildContext context, index) {
                    return Container(
                      padding: EdgeInsets.only(
                          top: SizeConfig.heightMultiplier * 2,
                          bottom: SizeConfig.heightMultiplier ,
                          left: SizeConfig.widthMultiplier * 2,
                          right: SizeConfig.widthMultiplier * 2),
                      decoration: BoxDecoration(
                          color: ConstantColors.buttonColor,
                          borderRadius: BorderRadius.circular(12)),
                      margin:
                      EdgeInsets.only(top: SizeConfig.heightMultiplier * 2),
                      height: SizeConfig.heightMultiplier * 35,
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: Text(
                                        App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                                        'ID Bookings' : 'حجوزات الهوية',
                                        style: CustomFonts.googleBodyFont(
                                            color: ConstantColors.textColor,
                                            fontSize:
                                            SizeConfig.textMultiplier *
                                                2.5),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Text(
                                        '${snapshot.data.data.bookings[index].idBookings} ',
                                        style: CustomFonts.googleBodyFont(
                                            color: ConstantColors.textColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize:
                                            SizeConfig.textMultiplier *
                                                2.5),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: Text(
                                        App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                                        'Booking Date': 'تاريخ الحجز',
                                        style: CustomFonts.googleBodyFont(
                                            color: ConstantColors.textColor,
                                            fontSize:
                                            SizeConfig.textMultiplier *
                                                2.5),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Text(
                                         "${_bookingHistory.data.bookings[index].bookingDate} ",
                                        style: CustomFonts.googleBodyFont(
                                            color: ConstantColors.textColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize:
                                            SizeConfig.textMultiplier *
                                                2.5),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: Text(
                                        App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                                        'Booking Time': 'وقت الحجز',
                                        style: CustomFonts.googleBodyFont(
                                            color: ConstantColors.textColor,
                                            fontSize:
                                            SizeConfig.textMultiplier *
                                                2.5),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Text(
                                        '${_bookingHistory.data.bookings[index].bookingTime} ',
                                        style: CustomFonts.googleBodyFont(
                                            color: ConstantColors.textColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize:
                                            SizeConfig.textMultiplier *
                                                2.5),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                    color: ConstantColors.backgroundColor,
                                    borderRadius: BorderRadius.circular(12)),
                                alignment: Alignment.center,
                                child: Text(
                                  '${_bookingHistory.data.bookings[index].services[0].fullDescription} ',
                                  style: CustomFonts.googleBodyFont(
                                      color: ConstantColors.textColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                      SizeConfig.textMultiplier * 2.5),
                                )),
                          ),
                        ],
                      ),
                    );
                  },
                );
              } else {
                return Center(
                  child: Text(
                    App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                    'No Haircuts Yet': 'لا تسريحات الشعر بعد',
                    style: CustomFonts.googleBodyFont(
                      height: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                        1.5:1.0,
                        color: ConstantColors.textColor,
                        fontSize: SizeConfig.textMultiplier * 4),
                  ),
                );
              }
            },
          )),
    );
  }
}
