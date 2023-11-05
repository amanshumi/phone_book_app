import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:phone_book_app/config/data.dart';

Widget Contact(String name, String phone, DatabaseHelper databaseHelper, int id,
    BuildContext context, var fetchContacts) {
  return Container(
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border(
            bottom: BorderSide(color: Colors.grey.shade300),
            top: BorderSide(color: Colors.grey.shade300),
            right: BorderSide(color: Colors.grey.shade300),
            left: BorderSide(color: Colors.grey.shade300))),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            FaIcon(
              FontAwesomeIcons.userCircle,
              size: 44,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600)),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  children: [
                    // FaIcon(
                    //   FontAwesomeIcons.phone,
                    //   size: 14,
                    // ),
                    // const SizedBox(
                    //   width: 10,
                    // ),
                    Text(phone,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Poppins",
                        ))
                  ],
                )
              ],
            ),
          ],
        ),
        InkWell(
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Warning"),
                    content: Text("Are you sure you want to delete?"),
                    actions: [
                      MaterialButton(
                        onPressed: () async {
                          await databaseHelper.delete(id);
                          fetchContacts();
                          Navigator.pop(context);
                        },
                        child: Text("Yes"),
                      ),
                      MaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("No"),
                      ),
                    ],
                  );
                });
          },
          child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.red.shade600,
                  borderRadius: BorderRadius.circular(8)),
              child: FaIcon(
                FontAwesomeIcons.trashCan,
                size: 18,
                color: Colors.white,
              )),
        )
      ],
    ),
  );
}
