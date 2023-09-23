import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var nameController =TextEditingController();
  var emailController =TextEditingController();
  var phoneController =TextEditingController();
  var passwordController =TextEditingController();
  final ImagePicker picker = ImagePicker();
   File? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
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
      
          //  MaterialButton(onPressed: (){},child: Text("LogIn"),color: Colors.deepPurple,)
            // ,MaterialButton(onPressed: (){
             
            // },child: Text("Create Account"),)
      
        ]),
      ),
    );
  }
}