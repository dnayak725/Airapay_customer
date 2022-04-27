// // ignore_for_file: prefer_const_constructors

// import 'package:aira_pay/Auth/Screens/create_password.dart';
// import 'package:aira_pay/config.dart';
// import 'package:flutter/material.dart';
// import 'package:heroicons/heroicons.dart';

// class CompleteRegister extends StatefulWidget {
//   const CompleteRegister({Key? key}) : super(key: key);

//   @override
//   State<CompleteRegister> createState() => _CompleteRegisterState();
// }

// class _CompleteRegisterState extends State<CompleteRegister> {
//   @override
//   final _nameController = TextEditingController();
//   final _myKadController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _confirmPassController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final formGlobalKey = GlobalKey<FormState>();
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: PreferredSize(
//           preferredSize: Size.fromHeight(100.0),
//           child: Padding(
//             padding: const EdgeInsets.only(top: 20),
//             child: AppBar(
//               backgroundColor: Color(page_color),
//               elevation: 0,
//               leading: IconButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 icon: HeroIcon(
//                   HeroIcons.arrowNarrowLeft,
//                   color: Color(primary_color),
//                 ),
//               ),
//               title: Text(
//                 'Complete registration',
//                 style: TextStyle(
//                     color: Color(primary_text),
//                     fontSize: 20,
//                     fontWeight: FontWeight.w800),
//               ),
//             ),
//           ),
//         ),
//         backgroundColor: Color(page_color),
//         body: Padding(
//           padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
//           child: Form(
//             key: formGlobalKey,
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   TextFormField(
//                     controller: _nameController,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'plese enter  Full Name';
//                       }

//                       return null;
//                     },
//                     style: TextStyle(
//                         color: Colors.black, fontWeight: FontWeight.w700),
//                     decoration: InputDecoration(
//                         labelText: 'Full Name (as per your MyKad)',
//                         hintText: 'Enter your full name as per your MyKad',
//                         hintStyle: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500,
//                         )),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   TextFormField(
//                     controller: _myKadController,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'plese enter myKad';
//                       }

//                       return null;
//                     },
//                     style: TextStyle(
//                         color: Colors.black, fontWeight: FontWeight.w700),
//                     keyboardType: TextInputType.phone,
//                     decoration: InputDecoration(
//                         labelText: 'myKad No.',
//                         hintText: 'Enter your MyKad number',
//                         hintStyle: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500,
//                         )),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   TextFormField(
//                     controller: _emailController,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'plese enter email';
//                       } else if (!value.contains("@")) {
//                         return "please enter valid email";
//                       }
//                       return null;
//                     },
//                     style: TextStyle(
//                         color: Colors.black, fontWeight: FontWeight.w700),
//                     decoration: InputDecoration(
//                         labelText: 'Email Address',
//                         hintText: 'Enter your email address'),
//                   ),
//                   Align(
//                     alignment: Alignment.topLeft,
//                     child: Text(
//                       'This helps us to spending limit.',
//                       style:
//                           TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   TextFormField(
//                     controller: _passwordController,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'plese enter Password';
//                       } else if (value.length < 2) {
//                         return 'password must be at least 2 characters';
//                       }
//                       return null;
//                     },
//                     style: TextStyle(
//                         color: Colors.black, fontWeight: FontWeight.w700),
//                     decoration: InputDecoration(
//                       labelText: 'Password',
//                       hintText: 'Enter your password',
//                       suffixIcon: Icon(Icons.lock),
//                     ),
//                   ),
//                   Align(
//                     alignment: Alignment.topRight,
//                     child: Text(
//                       'Pretty Good',
//                       style: TextStyle(
//                           color: Colors.green, fontWeight: FontWeight.w700),
//                     ),
//                   ),
//                   TextFormField(
//                     controller: _confirmPassController,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'plese enter Confirm Password';
//                       } else if (value != _passwordController.text) {
//                         return 'Password not match';
//                       }
//                       return null;
//                     },
//                     style: TextStyle(
//                         color: Colors.black, fontWeight: FontWeight.w700),
//                     decoration: InputDecoration(
//                         labelText: 'Confirm Password',
//                         hintText: 'Confirm your password'),
//                   ),
//                   Column(
//                     children: [
//                       Row(
//                         children: [
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Checkbox(
//                             checkColor: Colors.greenAccent,
//                             activeColor: Colors.red,
//                             onChanged: (bool? value) {},
//                             value: false,
//                           ),
//                           SizedBox(
//                             height: 60,
//                           ),
//                           Text('I have read and agree to the'),
//                         ],
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     height: 56,
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                           primary: Color(primary_color),
//                           elevation: 2,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(35),
//                           )),
//                       onPressed: () {
//                         if (formGlobalKey.currentState!.validate()) {
//                           // Navigator.push(
//                           //     context,
//                           //     MaterialPageRoute(
//                           //         builder: (context) =>
//                           //             const CreatePassword()));
//                         }
//                       },
//                       child: Text(
//                         "Next",
//                         style: TextStyle(fontSize: 17),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ));
//   }
// }
