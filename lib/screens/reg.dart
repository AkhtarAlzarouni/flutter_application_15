import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_15/models/user_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var nameController =TextEditingController();
  var emailController =TextEditingController();
  var phoneController =TextEditingController();
  var passwordController =TextEditingController();
  final ImagePicker picker = ImagePicker();

  SharedPreferences? prefs;

  void initState() {
    _getData();
    super.initState();
  }

  _getData() async{
   prefs = await SharedPreferences.getInstance();
  }
  
   File? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Account"),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(children: [
        
        image == null ?  InkWell(
            onTap: () async{
              final XFile? file = await picker.pickImage(source: ImageSource.gallery);
              image=File(file!.path);
              setState(() {
                
              });
            },
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(75),color:Colors.white ),
              child: Icon(Icons.camera_alt,color: Colors.purple,),
            ),
          )
             : CircleAvatar(
           radius: 75,
           backgroundImage: FileImage(image!),
          ),
         Container(
            margin: EdgeInsets.all(20),
            child: TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText:"name"),
            )),
          Container(
            margin: EdgeInsets.all(20),
            child: TextFormField(
              controller: emailController,
              decoration: InputDecoration(labelText:"Email"),
            )),
            Container(
            margin: EdgeInsets.all(20),
            child: TextFormField(
              controller: phoneController,
              decoration: InputDecoration(labelText:"phone"),
            )),
             Container(
            margin: EdgeInsets.all(20),
            child: TextFormField(
              controller: passwordController,
              decoration: InputDecoration(labelText:"password"),
            )),
      
            //MaterialButton(onPressed: (){},child: Text("LogIn"),color: Colors.deepPurple,)
            MaterialButton(onPressed: (){
              UserMoudel user =UserMoudel(
                name: nameController.text,
                email: emailController.text,
                password: passwordController.text,
                phone: phoneController.text,
                image: image!.path,
              );
              if (prefs!.containsKey(emailController.text)) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Email is exist")));
              }else{
                 prefs!.setString(emailController.text, jsonEncode(user.toMap())).then((value) => Navigator.pop(context));
              }

             
            },child: Text("Create Account"),)
      
        ]),
      ),
    );
  }
}