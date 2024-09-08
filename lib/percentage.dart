//import 'package:competation/constant/style.dart';
import 'package:flutter/material.dart';
import 'package:mizan_app/constant.dart';
import 'package:mizan_app/login.dart';

class Money extends StatefulWidget {
  const Money({super.key});

  @override
  State<Money> createState() => _MoneyState();
}

class _MoneyState extends State<Money> {
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
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage("assets/images/logo (2).png"),
        ),
        Container(
          height: 70,
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
              color: kPrimaryColor2),
          child: Text(
              "في هذة الصفحة يتم افضل نسبة لتنظيم مصروفات من خلال مرتبك  ",
              style: TextStyle(fontSize: 20, fontFamily: kfontStyle3)),
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: MaterialButton(
            onPressed: () {},
            child: Text(
              incomeController.text * 50,
              style: TextStyle(color: KPrimary5),
            ),
            minWidth: 100,
            color: kPrimaryColor4,
            height: 50,
          ),
        ),
        SizedBox(
          height: 40,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                width: 200,
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: kPrimaryColor2),
                child: Center(
                  child: Column(children: [
                    const Text("مصروفاتك الاساسية الثابتة "),
                    CircleAvatar(
                      radius: 45,
                      child: Column(
                        children: [Text("50.0%"), Text("")],
                      ),
                    ),
                    const Row(
                      children: [
                        Icon(Icons.electric_bike_outlined),
                        Text("فواتير الكهرباء و المياه")
                      ],
                    ),
                    const Row(
                      children: [Icon(Icons.money), Text("مصاريف التعليم")],
                    ),
                    const Row(
                      children: [
                        Icon(Icons.health_and_safety),
                        Text("الرعاية الصحية")
                      ],
                    ),
                    const Row(
                      children: [
                        Icon(Icons.directions_transit_filled),
                        Text("النقل")
                      ],
                    ),
                  ]),
                ),
              ),
              Container(
                width: 200,
                height: 300,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}