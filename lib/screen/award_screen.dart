import 'package:flutter/material.dart';
import 'package:sample_flutter_web_app/util/constants.dart';

class AwardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Container(
            height: 200,
            child: Image(image: AssetImage('images/spring.png')),
          ),
          // Expanded(
          // child:
          Container(
            margin: EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Text(
              'متن دلخواه اینجا قرار می گیرد یمسیتبمسیبببببببببسمینبتتتتتتتتتتت',
              textAlign: TextAlign.right,
            ),
          ),
          // ),
          // Expanded(
          //   child:
          Container(
            padding: EdgeInsets.only(bottom: 15),
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: grey1,
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 0, left: 0, right: 0),
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    color: pink,
                  ),
                  child: Text(
                    'درست بود، آفرین (:',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  margin: EdgeInsets.all(5),
                  child: Image(image: AssetImage('images/spring.png')),
                ),
                Text(' اعتبار: تا آخر فروردین\nبسته ارسال رایگان:'),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('دریافت هدیه'),
                    style: ElevatedButton.styleFrom(primary: pink),
                  ),
                )
              ],
            ),
          ),
          // ),
        ]),
      ),
    );
  }
}
