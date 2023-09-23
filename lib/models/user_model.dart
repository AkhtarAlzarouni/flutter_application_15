class UserMoudel{
  String? name;
  String? email;
  String? password;
  String? phone;
  String? image;



  UserMoudel({this.name,this.email,this.password,this.phone,this.image});
  
  Map<String,dynamic> toMap(){
    return{
      "name":name,
      "email":email,
      "passwprd":password,
      "phone":phone,
      "image":image
    };
  }

}