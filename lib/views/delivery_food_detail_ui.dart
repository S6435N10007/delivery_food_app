import 'package:delivery_food_app/models/food_shop_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class DeliveryFoodDetailUI extends StatefulWidget {
  FoodShopList? foodShopList;
  DeliveryFoodDetailUI({super.key, this.foodShopList});
  @override
  State<DeliveryFoodDetailUI> createState() => _DeliveryFoodDetailUIState();
}

class _DeliveryFoodDetailUIState extends State<DeliveryFoodDetailUI> {
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'สายด่วนชวนกิน ' + widget.foodShopList!.shopName + ' ',
          style: GoogleFonts.kanit(
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.width * 0.05,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Container(
                height: MediaQuery.of(context).size.width * 0.5,
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/' + widget.foodShopList!.shopImage,
                    ),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                    color: Colors.white,
                    width: 5,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1,
                  right: MediaQuery.of(context).size.width * 0.1,
                ),
                child: ListTile(
                  leading: Icon(
                    FontAwesomeIcons.store,
                    color: Colors.white,
                  ),
                  title: Text(
                    'ชื่อร้าน : ' + widget.foodShopList!.shopName,
                    style: GoogleFonts.kanit(
                      color: Colors.white,
                    ),
                  ),
                  tileColor: Colors.red,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1,
                  right: MediaQuery.of(context).size.width * 0.1,
                ),
                child: ListTile(
                  onTap: () {
                    _makePhoneCall(widget.foodShopList!.shopPhone);
                  },
                  leading: Icon(
                    FontAwesomeIcons.phone,
                    color: Colors.white,
                  ),
                  title: Text(
                    'เบอร์โทร : ' + widget.foodShopList!.shopPhone,
                    style: GoogleFonts.kanit(
                      color: Colors.white,
                    ),
                  ),
                  tileColor: Colors.red,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1,
                  right: MediaQuery.of(context).size.width * 0.1,
                ),
                child: ListTile(
                  onTap: () {
                    _launchInBrowser(
                      Uri.parse('https://www.facebook.com/' +
                          widget.foodShopList!.shopFacebook),
                    );
                  },
                  leading: Icon(
                    FontAwesomeIcons.facebook,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Facebook : ' + widget.foodShopList!.shopFacebook,
                    style: GoogleFonts.kanit(
                      color: Colors.white,
                    ),
                  ),
                  tileColor: Colors.red,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1,
                  right: MediaQuery.of(context).size.width * 0.1,
                ),
                child: ListTile(
                  onTap: () {
                    _launchInBrowser(
                      Uri.parse(widget.foodShopList!.shopWeb),
                    );
                  },
                  leading: Icon(
                    FontAwesomeIcons.globe,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Website : ' + widget.foodShopList!.shopWeb,
                    style: GoogleFonts.kanit(
                      color: Colors.white,
                    ),
                  ),
                  tileColor: Colors.red,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1,
                  right: MediaQuery.of(context).size.width * 0.1,
                ),
                child: ListTile(
                  onTap: () {
                    _launchInBrowser(
                      Uri.parse(
                          'https://www.google.com/maps/search/?api=1&query=' +
                              widget.foodShopList!.shopLatitude +
                              ',' +
                              widget.foodShopList!.shopLongtitude),
                    );
                  },
                  leading: Icon(
                    FontAwesomeIcons.mapLocation,
                    color: Colors.white,
                  ),
                  title: Text(
                    'สถานที่ตั้งร้าน : Let\'s go',
                    style: GoogleFonts.kanit(
                      color: Colors.white,
                    ),
                  ),
                  tileColor: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
