import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:yemek_kapimda/colors/colors.dart' as ColorPage;
import 'package:yemek_kapimda/constants/app_constants.dart' as Constant;
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  String currentUser = Constant.USER_NAME;

  Future<void> getUser() async {
    var sp = await SharedPreferences.getInstance();
    currentUser = sp.getString("user_name") ?? "${Constant.USER_NAME}";
  }

  Future<void> changeUser(String user_name) async {
    var sp = await SharedPreferences.getInstance();

    sp.setString("user_name", user_name);
    print("username changed$user_name}");
  }
  @override
  void initState() {
    super.initState();
    getUser();
  }

  var tfUserNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPage.linen,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text("Kullanıcı Değiştir", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40, color: ColorPage.red_light),),
              ),
              Text("Şu anki kullanıcı: ${currentUser}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              TextField(controller: tfUserNameController, decoration: InputDecoration(hintText: "Kullanıcı adı"),),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: ElevatedButton(onPressed:  () async {
                  if(tfUserNameController.text != ""){
                    setState(() {
                      changeUser(tfUserNameController.text);
                      getUser();
                    });

                  }
                },
                  child: Text("Değiştir"),
                  style: ElevatedButton.styleFrom(primary: ColorPage.red_light),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
