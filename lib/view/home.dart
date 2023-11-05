import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:phone_book_app/config/data.dart';
import 'package:phone_book_app/view/contactform.dart';
import 'package:phone_book_app/view/detail.dart';
import 'package:phone_book_app/widget/contact.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final DatabaseHelper databaseHelper = DatabaseHelper();
  List<Map<String, dynamic>> contactList = [];

  void initDb () async {
    await databaseHelper.init();
    fetchContacts();
  }

  void fetchContacts() async {
    var allLists = await databaseHelper.queryAllRows();

    setState(() {
      contactList = allLists;
    });
  }

  void searchContacts(String name) async {
    var allLists = await databaseHelper.searchAllRows(name);

    setState(() {
      contactList = allLists;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    initDb();
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(const ContactForm());
          },
          backgroundColor: Colors.blue.shade700,
          child: Container(child: FaIcon(FontAwesomeIcons.plus)),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          color: Colors.grey.shade300,
          child: Column(children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(
                  FontAwesomeIcons.contactBook,
                  size: 40,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Phone Book App",
                  style: TextStyle(fontSize: 28, fontFamily: "Poppins", fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Text("All Contacts",
                    style: TextStyle(fontSize: 18, fontFamily: "Poppins", fontWeight: FontWeight.bold))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              
              decoration: InputDecoration(
                // prefixIcon: Container(margin: const EdgeInsets.only(left: 10), child: Align(alignment: Alignment.centerLeft, child: FaIcon(FontAwesomeIcons.searchengin))),
                contentPadding: EdgeInsets.all(10),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[800], fontFamily: "Poppins",),
                hintText: "Search here",
                fillColor: Colors.white70,
              ),
              onChanged: (value) {
                searchContacts(value);
              },
            ),
            const SizedBox(
              height: 4,
            ),
            contactList != null ? Expanded(
              child: contactList.length < 1 ? Container(
              padding: const EdgeInsets.all(20),
              child: Text("No contacts found", style: TextStyle(color: Colors.red.shade700, fontFamily: "Poppins", fontSize: 14),),
             ) : ListView.builder(
              
                physics: NeverScrollableScrollPhysics(),
                itemCount: contactList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(() => ContactDetail());
                    },
                    child: Contact(
                      contactList[index]["name"], contactList[index]["phone"], databaseHelper, contactList[index]["_id"], context, fetchContacts)
                    ,
                  );
                }),
            )
             :Container()
          
          ]),
        ));
  }
}
