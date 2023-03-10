import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:verify_otp/verify_controller/verify_api_service.dart';

import 'model/auth_verify.dart';

class Verify extends StatefulWidget {
  const Verify({Key? key}) : super(key: key);

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  final TextEditingController _verifyId = TextEditingController();
  final TextEditingController _otpVerify = TextEditingController();
  Auth_veridy? auth_veridy;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 150),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 60),
                  child: Text(
                    "We have sent a verification code to 01XXXXXXXXX Put the OTP to verify.",
                    style: TextStyle(color: Color(0xFF192855), fontSize: 15),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _verifyId,
                  decoration: InputDecoration(hintText: "Id"),

                ),SizedBox(height: 20,),
                TextField(
                  controller: _otpVerify,
                  decoration: InputDecoration(hintText: "otpcode"),
                ),

                SizedBox(
                  height: 20,
                ),

                ElevatedButton(
                    onPressed: () async {
                      auth_veridy = await VerifyService.verifyMethod(
                        _verifyId.text,
                        _otpVerify.text,
                      );
                      setState(() {});
                    },
                    child: Text("Verify")),
                SizedBox(
                  height: 20,
                ),
                auth_veridy == null
                    ? CircularProgressIndicator()
                    : Text("message is : ${auth_veridy!.status}"),
                // TextButton(
                //   onPressed: (){
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (c) =>  ResetPassword()));
                //   },

                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
