// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:registration_form/rf_adding_data.dart';

class RfRegistrationForm extends StatefulWidget {
  const RfRegistrationForm({super.key});

  @override
  State<RfRegistrationForm> createState() => _RfRegistrationFormState();
}

class _RfRegistrationFormState extends State<RfRegistrationForm> {
  var name = TextEditingController();
  var email = TextEditingController();
  var number = TextEditingController();
  var gender = "";

  var dropdownvalue = "Kozhikode";
  var state1 = [
    "Kozhikode",
    "Alappuzha",
    "Eranakulam",
    "Idukki",
    "Kasaragod",
    "Kottayam",
    "Malappuram",
    "Tvm",
    "kollam",
    "Kannur"
     "Wayanad"
  ];
  var l1=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 15, top: 40),

                //* TextFormField
                child: Row(
                  children: [
                   const Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: Text(
                        "Name",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 23),
                      child: SizedBox(
                        width: 260,
                        height: 50,
                        child: TextFormField(
                          controller: name,
                          decoration:const InputDecoration(
                              labelText: "Enter your name",
                              border: OutlineInputBorder()),
                              keyboardType: TextInputType.name,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 21),
                child: Row(
                  children: [
                   const Padding(
                      padding:  EdgeInsets.only(
                        left: 8,
                      ),
                      child: Text(
                        "Email",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: SizedBox(
                        width: 260,
                        height: 50,
                        child: TextFormField(
                          controller: email,
                          decoration:const InputDecoration(
                              labelText: "Enter your Email",
                              border: OutlineInputBorder()),
                              keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Row(
                  children: [
                   const Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: Text(
                        "Number",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: 260,
                      height: 50,
                      child: TextFormField(
                        controller: number,
                        decoration: const InputDecoration(
                            labelText: "Enter your Number",
                            border: OutlineInputBorder()),
                            keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              ),

              //* RadioButton
             const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25, left: 20),
                    child: Text(
                      "Gender",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 200,top: 15),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 180,
                      child: RadioListTile(
                          title:const Text("male"),
                          value: "male",
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value.toString();
                            });
                          }),
                    ),
                    SizedBox(
                      width: 180,
                      child: RadioListTile(
                          title: const Text("female"),
                          value: "female",
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value.toString();
                            });
                          }),
                    ),
                    SizedBox(
                      width: 180,
                      child: RadioListTile(
                          title: const Text("other"),
                          value: "other",
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value.toString();
                            });
                          }),
                    ),
                  ],
                ),
              ),

              //* DropdownButton
              Row(
                children: [
                 const Padding(
                    padding: const EdgeInsets.only(left: 17),
                    child: Text(
                      "State",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60),
                    child: SizedBox(
                      height: 50,
                      width: 200,
                      child: DropdownButton(
                          value: dropdownvalue,
                          icon:const Icon(Icons.keyboard_arrow_down),
                          items: state1.map((String value1) {
                            return DropdownMenuItem(
                                value: value1, child: Text(value1));
                          }).toList(),
                          onChanged: (String? newvalue) {
                            setState(() {
                              dropdownvalue = newvalue!;
                            });
                          }),
                    ),
                  )
                ],
              ),

              //*  Elevatedbutton Button
              Padding(
                padding: const EdgeInsets.only(top: 60, left: 100),
                child: Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          l1.add({
                            "name":name.text,
                            "email":email.text,
                            "number":number.text,
                            "gender":gender, 
                            "State": dropdownvalue,
                          });
                          Navigator.push(context, MaterialPageRoute(builder: (ctx)=>RfAddingData(details:l1)));
                        },
                        child:const Text("Submit")),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: ElevatedButton(
                          onPressed: () {
                            name.clear();
                            email.clear();
                            number.clear();
                            setState(() {
                              gender="";
                            });
                            dropdownvalue="Kozhikode";
                      
                          },
                          child:const Text("cancel")),
                    )
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
