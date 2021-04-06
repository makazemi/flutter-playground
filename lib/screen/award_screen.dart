import 'package:flutter/material.dart';
import 'package:sample_flutter_web_app/util/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class AwardScreen extends StatelessWidget {
  void openWebView() async {
    if (await canLaunch(SITE_URL)) {
      await launch(SITE_URL);
    } else {
      throw 'Could not launch';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Expanded(
                flex: 2,
                child: Image(
                  image: AssetImage('images/banneraward.jpg'),
                  fit: BoxFit.fill,
                )),
            // Expanded(
            // child:
            Container(
              margin: EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Text(
                'مرسی از اینکه این مدت کنار ما بودی و افتخار دادی که کنارتون باشیم.لحظه به لحظه زندگیت پر باشه از شادی و خنده.\n به پاس بودنت این عیدی ما به شما.\n'
                'سال نو مبارک.\n'
                'یادت نره که چندماهمه دوست داره.',
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
                      'هدیه ما به شما',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    margin: EdgeInsets.all(5),
                    child: Image(image: AssetImage('images/giftbox.png')),
                  ),
                  Text('بسته ارسال رایگان\n'
                      'اعتبار: تا آخر فروردین'),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (ctxt) => AlertDialog(
                            title: Text(
                              "هدیه برای این شماره همراهت فعال شد",
                              textAlign: TextAlign.center,
                            ),
                            content: Text(
                              'فقط کافیه بری به سایت ما، قسمت جوایز من و ازش استفاده کنی.'
                              "مبارکت باشه",
                              textAlign: TextAlign.center,
                            ),
                            actions: [
                              ElevatedButton(
                                child: Text('بریم سراغ سایت'),
                                style: ElevatedButton.styleFrom(primary: pink),
                                onPressed: () {
                                  Navigator.pop(context);
                                  openWebView();
                                },
                              ),
                              ElevatedButton(
                                child: Text('بعدا سر میزنیم'),
                                style: ElevatedButton.styleFrom(primary: pink),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          ),
                        );
                      },
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
      ),
    );
  }
}
