
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:nice_button/nice_button.dart';
import 'notifier.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class QuoteClass extends StatefulWidget {
  @override
  _QuoteClassState createState() => _QuoteClassState();
}

class _QuoteClassState extends State<QuoteClass> {

  @override
  Widget build(BuildContext context) {
    return
      Center(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: HexColor('fb6376'),
            centerTitle: true,
            title: Text(
              'Advice Slip API',
              style: TextStyle(
                color: Colors.white,

              ),
            ),
          ),
          body: MainPage(),
        ),
      );


  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override

  Widget build(BuildContext context) {
    final f = Provider.of<Quotes>(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (f.data==null) SpinKitPouringHourglass(
            color: HexColor('fb6376'),
            size: 100,
          ) else Column(
            children: [
              Container(

                width: 300,
                height: 300,
                padding: EdgeInsets.all(20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: HexColor('1b4965'),
                  //borderRadius: BorderRadius.all(Radius.circular(50)),
                  shape: BoxShape.circle,
                ),
                child: Text(
                  f.data,
                  style: TextStyle(
                    color: HexColor('cae9ff'),
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(50),
                child: NiceButton(
                  radius: 40,
                  background: HexColor('fb6376'),
                  padding: const EdgeInsets.all(15),
                  text: "Go Back!",
                  icon: Icons.keyboard_arrow_left,
                  //gradientColors: [HexColor('E78474'), HexColor('B3D3FA')],
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),


        ],
      ),
    );
  }
}
