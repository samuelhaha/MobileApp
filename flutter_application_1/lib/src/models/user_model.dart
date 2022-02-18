// import 'package:meta/meta.dart';

// class User{
//   final String username;
//   final String firstName;
//   final String lastName;
//   final String email;
//   final String phoneNumber;
//   final String userType;

//   User({
//     this.username,
//     this.firstName,
//     this.lastName,
//     this.email,
//     this.phoneNumber,
//     this.userType,
//   });
// }

import 'package:meta/meta.dart';

class User{
  final String uid;
  final String username;
  final String email;
  // final String password;
  // final String confirmpassword;
  // final String phoneNumber;
  // final String userType;

  User({
    this.uid,
    this.username,
    this.email,
    // this.password,
    // this.confirmpassword,
    // this.phoneNumber,
    // this.userType,
  });

  //data from server
  factory User.fromMap(map){
    return User(
      uid: map['uid'],
      username: map['username'],
      email: map['email'],
      // password: map['password'],
      // confirmpassword: map['confirmpassword'],
    );
  }

  //sending data to the server
  Map<String, dynamic> toMap(){
    return{
      'uid':uid,
      'username':username,
      'email':email,
      // 'password':password,
      // 'confirmpassword':confirmpassword,
    };
  }


}