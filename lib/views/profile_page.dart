import 'package:flutter/material.dart';
import 'package:yemek_kapimda/colors/colors.dart' as ColorPage;

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var tfUserNameController = TextEditingController();
  var tfUserPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPage.linen,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children: [
              SizedBox(height: 200,width: 200,),
              TextField(controller: tfUserNameController, decoration: InputDecoration(hintText: "Kullanıcı adı"),),
              TextField(controller: tfUserPasswordController, decoration: InputDecoration(hintText: "Şifre")),
            ],
          ),
        ),
      ),
    );
  }
}
