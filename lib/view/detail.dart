import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ContactDetail extends StatefulWidget {
  const ContactDetail({super.key});

  @override
  State<ContactDetail> createState() => _ContactDetailState();
}

class _ContactDetailState extends State<ContactDetail> {

  final String? name = Get.arguments["name"];
  final String? phone = Get.arguments["phone"];
  final id = Get.parameters["id"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(Get.parameters);
  }

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
                width: Get.width,
                height: 10,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blue.shade700,
                ),
                child: Container(),
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
                          name!,
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
                          phone!,
                          style: TextStyle( fontFamily: "Poppins",
                              fontSize: 18),
                        ),
                      ],
                    )
                  ]),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: InkWell(onTap: () {
                              
                            }, child: Container(
                              padding: const EdgeInsets.all(14),
                              decoration: BoxDecoration(color: Colors.blue.shade700, borderRadius: BorderRadius.circular(10)),
                              child: Text("Edit", textAlign: TextAlign.center, style: TextStyle(fontFamily: "Poppins", color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),),
                            ),),
                ),
                const SizedBox(width: 30,),
            Expanded(
              child: InkWell(onTap: () {
                
              }, child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(color: Colors.red.shade700, borderRadius: BorderRadius.circular(10)),
                child: Text("Delete", textAlign: TextAlign.center, style: TextStyle(fontFamily: "Poppins", color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),),
              ),),
            )
              ],
            )
          ],
        ),
      ),
    );
  }
}
