import 'package:flutter/material.dart';
import 'package:flutter_application_15/screens/home.dart';
import 'package:flutter_application_15/screens/reg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController =TextEditingController();
  var passwordController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Column(children: [
        Container(
          margin: EdgeInsets.all(20),
          child: TextFormField(
            controller: emailController,
            decoration: InputDecoration(labelText:"Email"),
          )),
           Container(
          margin: EdgeInsets.all(20),
          child: TextFormField(
            controller: passwordController,
            decoration: InputDecoration(labelText:"password"),
          )),

          MaterialButton(onPressed: (){
           Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
          },child: Text("LogIn"),color: Colors.deepPurple,)
          ,MaterialButton(onPressed: (){
             Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen(),));
          },child: Text("Create Account"),)

      ]),
    );
  }
}