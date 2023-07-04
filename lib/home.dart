import 'package:flutter/material.dart';
import 'package:flutter_api_calling/apiservice.dart';
import 'package:flutter_api_calling/model/usermodel.dart';
import 'second_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<UserModel>? usermodel;
  var data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getData();
    // callPostMethod();
  }

  void getData() async {
    var usermodel1 = (await ApiService().getUser1());
    if (usermodel1 != null) {
      usermodel = usermodel1;
    }
    // data = await ApiService().getUser();
    // if (data != null) {
    //   final Map<String, dynamic> t = jsonDecode(data);
    //   print(t.runtimeType);
    //   usermodel = UserModel.fromJson(t);
    //   if (usermodel != null) {
    //     print((usermodel?.name != null) ? usermodel?.name : 'blank');
    //   }
    // }
    Future.delayed(const Duration(seconds: 5)).then((value) => setState(() {}));
  }

  void callPostMethod() async {
    var signUp = await ApiService().register("vibhuti", "125", "30");
    print(signUp?.data?.id);
    print("test");
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const SecondScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text(
            'Navigate to a new screen >>',
            style: TextStyle(fontSize: 24.0),
          ),
          onPressed: () {
            _navigateToNextScreen(context);
          },
        ),
      ),
    );
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
  }
}
