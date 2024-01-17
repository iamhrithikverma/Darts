// RegistrationFormDialog.dart

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'RegistrationPage.dart';

class RegistrationFormDialog extends StatelessWidget {
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  RegistrationFormDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2),
      ),
      elevation: 1,
      backgroundColor: Colors.white,
      child: contentBox(context),
    );
  }

  Widget contentBox(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Register Mobile',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          SizedBox(height: 4),
          Text(
            'Mobile Number',
            style: TextStyle(fontSize: 14, color: Colors.blue),
          ),
          TextFormField(
            controller: _mobileController,
            decoration: InputDecoration(
              hintText: 'Mobile Number',
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.all(10),
            ),
            keyboardType: TextInputType.number,
            maxLength: 10,
          ),
          SizedBox(height: 2),
          Text(
            'Password',
            style: TextStyle(fontSize: 14, color: Colors.blue),
          ),
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.all(10),
            ),
          ),
          SizedBox(height: 4),
          Align(
            alignment: Alignment.center,
            // child: ElevatedButton(
            //   onPressed: () {},
            //   style: ElevatedButton.styleFrom(
            //     primary: Color(0xff01c6de),
            //     onPrimary: Colors.white,
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(4.0),
            //     ),
            //     fixedSize: Size(350, 35),
            //   ),
            child: ElevatedButton(
              onPressed: () {
                // here we are Navigating to the RegistrationForm page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegistrationForm()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xff01c6de),
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                fixedSize: Size(350, 35),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('NEXT'),
              ),
            ),
            ),
          ],
      ),
    );
  }
}






















// import 'package:flutter/material.dart';
//
// class RegistrationActivity extends StatefulWidget {
//   @override
//   _RegistrationActivityState createState() => _RegistrationActivityState();
// }
//
// class _RegistrationActivityState extends State<RegistrationActivity> {
//   AlertDialog? _alertDialog;
//   late TextEditingController _emailController;
//   late TextEditingController _mobileController;
//   late TextEditingController _nameController;
//   late TextEditingController _otpController;
//   late TextEditingController _passwordController;
//   late TextEditingController _reenterPasswordController;
//   String _gender = '';
//   bool _finished = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _emailController = TextEditingController();
//     _mobileController = TextEditingController();
//     _nameController = TextEditingController();
//     _otpController = TextEditingController();
//     _passwordController = TextEditingController();
//     _reenterPasswordController = TextEditingController();
//   }
//
//   @override
//   void dispose() {
//     _emailController.dispose();
//     _mobileController.dispose();
//     _nameController.dispose();
//     _otpController.dispose();
//     _passwordController.dispose();
//     _reenterPasswordController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Device Registration'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextField(
//               controller: _nameController,
//               decoration: InputDecoration(labelText: 'Full Name'),
//             ),
//             TextField(
//               controller: _mobileController,
//               decoration: InputDecoration(labelText: 'Mobile Number'),
//             ),
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(labelText: 'Email ID'),
//             ),
//             TextField(
//               controller: _passwordController,
//               obscureText: true,
//               decoration: InputDecoration(labelText: 'Password'),
//             ),
//             TextField(
//               controller: _reenterPasswordController,
//               obscureText: true,
//               decoration: InputDecoration(labelText: 'Re-enter Password'),
//             ),
//             TextField(
//               controller: _otpController,
//               decoration: InputDecoration(labelText: 'OTP'),
//             ),
//             Text(
//               'I am',
//               style: TextStyle(color: Colors.blue, fontSize: 14.0),
//             ),
//             Row(
//               children: [
//                 Radio(
//                   value: 'Male',
//                   groupValue: _gender,
//                   onChanged: (value) {
//                     setState(() {
//                       _gender = value.toString();
//                     });
//                   },
//                 ),
//                 Text('Male'),
//               ],
//             ),
//             Row(
//               children: [
//                 Radio(
//                   value: 'Female',
//                   groupValue: _gender,
//                   onChanged: (value) {
//                     setState(() {
//                       _gender = value.toString();
//                     });
//                   },
//                 ),
//                 Text('Female'),
//               ],
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 _sendOTP();
//               },
//               child: Text('Send OTP'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 _submitForm();
//               },
//               child: Text('Register Mobile'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _sendOTP() {
//     String email = _emailController.text;
//     if (email.isEmpty) {
//       _showSnackbar('Please enter email ID');
//       return;
//     }
//
//     // Make API call to send OTP (similar to the original Java code)
//
//     // Assuming API call is successful, show OTP input field and submit button
//     setState(() {
//       // Update the UI based on API response
//     });
//   }
//
//   void _submitForm() {
//     // Implement the logic to submit the registration form (similar to the original Java code)
//   }
//
//   void _showSnackbar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: RegistrationActivity(),
//   ));
// }



// -------------------------------------------------------------------------------------------------------------------------------------------------

// main.dart

import 'package:flutter/material.dart';
import 'package:jalnigam/ui/RegistrationPage.dart';
import 'package:jalnigam/ui/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Name',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      routes: {
        '/registration': (context) => RegistrationPage(),
      },
    );
  }
}


// --------------------------------------------------------------------------------------------------------



// Registration Page

// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: RegistrationPage(),
//     );
//   }
// }
//
class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0xff01c6de),
        title: Text('Registration'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: RegistrationForm(),
        ),
      ),
    );
  }
}

// class RegistrationForm extends StatefulWidget {
//   @override
//   _RegistrationFormState createState() => _RegistrationFormState();
// }
//
// class _RegistrationFormState extends State<RegistrationForm> {
//   final _mobileController = TextEditingController();
//   final _nameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _otpController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _reenterPasswordController = TextEditingController();
//
//   String gender = ''; // Variable to track the selected gender
//  @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'Mobile Number',
//           style: TextStyle(
//             color: Colors.blue,
//             fontSize: 14.0,
//           ),
//         ),
//         TextFormField(
//           controller: TextEditingController(),
//           decoration: InputDecoration(
//             hintText: 'Mobile Number',
//             enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.blue),
//             ),
//           ),
//           keyboardType: TextInputType.number,
//         ),
//
//         Text(
//           'District',
//           style: TextStyle(
//             color: Colors.blue,
//             fontSize: 14.0,
//           ),
//         ),
//         // Include the District widget here
//         TextFormField(
//           controller: TextEditingController(),
//           decoration: InputDecoration(
//             hintText: 'District',
//             enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.blue),
//             ),
//           ),
//           keyboardType: TextInputType.text,
//         ),
//         Text(
//           'Designation',
//           style: TextStyle(
//             color: Colors.blue,
//             fontSize: 14.0,
//           ),
//         ),
//         // Include the Designation widget here
//         TextFormField(
//           controller: TextEditingController(),
//           decoration: InputDecoration(
//             hintText: 'Designation',
//             enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.blue),
//             ),
//           ),
//           keyboardType: TextInputType.text,
//         ),
//         Text(
//           'Full Name',
//           style: TextStyle(
//             color: Colors.blue,
//             fontSize: 14.0,
//           ),
//         ),
//         TextFormField(
//           controller: TextEditingController(),
//           decoration: InputDecoration(
//             hintText: 'Full Name',
//             enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.blue),
//             ),
//           ),
//           keyboardType: TextInputType.text,
//         ),
//
//         Row(
//           children: [
//             Text(
//               'Email ID',
//               style: TextStyle(
//                 color: Colors.blue,
//                 fontSize: 14.0,
//               ),
//             ),
//             Spacer(),
//             ElevatedButton(
//               onPressed: () {
//                 // Handle button click
//               },
//               child: Text('Send OTP'),
//             ),
//           ],
//         ),
//         TextFormField(
//           controller: TextEditingController(),
//           decoration: InputDecoration(
//             hintText: 'Email ID',
//             enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.blue),
//             ),
//           ),
//           keyboardType: TextInputType.emailAddress,
//         ),
//
//         Text(
//           'OTP',
//           style: TextStyle(
//             color: Colors.blue,
//             fontSize: 14.0,
//           ),
//         ),
//         TextFormField(
//           controller: TextEditingController(),
//           decoration: InputDecoration(
//             hintText: 'OTP',
//             enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.blue),
//             ),
//           ),
//           keyboardType: TextInputType.text,
//         ),
//
//         Text(
//           'Password',
//           style: TextStyle(
//             color: Colors.blue,
//             fontSize: 14.0,
//           ),
//         ),
//         TextFormField(
//           controller: TextEditingController(),
//           decoration: InputDecoration(
//             hintText: 'Password',
//             enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.blue),
//             ),
//           ),
//           obscureText: true,
//         ),
//
//         Text(
//           'Re-enter Password',
//           style: TextStyle(
//             color: Colors.blue,
//             fontSize: 14.0,
//           ),
//         ),
//         TextFormField(
//           controller: TextEditingController(),
//           decoration: InputDecoration(
//             hintText: 'Re-enter Password',
//             enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.blue),
//             ),
//           ),
//           obscureText: true,
//         ),
//
//         Row(
//           children: [
//             Text(
//               'I am',
//               style: TextStyle(
//                 color: Colors.blue,
//                 fontSize: 14.0,
//               ),
//             ),
//             SizedBox(width: 10.0), // Adjust the spacing between "I am" and radio buttons
//             Row(
//               children: [
//                 Radio(
//                   value: 'Male',
//                   groupValue: gender,
//                   onChanged: (value) {
//                     setState(() {
//                       gender = value!;
//                     });
//                   },
//                 ),
//                 Text('Male'),
//               ],
//             ),
//             SizedBox(width: 10.0), // Adjust the spacing between Male and Female
//             Row(
//               children: [
//                 Radio(
//                   value: 'Female',
//                   groupValue: gender,
//                   onChanged: (value) {
//                     setState(() {
//                       gender = value!;
//                     });
//                   },
//                 ),
//                 Text('Female'),
//               ],
//             ),
//           ],
//         ),
//
//         SizedBox(height: 20.0),
//         ElevatedButton(
//           onPressed: () {
//             // Handle registration button click
//           },
//           child: Text('Register Mobile'),
//         ),
//       ],
//     );
//   }
// }



//--------------------------------------------------------------------------------------------------------

// import 'package:flutter/material.dart';

// class RegistrationFormDialog extends StatelessWidget {
//   final TextEditingController _mobileController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//
//   RegistrationFormDialog({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(2),
//       ),
//       elevation: 1,
//       backgroundColor: Colors.white,
//       child: contentBox(context),
//     );
//   }
//
//   Widget contentBox(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(15.0),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Register Mobile',
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
//           ),
//           SizedBox(height: 4),
//           Text(
//             'Mobile Number',
//             style: TextStyle(fontSize: 14, color: Colors.blue),
//           ),
//           TextFormField(
//             controller: _mobileController,
//             decoration: InputDecoration(
//               hintText: 'Mobile Number',
//               border: OutlineInputBorder(),
//               contentPadding: EdgeInsets.all(10),
//             ),
//             keyboardType: TextInputType.number,
//             maxLength: 10,
//           ),
//           SizedBox(height: 2),
//           Text(
//             'Password',
//             style: TextStyle(fontSize: 14, color: Colors.blue),
//           ),
//           TextFormField(
//             controller: _passwordController,
//             obscureText: true,
//             decoration: InputDecoration(
//               hintText: 'Password',
//               border: OutlineInputBorder(),
//               contentPadding: EdgeInsets.all(10),
//             ),
//           ),
//           SizedBox(height: 4),
//           Align(
//             alignment: Alignment.center,
//             child: ElevatedButton(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(
//                 primary: Color(0xff01c6de),
//                 onPrimary: Colors.white,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(4.0),
//                 ),
//                 fixedSize: Size(350, 35),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text('NEXT'),
//               ),
//             ),
//           ),],
//       ),
//     );
//   }
// }
// ...........................................
// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       body: Builder(
//         builder: (BuildContext context) => Center(
//           child: RegistrationFormDialog(),
//               )
//           ),
//         ),
//       ),
//   );
// }


// ----------------------------------------------------------------------------------------------------------------------------------------------------------------

// SplashScreen.dart

// Import necessary packages
import 'dart:async';
import 'package:flutter/material.dart';
import 'RegistrationFormDialog.dart';
import 'numberinputdialog.dart';
import 'registrationpage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context; // Capture the context during build

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.blue],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/jalnigam.png',
                width: 200,
                height: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      showDialog(
        context: _context,
        builder: (BuildContext context) {
          return RegistrationFormDialog();
        },
      );
    });
  }
}
//   Future<void> showNumberInputDialog() async {
//     String? phoneNumber = await showDialog<String>(
//       context: _context,
//       builder: (BuildContext context) {
//         return Dialog(
//           child: NumberInputDialog(),
//         );
//       },
//     );
//
//     if (phoneNumber != null && phoneNumber.isNotEmpty) {
//       // TODO: Add your API call to check the user existence
//       // You can use the 'phoneNumber' variable to get the entered number
//
//       // For now, we'll just print the entered number
//       print('Entered Number: $phoneNumber');
//     }
//
//     // After clicking "Next" on the dialog, navigate to the registration page
//     Navigator.pushReplacement(
//       _context,
//       MaterialPageRoute(builder: (context) => RegistrationPageWithDialog()),
//     );
//   }
// }
//
// // Create a modified RegistrationPage with dialog
// class RegistrationPageWithDialog extends StatelessWidget {
//   const RegistrationPageWithDialog({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Registration Page'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               'Welcome to Registration!',
//               style: TextStyle(fontSize: 20),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Add navigation logic or other actions here
//               },
//               child: const Text('Continue'),
//             ),
//             // Add your dialog widget here (if needed)
//           ],
//         ),
//       ),
//     );
//   }
// }


// -----------------------------------------------------------------------------------------------------------------------------------

// RegistrationPage.dart

import 'package:flutter/material.dart';

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _mobileController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _otpController = TextEditingController();
  final _passwordController = TextEditingController();
  final _reenterPasswordController = TextEditingController();

  String gender = ''; // Variable to track the selected gender
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Mobile Number',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 14.0,
          ),
        ),
        TextFormField(
          controller: TextEditingController(),
          decoration: InputDecoration(
            hintText: 'Mobile Number',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
          ),
          keyboardType: TextInputType.number,
        ),

        Text(
          'District',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 14.0,
          ),
        ),
        // Include the District widget here
        TextFormField(
          controller: TextEditingController(),
          decoration: InputDecoration(
            hintText: 'District',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
          ),
          keyboardType: TextInputType.text,
        ),
        Text(
          'Designation',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 14.0,
          ),
        ),
        // Include the Designation widget here
        TextFormField(
          controller: TextEditingController(),
          decoration: InputDecoration(
            hintText: 'Designation',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
          ),
          keyboardType: TextInputType.text,
        ),
        Text(
          'Full Name',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 14.0,
          ),
        ),
        TextFormField(
          controller: TextEditingController(),
          decoration: InputDecoration(
            hintText: 'Full Name',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
          ),
          keyboardType: TextInputType.text,
        ),

        Row(
          children: [
            Text(
              'Email ID',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 14.0,
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Handle button click
              },
              child: Text('Send OTP'),
            ),
          ],
        ),
        TextFormField(
          controller: TextEditingController(),
          decoration: InputDecoration(
            hintText: 'Email ID',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
          ),
          keyboardType: TextInputType.emailAddress,
        ),

        Text(
          'OTP',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 14.0,
          ),
        ),
        TextFormField(
          controller: TextEditingController(),
          decoration: InputDecoration(
            hintText: 'OTP',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
          ),
          keyboardType: TextInputType.text,
        ),

        Text(
          'Password',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 14.0,
          ),
        ),
        TextFormField(
          controller: TextEditingController(),
          decoration: InputDecoration(
            hintText: 'Password',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
          ),
          obscureText: true,
        ),

        Text(
          'Re-enter Password',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 14.0,
          ),
        ),
        TextFormField(
          controller: TextEditingController(),
          decoration: InputDecoration(
            hintText: 'Re-enter Password',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
          ),
          obscureText: true,
        ),

        Row(
          children: [
            Text(
              'I am',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 14.0,
              ),
            ),
            SizedBox(width: 10.0), // Adjust the spacing between "I am" and radio buttons
            Row(
              children: [
                Radio(
                  value: 'Male',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value!;
                    });
                  },
                ),
                Text('Male'),
              ],
            ),
            SizedBox(width: 10.0), // Adjust the spacing between Male and Female
            Row(
              children: [
                Radio(
                  value: 'Female',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value!;
                    });
                  },
                ),
                Text('Female'),
              ],
            ),
          ],
        ),

        SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () {
            // Handle registration button click
          },
          child: Text('Register Mobile'),
        ),
      ],
    );
  }
}

// --------------------------------------------------------------------------------

// import 'package:flutter/material.dart';
//
// class RegistrationPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Registration Page'),
//         backgroundColor: Color(0xff01c6de),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Welcome to Registration!',
//               style: TextStyle(fontSize: 20),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Add navigation logic or other actions here
//               },
//               child: Text('Continue'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
