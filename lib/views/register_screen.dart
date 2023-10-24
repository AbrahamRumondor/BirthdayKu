import 'package:birthdayku/views/authentication_screen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    super.key,
  });

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var _enteredPassword = '';
  var _enteredEmail = '';
  var _enteredName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
            flex: 3,
            child: Container(
              margin: const EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              width: 150,
              child: Image.asset('assets/img/logo_signup.png'),
            ),
          ),
          Expanded(
            flex: 7,
            child: Card(
              elevation: 0,
              color: Colors.transparent,
              margin: EdgeInsets.zero,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 40,
                    bottom: 40,
                    right: 40,
                    top: 0,
                  ),
                  child: Form(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            'Create Account'),
                        const SizedBox(
                          height: 30,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                  text: 'Already a member? ',
                                  style: TextStyle(color: Colors.black87)),
                              WidgetSpan(
                                  child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (ctx) =>
                                          const AuthenticationScreen(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  "Login Here",
                                  style: TextStyle(
                                    color: Color.fromRGBO(128, 0, 32, 1),
                                  ),
                                ),
                              ))
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          decoration: const InputDecoration(labelText: 'Name'),
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          textCapitalization: TextCapitalization.none,
                          // validator: (value) {
                          //   if (value == null || !value.contains('@')) {
                          //     return 'please enter a valid name';
                          //   }
                          //   return null;
                          // },
                          onSaved: (value) {},
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'Email or phone number'),
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          textCapitalization: TextCapitalization.none,
                          validator: (value) {
                            if (value == null || !value.contains('@')) {
                              return 'please enter a valid email address';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _enteredEmail = value!;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Password'),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || !(value.length >= 8)) {
                              return 'please enter a valid password which has to be 8 characters minimum';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _enteredPassword = value!;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'Confirm Password'),
                          obscureText: true,
                          validator: (value) {
                            if (value == null ||
                                !(value.length >= 8) ||
                                value.compareTo(_enteredPassword) != 0) {
                              return 'password you entered wrong';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  const MaterialStatePropertyAll<Color>(
                                Color.fromRGBO(204, 204, 204, 1),
                              ),
                              foregroundColor:
                                  const MaterialStatePropertyAll<Color>(
                                Colors.white,
                              ),
                              shape: MaterialStatePropertyAll<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text('Create Account'),
                          ),
                        ),
                        Center(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      'By signing up to create  an account I accept BirthdayKu\'s ',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 11,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Terms of Use ',
                                  style: TextStyle(
                                    color: Color.fromRGBO(128, 0, 32, 1),
                                    fontSize: 11,
                                  ),
                                ),
                                TextSpan(
                                    text: 'and ',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 11,
                                    )),
                                TextSpan(
                                  text: 'Privacy Policy',
                                  style: TextStyle(
                                    color: Color.fromRGBO(128, 0, 32, 1),
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
