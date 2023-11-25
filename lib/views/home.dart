import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../designs/appbar.dart';
import '../designs/button.dart';
import '../designs/inputt.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final inputController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Stack(
        children: [
          Image.asset(
            "assets/background/background.png",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Column(
                children: [
                  const AppbarDesign(),
                  Form(
                    key: _formKey,
                    child: Input(
                      controller: inputController,
                    ),
                  ),
                  Button(
                    text: "Message Number",
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        if (inputController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "This Field is Required!!",
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.red,
                            ),
                          );
                        } else {
                          launchUrlString(
                            "https://wa.me/+20${inputController.text}",
                          );
                        }
                      }
                    },
                    inputController: inputController,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
