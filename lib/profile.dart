import 'package:flutter/material.dart';
import 'package:mizan_app/constant.dart';
import 'package:mizan_app/login.dart';

class Profile extends StatefulWidget {
  final String selectedCountry; // Add this parameter

  const Profile({super.key, required this.selectedCountry});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ميزان",
          style: TextStyle(color: Colors.black, fontFamily: kfontStyle1),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: double.infinity,
                margin: const EdgeInsets.all(20.0),
                height: 450,
                decoration: BoxDecoration(
                    color: kPrimaryColor2,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text("${nameController.text}"),
                      Text("${emailController.text}"),
                      ElevatedButton(
                          onPressed: () {},
                          child: Text(widget.selectedCountry)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            radius: 35,
                            child: Text("${incomeController.text}"),
                          ),
                          CircleAvatar(
                            radius: 35,
                            child: Text("${bankBalanceController.text}"),
                          )
                        ],
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          child: Text(widget.selectedCountry)),
                    ],
                  ),
                ),
              ),
              const Positioned(
                top: -20,
                left: 130,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                    "assets/images/slogan.gif",
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}