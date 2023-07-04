// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/signupModel.dart';
import 'widgets/app_textfield.dart';
import 'provider/dataclass_provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getData();
    // callPostMethod();
  }

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  Future<void> _registration() async {
    String name = nameController.text.trim();
    String phone = phoneController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    SignUpBody signUpBody =
        SignUpBody(name: name, phone: phone, email: email, password: password);
    var provider = Provider.of<DataClass>(context, listen: false);
    await provider.postData(signUpBody);
    //print(data1);
    if (provider.isBack) {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => HomePage()),
      // );

      // ignore: avoid_print
      print("user registered");
    } else {
      print("error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: Consumer<DataClass>(builder: (context, data, child) {
          return data.loading
              ? Center(
                  child: Container(
                    child: SpinKitThreeBounce(
                      itemBuilder: (BuildContext context, int index) {
                        return DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: index.isEven ? Colors.red : Colors.green,
                          ),
                        );
                      },
                    ),
                  ),
                )
              : SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      const SizedBox(height: 100),
                      //app logo
                      SizedBox(
                          height: 100,
                          child: Center(
                            child: CircleAvatar(
                              backgroundColor: Colors.grey[300],
                              radius: 80,
                            ),
                          )),
                      //your email
                      AppTextField(
                          textController: emailController,
                          hintText: "Email",
                          icon: Icons.email),
                      const SizedBox(
                        height: 20,
                      ),
                      //your password
                      AppTextField(
                          textController: passwordController,
                          hintText: "Password",
                          icon: Icons.password_sharp,
                          isObscure: true),
                      const SizedBox(
                        height: 20,
                      ),
                      //your name
                      AppTextField(
                          textController: nameController,
                          hintText: "Name",
                          icon: Icons.person),
                      const SizedBox(
                        height: 20,
                      ),
                      //your phone
                      AppTextField(
                          textController: phoneController,
                          hintText: "Phone",
                          icon: Icons.phone),
                      const SizedBox(
                        height: 20 + 20,
                      ),
                      //sign up button
                      GestureDetector(
                        onTap: () {
                          _registration();
                        },
                        child: Container(
                          height: 70,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 23),
                          margin: const EdgeInsets.only(left: 40, right: 40),
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(4, 4),
                                  blurRadius: 15,
                                  spreadRadius: 1,
                                ),
                                BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(-4, -4),
                                  blurRadius: 15,
                                  spreadRadius: 1,
                                ),
                              ]),
                          child: const Text(
                            "Sign up",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF74beef),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //tag line
                      RichText(
                          text: TextSpan(
                              text: "Have an account already?",
                              style: TextStyle(
                                  color: Colors.grey[500], fontSize: 20))),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      //sign up options
                      RichText(
                          text: TextSpan(
                              text:
                                  "Sign up using one of the following methods",
                              style: TextStyle(
                                  color: Colors.grey[500], fontSize: 16))),
                    ],
                  ),
                );
        }));
  }

  // Initial Selected Value
  // Map<String, String>? dropdownvalue; // {'title': 'Item 1', 'value': '1'};

  // // List of items in our dropdown menu
  // List<Map<String, String>> items = [
  //   {'title': 'Item 1', 'value': '1'},
  //   {'title': 'Item 2', 'value': '2'},
  //   {'title': 'Item 3', 'value': '3'},
  // ];

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Center(
  //       child: DropdownButton(
  //         // Initial Value
  //         value: dropdownvalue,
  //         // Array list of items
  //         items: items.map((Map<String, String> items) {
  //           return DropdownMenuItem(
  //             value: items,
  //             child: Text(items['title']!),
  //           );
  //         }).toList(),
  //         // After selecting the desired option,it will
  //         // change button value to selected value
  //         onChanged: (Map<String, String>? newValue) {
  //           setState(() {
  //             dropdownvalue = newValue!;
  //           });
  //         },
  //       ),
  //     ),
  //   );
// }
  // body: usermodel == null || usermodel!.isEmpty
  //     ? const Center(
  //         child: CircularProgressIndicator(),
  //       )
  //     : ListView.builder(
  //         itemCount: usermodel!.length,
  //         itemBuilder: (context, index) {
  //           return Container(
  //             height: 150,
  //             color: Colors.greenAccent,
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(
  //                   'hi',
  //                   // 'id: ${usermodel![index].id.toString()}',
  //                   style: TextStyle(fontSize: 15),
  //                 ),
  //                 Text(
  //                   'username:',
  //                   style: TextStyle(fontSize: 15),
  //                 ),
  //                 Text(
  //                   'email:${usermodel![index].email}',
  //                   style: TextStyle(fontSize: 15),
  //                 ),
  //                 Text(
  //                   'website:${usermodel![index].website}',
  //                   style: TextStyle(fontSize: 15),
  //                 )
  //               ],
  //             ),
  //           );
  //         }));
  // }
}
