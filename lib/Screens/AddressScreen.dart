import 'package:flutter/material.dart';
import 'package:gold/Constants/Constants.dart';
import 'package:gold/Constants/SizeConfig.dart';
import 'package:gold/Models/CreateAddress.dart';
import 'package:gold/Models/GetAddressList.dart';
import 'package:gold/Screens/CustomDialog.dart';
import 'package:gold/Screens/DeliveryTypeScreen.dart';
import 'package:http/http.dart' as http;
import 'package:page_transition/page_transition.dart';
import 'package:gold/Constants/Globals.dart';
import 'package:gold/Constants/ConstantColors.dart';

class AddressScreen extends StatefulWidget {
  var firstName;
  var lastName;
  var accessToken;
  var idCart;
  var totalBill;
  AddressScreen({this.firstName, this.lastName, this.accessToken,this.idCart,
  this.totalBill
  });

  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  String address = "1";
  GetAddressList _getAddressList;

  Future<GetAddressList> createAddressList() async {
    final String url = "http://15.185.204.189/webapi/server.php";
    final response = await http.post(url, headers: {
      "key": "542A9M87SDKL2M728WQIMC4DSQLU9LL3"
    }, body: {
      "accessToken": "${widget.accessToken}",
      "action": "address/getAddressList",
      "lang": App.localStorage.getString("lang"),
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      print(responseString.toString());
      return GetAddressList.fromRawJson(responseString);
    } else {
      print(response.statusCode);
    }
  }

  Future<void> fetchData() async {
    GetAddressList Details = await createAddressList();

    _getAddressList = Details;
    return _getAddressList;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    print("Total bill is ${widget.totalBill}");
    return Material(
      child: SafeArea(
          child: FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          print(snapshot.data.toString());
          if (snapshot.data == null) {
            return AddressNotAvailable(
              firstName: widget.firstName,
              lastName: widget.lastName,
              accessToken: widget.accessToken,
              idCart: widget.idCart,
              totalBill: widget.totalBill
            );
          } else {
            return Scaffold(
                appBar: AppBar(
                  leading: InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: ConstantColors.buttonColor
                    ),
                  ),
                  backgroundColor: ConstantColors.mainBackground,
                  title: Text(
                    'Select Given Address',
                    style: CustomFonts.googleBodyFont(color: ConstantColors.textColor,
                    fontSize: SizeConfig.textMultiplier * 2
                    ),
                  ),
                  centerTitle: true,
                ),
                backgroundColor: ConstantColors.mainBackground,
                body: Center(
                  child: ListView.builder(
                    padding: EdgeInsets.only(
                        top: SizeConfig.heightMultiplier * 2,
                        left: SizeConfig.widthMultiplier * 2,
                        right: SizeConfig.widthMultiplier * 2),
                    itemCount: snapshot.data.data.length,
                    itemBuilder: (BuildContext context, index) {
                      return InkWell(
                          onTap: () async {
                            // final CreateAddress createAddress =
                            //     await createAddressNow(
                            //         addressTitle:
                            //             snapshot.data.data[index].address1,
                            //         address1:
                            //             snapshot.data.data[index].address1,
                            //         city: snapshot.data.data[index].city,
                            //         postCode:
                            //             snapshot.data.data[index].postcode,
                            //         firstName: widget.firstName,
                            //         lastName: widget.lastName,
                            //         accessToken: widget.accessToken);
                            // setState(() {
                            //   _createAddress = createAddress;
                            // });
                            // if (_createAddress.status == 1) {
                              // showDialog(
                              //     context: context,
                              //     builder: (BuildContext context) {
                              //       return CustomDialogBox(
                              //         message: "Address Added Successfully",
                              //         icon: Icons.check,
                              //       );
                              //     });
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: DeliveryTypeScreen(
                                        idCart: widget.idCart,
                                        accessToken: widget.accessToken,
                                        addressID: _getAddressList.data[index].idAddress,
                                        totalBill: widget.totalBill
                                      )
                                  ));
                            // } else {
                            //   showDialog(
                            //       context: context,
                            //       builder: (BuildContext context) {
                            //         return CustomDialogBox(
                            //           message: _createAddress.message,
                            //           icon: Icons.error_outline,
                            //         );
                            //       });
                            // }
                          },
                          child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(top: 5),
                              height: SizeConfig.heightMultiplier * 10,
                              decoration: BoxDecoration(
                                  color: ConstantColors.buttonColor,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      color: Colors.white, width: 0.5)),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: Text(
                                        '${snapshot.data.data[index].address1}',
                                        style: CustomFonts.googleBodyFont(
                                            color: ConstantColors.textColor,
                                            fontSize:
                                                SizeConfig.textMultiplier *
                                                    2.2),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Text(
                                        '${snapshot.data.data[index].postcode}',
                                        style: CustomFonts.googleBodyFont(
                                            color: ConstantColors.textColor,
                                            fontSize:
                                                SizeConfig.textMultiplier *
                                                    2.2),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Text(
                                        '${snapshot.data.data[index].city}',
                                        style: CustomFonts.googleBodyFont(
                                            color: ConstantColors.textColor,
                                            fontSize:
                                                SizeConfig.textMultiplier *
                                                    2.2),
                                      ),
                                    ),
                                  ),
                                ],
                              )));
                    },
                  ),
                ),
                bottomNavigationBar: Container(
                  height: SizeConfig.heightMultiplier * 7,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: ConstantColors.buttonColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: RaisedButton(
                    color: ConstantColors.buttonColor,
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: AddressNotAvailable(
                                firstName: widget.firstName,
                                lastName: widget.lastName,
                                accessToken: widget.accessToken,
                                idCart: widget.idCart,
                                totalBill: widget.totalBill,
                              )));
                    },
                    child: Text(
                      'Create New Address',
                      style: CustomFonts.googleBodyFont(
                          color: ConstantColors.textColor,
                          fontSize: SizeConfig.textMultiplier * 2),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ));
          }
        },
      )),
    );
  }
}

class AddressNotAvailable extends StatefulWidget {
  var firstName;
  var lastName;
  var accessToken;
  var idCart;
  var totalBill;
  AddressNotAvailable({this.firstName, this.lastName, this.accessToken,
    this.idCart,this.totalBill
  });

  @override
  _AddressNotAvailableState createState() => _AddressNotAvailableState();
}

class _AddressNotAvailableState extends State<AddressNotAvailable> {
  TextEditingController addressTitle = TextEditingController();
  TextEditingController address1 = TextEditingController();
  TextEditingController postCode = TextEditingController();
  TextEditingController city = TextEditingController();
  CreateAddress _createAddress;

  Future<CreateAddress> createAddressNow(
      {String addressTitle,
      String address1,
      String postCode,
      String city}) async {
    final String url = "http://15.185.204.189/webapi/server.php";
    final response = await http.post(url, headers: {
      "key": "542A9M87SDKL2M728WQIMC4DSQLU9LL3"
    }, body: {
      "accessToken": "${widget.accessToken}",
      "action": "address/create",
      "addressTitle": "$addressTitle",
      "firstname": "${widget.firstName}",
      "lastname": "${widget.lastName}",
      "address1": "$address1",
      "postcode": "$postCode",
      "city": "$city",
      "lang": App.localStorage.getString("lang"),
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      // print(responseString.toString());
      return CreateAddress.fromRawJson(responseString);
    } else {
      print(response.statusCode);
    }
  }
  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    print('At address screen xyxyyxyyxyxyxyyxyxyx   ${widget.accessToken}');
    print('At address screen xyxyyxyyxyxyxyyxyxyx   ${widget.idCart}');
    return Scaffold(
        backgroundColor: ConstantColors.mainBackground,
        appBar: AppBar(
          backgroundColor: ConstantColors.mainBackground,
          title: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
          Text(
            'Shipping Details',
            style: CustomFonts.googleBodyFont(
                color: ConstantColors.textColor, fontSize: SizeConfig.heightMultiplier * 2),
            textAlign: TextAlign.center,
          ):
          Text(
            'تفاصيل الشحن',
            style: CustomFonts.googleBodyFont(
                color: ConstantColors.textColor, fontSize: SizeConfig.heightMultiplier * 2),
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.only(
              top: SizeConfig.heightMultiplier * 6,
              bottom: SizeConfig.heightMultiplier * 4,
              left: SizeConfig.widthMultiplier * 2,
              right: SizeConfig.widthMultiplier * 2),
          child: Container(
            height: SizeConfig.heightMultiplier * 45,
            padding: EdgeInsets.only(
                top: SizeConfig.heightMultiplier * 2,
                left: SizeConfig.widthMultiplier * 2,
                right: SizeConfig.widthMultiplier * 2,
                bottom: SizeConfig.widthMultiplier * 2),
            decoration: BoxDecoration(
                color: ConstantColors.buttonColor,
                borderRadius: BorderRadius.circular(12)),
            child: ListView(
              children: [
                textField('${widget.firstName}', Icons.person, val: true,focusNode: node),
                textField('${widget.lastName}', Icons.person, val: true,focusNode: node),
                textField(App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                'Address':'عنوان', Icons.home_filled,
                    controller: addressTitle,focusNode: node),
                textField(App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                'Address 2': 'العنوان 2', Icons.home_filled, controller: address1,focusNode: node),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding:EdgeInsets.only(
                          right: SizeConfig.widthMultiplier * 0.5
                ),
                        child: textField(App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                        'City': 'مدينة', Icons.add_business_sharp,
                            controller: city, focusNode: node),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.widthMultiplier * 0.5
                        ),
                        child: textField(App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                        'Post Code': 'الرمز البريدي',
                            Icons.mail_outline,
                            controller: postCode, focusNode: node),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: SizeConfig.heightMultiplier * 7,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: ConstantColors.buttonColor,
              borderRadius: BorderRadius.circular(20)),
          child: RaisedButton(
            color: ConstantColors.buttonColor,
            onPressed: () async {
              final CreateAddress createAddress = await createAddressNow(
                  addressTitle: addressTitle.text,
                  address1: address1.text,
                  city: city.text,
                  postCode: postCode.text);
              setState(() {
                _createAddress = createAddress;
              });
              if (_createAddress.status == 1) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CustomDialogBox(
                        message: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                        "Address Added Successfully" : 'تمت إضافة العنوان بنجاح',
                        icon: Icons.check,
                      );
                    });
                Navigator.pop(context);
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: DeliveryTypeScreen(
                            idCart: widget.idCart,
                            accessToken: widget.accessToken,
                            addressID: _createAddress.data.idAddress,
                            totalBill: widget.totalBill
                        )
                    ));
              } else {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CustomDialogBox(
                        message: _createAddress.message,
                        icon: Icons.error_outline,
                      );
                    });
              }
            },
            child: Text(
              App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
              'Confirm' :'تؤكد',
              style: CustomFonts.googleBodyFont(
                  color: ConstantColors.textColor, fontSize: SizeConfig.textMultiplier * 2),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
        ));
  }

  Widget textField(String text, var icon, {var controller, bool val, var focusNode}) {
    return Container(
      margin: EdgeInsets.only(top: SizeConfig.heightMultiplier),
      height: SizeConfig.heightMultiplier * 7,
      child: TextField(
        onEditingComplete: () => focusNode.nextFocus(),
        keyboardType: TextInputType.text,
        readOnly: val == true ? val : false,
        controller: controller != null ? controller : null,
        expands: true,
        maxLines: null,
        minLines: null,
        style: CustomFonts.googleBodyFont(
            color: ConstantColors.textColor, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor: Colors.white,
            hintText: '${text}',
            hintStyle: CustomFonts.googleBodyFont(
              color: Colors.black,
            ),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            prefixIcon: Icon(
              icon,
              color: ConstantColors.buttonColor,
            )),
      ),
    );
  }
}

CreateAddress _createAddress;

Future<CreateAddress> createAddressNow(
    {String addressTitle,
    String address1,
    String postCode,
    String city,
    String accessToken,
    String firstName,
    String lastName}) async {
  final String url = "http://15.185.204.189/webapi/server.php";
  final response = await http.post(url, headers: {
    "key": "542A9M87SDKL2M728WQIMC4DSQLU9LL3"
  }, body: {
    "accessToken": "$accessToken",
    "action": "address/create",
    "addressTitle": "$addressTitle",
    "firstname": "$firstName",
    "lastname": "$lastName",
    "address1": "$address1",
    "postcode": "$postCode",
    "city": "$city",
    "lang": App.localStorage.getString("lang"),
  });
  if (response.statusCode == 200) {
    final String responseString = response.body;
    // print(responseString.toString());
    return CreateAddress.fromRawJson(responseString);
  } else {
    print(response.statusCode);
  }
}
