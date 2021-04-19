import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gold/Constants/Constants.dart';
import 'package:gold/Constants/SizeConfig.dart';
import 'package:gold/Models/MyCredit.dart';
import 'package:http/http.dart' as http;
import 'package:gold/Constants/Globals.dart';

class MyCreditScreen extends StatefulWidget {
  var accessToken;

  MyCreditScreen({this.accessToken});

  @override
  _MyCreditScreenState createState() => _MyCreditScreenState();
}

class _MyCreditScreenState extends State<MyCreditScreen> {
  MyCredit _myCredit;

  Future<MyCredit> getTransactionDetails() async {
    final String url = "http://15.185.204.189/webapi/server.php";
    final response = await http.post(url, headers: {
      "key": "542A9M87SDKL2M728WQIMC4DSQLU9LL3"
    }, body: {
      "accessToken": widget.accessToken,
      "action": "transactions/myCredit",
      "lang": App.localStorage.getString("lang"),
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      print(responseString.toString());
      return MyCredit.fromRawJson(responseString);
    } else {
      print(response.statusCode);
    }
  }

  Future<void> fetchData() async {
    MyCredit Details = await getTransactionDetails();
    _myCredit = Details;
    return _myCredit;
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
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
            Text(
              'My Credit',
              style: CustomFonts.googleBodyFont(color: Colors.white),
            ):Text(
              'رصيدي',
              style: CustomFonts.googleBodyFont(color: Colors.white),
            ),
            centerTitle: true,
          ),
          body: FutureBuilder(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  padding: EdgeInsets.only(
                      left: SizeConfig.widthMultiplier * 2,
                      right: SizeConfig.widthMultiplier * 2),
                  itemCount: snapshot.data.data.length,
                  itemBuilder: (BuildContext context, index) {
                    return Container(
                      padding: EdgeInsets.only(
                          top: SizeConfig.heightMultiplier * 2,
                          bottom: SizeConfig.heightMultiplier * 0,
                          left: SizeConfig.widthMultiplier * 2,
                          right: SizeConfig.widthMultiplier * 2),
                      decoration: BoxDecoration(
                          color: Color(0xff3B3F52),
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
                                        'Transaction ID',
                                        style: CustomFonts.googleBodyFont(
                                            color: Colors.white,
                                            fontSize:
                                                SizeConfig.textMultiplier *
                                                    2.5),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Text(
                                        '${_myCredit.data[index].idTrans}',
                                        style: CustomFonts.googleBodyFont(
                                            color: Color(0xff00A9A5),
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
                                        'Customer ID',
                                        style: CustomFonts.googleBodyFont(
                                            color: Colors.white,
                                            fontSize:
                                                SizeConfig.textMultiplier *
                                                    2.5),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Text(
                                        '${_myCredit.data[index].idCustomer}',
                                        style: CustomFonts.googleBodyFont(
                                            color: Color(0xff00A9A5),
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
                                        'Transaction Date',
                                        style: CustomFonts.googleBodyFont(
                                            color: Colors.white,
                                            fontSize:
                                                SizeConfig.textMultiplier *
                                                    2.5),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Text(
                                        '${_myCredit.data[index].txnDate}',
                                        style: CustomFonts.googleBodyFont(
                                            color: Color(0xff00A9A5),
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
                                        'Credit',
                                        style: CustomFonts.googleBodyFont(
                                            color: Colors.white,
                                            fontSize:
                                                SizeConfig.textMultiplier *
                                                    2.5),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Text(
                                        '${_myCredit.data[index].credit}',
                                        style: CustomFonts.googleBodyFont(
                                            color: Color(0xff00A9A5),
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
                                        'Debit',
                                        style: CustomFonts.googleBodyFont(
                                            color: Colors.white,
                                            fontSize:
                                                SizeConfig.textMultiplier *
                                                    2.5),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Text(
                                        '${_myCredit.data[index].debit}',
                                        style: CustomFonts.googleBodyFont(
                                            color: Color(0xff00A9A5),
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
                                    color: Color(0xff00A9A5),
                                    borderRadius: BorderRadius.circular(12)),
                                alignment: Alignment.center,
                                child: Text(
                                  '${_myCredit.data[index].comments}',
                                  style: CustomFonts.googleBodyFont(
                                      color: Colors.white,
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
                    'No Transactions Yet',
                    style: CustomFonts.googleBodyFont(
                        color: Colors.white,
                        fontSize: SizeConfig.textMultiplier * 4),
                  ),
                );
              }
            },
          )),
    );
  }
}
