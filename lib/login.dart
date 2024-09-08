import 'package:flutter/material.dart';
import 'package:mizan_app/CacheHelper.dart';
import 'package:mizan_app/constant.dart';
import 'package:mizan_app/profile.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final TextEditingController nameController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController incomeController = TextEditingController();
final TextEditingController bankBalanceController = TextEditingController();

class _HomeState extends State<Home> {
  bool _obscureIncomeText = false;
  bool _obscureBankBalanceText = false;
  String _selectedCountry = 'اختر دولتك';

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  void _checkLoginStatus() async {
    bool isLoggedIn = await CacheHelper.containKey(key: 'isLoggedIn');
    if (isLoggedIn) {
      Navigator.pushReplacementNamed(context, '/homePage');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Center(
            child: Text(
              "ميزان",
              style: TextStyle(
                fontFamily: "Lemonada",
                fontWeight: FontWeight.bold,
                fontSize: 30, // تعديل حجم الخط
                color: Colors.black,
              ),
            ),
          ),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 16.0, vertical: 20.0), // تعديل المسافات
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 200, // تعديل ارتفاع الصورة
                  width: double.infinity,
                  child: Image(image: AssetImage("assets/login.gif")),
                ),
                SizedBox(
                  height: 50, // تعديل الارتفاع
                  width: double.infinity,
                  child: TextFormField(
                    style: TextStyle(
                        color: Colors.black, fontSize: 16), // تعديل حجم النص
                    decoration: InputDecoration(
                      hintText: "الاسم الكامل",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 16, // تعديل حجم النص
                      ),
                      labelText: " الاسم الكامل",
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 16, // تعديل حجم النص
                        fontWeight: FontWeight.bold,
                        fontFamily: "ReadexPro",
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                    ),
                    controller: nameController,
                  ),
                ),
                SizedBox(height: 10), // تعديل المسافة بين الحقول
                SizedBox(
                  height: 50, // تعديل الارتفاع
                  width: double.infinity,
                  child: TextFormField(
                    style: TextStyle(
                        color: Colors.black, fontSize: 16), // تعديل حجم النص
                    decoration: InputDecoration(
                      hintText: "البريد الالكتروني",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 16, // تعديل حجم النص
                      ),
                      labelText: " البريد الالكتروني",
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 16, // تعديل حجم النص
                        fontWeight: FontWeight.bold,
                        fontFamily: "ReadexPro",
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                    ),
                    controller: emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "ادخل البريد الالكتروني";
                      } else if (!value.contains("@gmail.com")) {
                        return "البريد ليس صحيح";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 10), // تعديل المسافة بين الحقول
                SizedBox(
                  height: 50, // تعديل الارتفاع
                  width: double.infinity,
                  child: TextFormField(
                    controller: incomeController,
                    obscureText: _obscureIncomeText,
                    style: TextStyle(
                        color: Colors.black, fontSize: 16), // تعديل حجم النص
                    decoration: InputDecoration(
                      hintText: "الدخل الشهري",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 16, // تعديل حجم النص
                      ),
                      labelText: " الدخل الشهري",
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 16, // تعديل حجم النص
                        fontWeight: FontWeight.bold,
                        fontFamily: "ReadexPro",
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureIncomeText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureIncomeText = !_obscureIncomeText;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10), // تعديل المسافة بين الحقول
                SizedBox(
                  height: 50, // تعديل الارتفاع
                  width: double.infinity,
                  child: TextFormField(
                    controller: bankBalanceController,
                    obscureText: _obscureBankBalanceText,
                    style: TextStyle(
                        color: Colors.black, fontSize: 16), // تعديل حجم النص
                    decoration: InputDecoration(
                      hintText: "الرصيد البنكي",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 16, // تعديل حجم النص
                      ),
                      labelText: "الرصيد البنكي",
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 16, // تعديل حجم النص
                        fontWeight: FontWeight.bold,
                        fontFamily: "ReadexPro",
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureBankBalanceText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureBankBalanceText = !_obscureBankBalanceText;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.black, width: 1.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _selectedCountry,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: "ReadexPro",
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            _showCountryPicker(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20), // تعديل المسافة فوق الزر
                ElevatedButton(
                  onPressed: _handleLogin,
                  child: Text(
                    "تسجيل الدخول",
                    style: TextStyle(
                        fontSize: 16, fontFamily: "ReemKufi"), // تعديل حجم النص
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor3,
                    padding: EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10), // تعديل الحشو
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showCountryPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: items1.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  items1[index],
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "ReemKufi",
                  ),
                ),
                onTap: () {
                  setState(() {
                    _selectedCountry = items1[index];
                  });
                  Navigator.pop(context);
                },
              );
            },
          ),
        );
      },
    );
  }

  void _handleLogin() async {
    if (_formKey.currentState?.validate() ?? false) {
      await CacheHelper.saveData(key: 'isLoggedIn', value: true);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('تسجيل الدخول')),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Profile(selectedCountry: _selectedCountry),
        ),
      );
    }
  }
}