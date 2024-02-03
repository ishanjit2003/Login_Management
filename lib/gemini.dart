import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' ;
import 'package:fluttertoast/fluttertoast.dart';

class login_management extends StatefulWidget {
  const login_management({super.key});

  @override
  State<login_management> createState() => _login_managementState();
}

class _login_managementState extends State<login_management> {

  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  login(String email,String password) async{
    try{
      Response response=await post(Uri.parse('https://reqres.in/api/register'),
      body: {
        'email':email,
        'password':password
      }

      );
      if(response.statusCode==200){
        var data=jsonDecode(response.body.toString());
        print('Account created successfully');
        print(data);
      }
      else{
        print('failed');
      }

    }
        catch(e){
      print(e.toString());
        }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('login_management'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText:'Email',
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText:'Password',
              ),
            ),
            SizedBox(height: 40,),
            GestureDetector(
              onTap: (){
                login(emailController.text.toString(),passwordController.text.toString());

                // var snackBar = SnackBar(content: Text('Hello, I am here'));
                // // Step 3
                // ScaffoldMessenger.of(context).showSnackBar(snackBar);

                Fluttertoast.showToast(
                  msg: "THE toast message",
                  toastLength: Toast.LENGTH_SHORT,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.pinkAccent,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child: Text('Sign Up')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
