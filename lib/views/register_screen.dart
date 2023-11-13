import 'package:birthdayku/data/user_data.dart';
import 'package:birthdayku/models/user_model.dart';
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
  final _form = GlobalKey<FormState>();

  var _enteredPassword = '';
  var _enteredEmail = '';
  var _enteredName = '';
  var _confirmPass = '';

  void _submit() {
    final isValid = _form.currentState!.validate();

    if (isValid) {
      _form.currentState!.save();

      if (_enteredPassword.compareTo(_confirmPass) == 0) {
        allUser.add(User(
            id: "u${allUser.length}",
            name: _enteredName,
            email: _enteredEmail,
            password: _enteredPassword));

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => const AuthenticationScreen(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("password you entered wrong"),
        ));
      }
    }
  }

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
                    key: _form,
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
                          validator: (value) {
                            if (value == null) {
                              return 'please enter a valid name';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _enteredName = value!;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(labelText: 'Email'),
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
                            if (value == null || !(value.length >= 8)) {
                              return 'password you entered wrong';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _confirmPass = value!;
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
                            onPressed: _submit,
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
