import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Controllers to capture user input
  TextEditingController monthlyInstallmentController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  // Method to show the custom dialog
  void _showInstallmentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text("إضافة قسط جديد", textAlign: TextAlign.center),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Monthly installment field
              TextField(
                controller: monthlyInstallmentController,
                decoration: InputDecoration(
                  labelText: "القسط الشهري",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Date field
              TextField(
                controller: dateController,
                decoration: InputDecoration(
                  labelText: "الميعاد",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Notes field
              TextField(
                controller: notesController,
                decoration: InputDecoration(
                  labelText: "ملاحظات",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: const Text("إلغاء"),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle saving the installment details here
                print("القسط الشهري: ${monthlyInstallmentController.text}");
                print("الميعاد: ${dateController.text}");
                print("ملاحظات: ${notesController.text}");
                Navigator.of(context).pop(); // Dismiss the dialog after adding
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 42, 96, 44),
              ),
              child: const Text("إضافة"),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    // Dispose controllers when no longer needed
    monthlyInstallmentController.dispose();
    dateController.dispose();
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade50,
      appBar: AppBar(
        backgroundColor: Colors.amber.shade50,
        title: const Padding(
          padding: EdgeInsets.only(right: 200),
          child: Text(
            "ميزان",
            style: TextStyle(
              color: Colors.black,
              fontFamily: "Gulzar",
            ),
          ),
        ),
      ),
      body: Row(
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage("assets/logo.png"),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 200),
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(112, 76, 175, 79),
              ),
              child: const Center(
                child: Text(
                  "في هذه الغرفة يتم عرض أو إضافة أو حذف الأقساط الملتزم بها حاليا",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
          const Center(
            child: Text(
              "ليس لديك أي قسط بعد",
              style: TextStyle(color: Color.fromARGB(160, 76, 175, 79)),
            ),
          ),
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 238, 221, 170),
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: AssetImage("assets/no quest.gif"),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 42, 96, 44),
        onPressed: () {
          _showInstallmentDialog(context);
        },
        child: const Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}