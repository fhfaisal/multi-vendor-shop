import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:multivendor_store/controller/auth_controller.dart';
import 'package:multivendor_store/views/buyers/auth/login_screen.dart';
import 'package:multivendor_store/views/buyers/auth/refactor_widgets.dart';
import 'package:multivendor_store/widget_setting/color_collections.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
late String email;
late String fullName;
late String phoneNumber;
late String password;
final AuthController _authController = AuthController();

_signUp(BuildContext context ) async {
  if (_formKey.currentState!.validate()) {
    EasyLoading.show();
    await _authController
        .signUpUser(email, fullName, password, phoneNumber)
        .whenComplete(() => {
              EasyLoading.dismiss(),
              _formKey.currentState!.reset(),
              successFlutterToast('User registration successful'),
            });

    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
  } else {
    errorFlutterToast('Please fill up all the fields');
    return;
  }
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Create an account',
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: textOrange),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: iconClr,
                    radius: 50,
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email must be filled';
                          } else if (!value.contains('@')) {
                            return 'Invalid email format';
                          }else if (!value.contains('.com')) {
                            return 'Invalid email format';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          email = value;
                        },
                        labelText: 'Email',
                        hintText: 'Enter your email',
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: textOrange,
                        ),
                      ),
                      CustomTextField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Name must be filled';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          fullName = value;
                        },
                        labelText: 'Full Name',
                        hintText: 'Enter your full name',
                        prefixIcon: Icon(
                          Icons.person_2_outlined,
                          color: textOrange,
                        ),
                      ),
                      CustomTextField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Phone number must be filled';
                          } else if (!value.startsWith('01')) {
                            return 'Phone number must start with 01';
                          } else if (value.length != 11) {
                            return 'Phone number must have exactly 11 digits';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          phoneNumber = value;
                        },
                        keyboardType: TextInputType.number,
                        labelText: 'Phone Number',
                        hintText: 'Enter your phone number',
                        prefixIcon: Icon(
                          Icons.phone_outlined,
                          color: textOrange,
                        ),
                      ),
                      CustomPasswordField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password must be filled';
                          } else if (value.length < 6) {
                            return 'Password must be at least 6 characters long';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          password = value;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: GestureDetector(
                          onTap: () {
                            _signUp(context);
                          },
                          child: Container(
                            width: MediaQuery.sizeOf(context).width - 150,
                            height: 50,
                            decoration: BoxDecoration(
                                color: iconClr,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: Center(
                              child: Text(
                                'Register',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: textWhite),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: textBlack),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ));
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: textOrange),
                              ))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
