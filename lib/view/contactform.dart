import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:get/get.dart';
import 'package:phone_book_app/config/data.dart';
import 'package:phone_book_app/view/home.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _imageFormKey = GlobalKey<FormBuilderImagePickerState>();
  var phoneController = TextEditingController();
  var nameController = TextEditingController();
  var status = "";

  final DatabaseHelper databaseHelper = DatabaseHelper();

  void initDb () async {
    await databaseHelper.init();
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
      body: Container(
        width: Get.width,
        height: Get.height,
        padding: const EdgeInsets.all(20),
        color: Colors.grey.shade300,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(onTap: () {
                    Get.off(() => const Home());
                  }, child: FaIcon(FontAwesomeIcons.arrowLeftLong)),
                  Text(
                    "Add Contact",
                    style: TextStyle(fontSize: 28, fontFamily: "Poppins", fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name",
                        style: TextStyle(fontSize: 18, fontFamily: "Poppins",),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (val) {
                          if (val == "") {
                            return "name is required";
                          }
                        },
                        controller: nameController,
                        decoration: InputDecoration(
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
                          hintText: "E.g John Lark",
                          fillColor: Colors.white70,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Phone",
                        style: TextStyle(fontSize: 18, fontFamily: "Poppins",),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (val) {
                          if (val == "") {
                            return "phone is required";
                          }
                        },
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
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
                          hintText: "E.g 210-229-1989",
                          fillColor: Colors.white70,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Avatar (Optional)",
                        style: TextStyle(fontSize: 18,  fontFamily: "Poppins",),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FormBuilderImagePicker(
                        key: _imageFormKey,
                        name: 'photos',
                        decoration:
                            const InputDecoration(labelText: 'Pick Photos'),
                        maxImages: 1,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      status != "" ? Container(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          status == "success" ? "Contact added successfully" : "Something went wrong"
                        , style: TextStyle(color: status == "success" ? Colors.green.shade500 : Colors.red.shade600, fontWeight: FontWeight.bold, fontFamily: "Poppins", fontSize: 13),),
                      ) : Container(),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: ElevatedButton(
                              onPressed: () async {
                                // _formKey.currentState?.validate();
                                if(!_formKey.currentState!.validate()) {
                                  return;
                                }
        
                                Map<String, dynamic> map = {
                                  "name": nameController.value.text,
                                  "phone": phoneController.value.text
                                };
        
                                final addContact = await databaseHelper.insert(map);
        
                                _formKey.currentState!.reset();
        
                                if(addContact > 0) { 
                                  setState(() {
                                    status = "success";
                                  });
                                } else {
                                  setState(() {
                                    status = "failure";
                                  });
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                child: Text(
                                  "Save",
                                  textAlign: TextAlign.center,
                                  style: TextStyle( fontFamily: "Poppins",
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: ElevatedButton(
                              onPressed: () {
                                Get.back();
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                child: Text(
                                  "Cancel",
                                  textAlign: TextAlign.center,
                                  style: TextStyle( fontFamily: "Poppins",
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
