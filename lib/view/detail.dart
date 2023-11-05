import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ContactDetail extends StatefulWidget {
  const ContactDetail({super.key});

  @override
  State<ContactDetail> createState() => _ContactDetailState();
}

class _ContactDetailState extends State<ContactDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.grey.shade300,
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell( onTap: () {
                  Get.back();
                },child: FaIcon(FontAwesomeIcons.arrowLeftLong)),
                Text(
                  "Details",
                  style: TextStyle(fontSize: 28, fontFamily: "Poppins", fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
                width: 80,
                height: 80,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blue.shade700,
                ),
                child: Center(child: Text("G", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Poppins", color: Colors.white, fontSize: 40),)),
              ),
            
                        Container(
              padding: const EdgeInsets.all(22),
              
              decoration: BoxDecoration(color: Colors.white,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        FaIcon(FontAwesomeIcons.userCircle),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "George Mason",
                          style: TextStyle( fontFamily: "Poppins",
                              fontSize: 18),
                        ),
                      ],
                    ),
                    const SizedBox(height: 28,),
                    Row(
                      children: [
                        FaIcon(FontAwesomeIcons.phone),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "210-290-2989",
                          style: TextStyle( fontFamily: "Poppins",
                              fontSize: 18),
                        ),
                      ],
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
