import 'package:flutter/material.dart';
import 'package:nice_button/nice_button.dart';
import 'package:hexcolor/hexcolor.dart';
import 'quotes.dart';
import 'notifier.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Quotes(),
        ),
      ],

      child: MaterialApp(
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    final f = Provider.of<Quotes>(context);
    return Scaffold(

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(child: Image.network(
                //'https://media1.popsugar-assets.com/files/thumbor/vrxNK6ngK76neDPPpGRaXvA72xA/fit-in/1024x1024/filters:format_auto-!!-:strip_icc-!!-/2019/12/15/670/n/45222255/7229028623a57134_neon-signage-2681319/i/inspirational-quote-phone-backgrounds.jpg',
                'https://i.pinimg.com/originals/59/76/a6/5976a64a6aa7dc1cdab9592cefb72176.gif',
                width: 350,
                height:300,

            ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 50.0),
              child: NiceButton(
                radius: 40,
                background: HexColor('fb6376'),
                padding: const EdgeInsets.all(15),
                text: "Get some advice!",
                textColor: Colors.white,
                icon: Icons.face,
                //gradientColors: [HexColor('E78474'), HexColor('99EDCC'), HexColor('B3D3FA')],

                onPressed: () {
                  f.getdata();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuoteClass()),
                  );
                },
              ),
            ),
          ],
        ),
      ),


    );
  }
}



//Column(
//mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//children: [
//Text('Hello,Welcome to XYZ!'),
//RaisedButton(
//child:Text('Give me a quote for today!'),
//onPressed: getdata,
//
//)
//],
//),