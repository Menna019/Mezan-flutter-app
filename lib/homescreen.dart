//import 'package:competation/constant/style.dart';
//import 'package:competation/money.dart';

import 'package:flutter/material.dart';
import 'package:mizan_app/constant.dart';
import 'package:mizan_app/percentage.dart';
import 'package:mizan_app/profile.dart';
import 'package:mizan_app/thirdscreen.dart';

class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  State<Home2> createState() => _HomeState();
}

class _HomeState extends State<Home2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ميزان",
          style: TextStyle(
              color: Colors.black, fontFamily: kfontStyle1, fontSize: 30),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage("assets/images/logo (2).png"),
            ),
            Container(
              width: 260,
              height: 80,
              margin: const EdgeInsets.only(left: 45, right: 20, bottom: 10),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15)),
                  color: kPrimaryColor2),
              child: const Text("اهلا بك في الميزان يا ",
                  style: TextStyle(fontSize: 20, fontFamily: kfontStyle3)),
            ),
            Container(
              height: 600,
              child: ListView(children: [
                Container(
                  width: double.infinity,
                  height: 130,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: kPrimaryColor3),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("حساب تحويل العملات الي الدولار",
                          style: TextStyle(color: KPrimary5)),
                      CircleAvatar(
                        backgroundImage: AssetImage("assets/images/dolar.png"),
                        radius: 35,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: Container(
                    height: 130,
                    margin: const EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: kPrimaryColor3),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("عرض الاقساط و مواعيدها            ",
                            style: TextStyle(color: KPrimary5)),
                        CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/aqsat.jpg"),
                          radius: 35,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Money()));
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    width: double.infinity,
                    height: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: kPrimaryColor3),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("تنظيم المصروفات بالنسبه لدخلك الشهري",
                            style: TextStyle(color: kPrimaryColor4)),
                        CircleAvatar(
                          radius: 35,
                          backgroundImage:
                              AssetImage("assets/images/masrouf.png"),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Profile(
                                  selectedCountry: '',
                                )));
                  },
                  child: Container(
                    height: 130,
                    margin: const EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: kPrimaryColor3),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                            "      البيانات الشخصيه                             ",
                            style: TextStyle(color: kPrimaryColor3)),
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage("assets/images/data.jpg"),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}