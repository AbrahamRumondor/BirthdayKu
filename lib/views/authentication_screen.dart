import 'package:birthdayku/data/user_data.dart';
import 'package:birthdayku/views/register_screen.dart';
import 'package:birthdayku/views/tabs.dart';
import 'package:flutter/material.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({
    super.key,
    /*required this.getUserID*/
  });

  // final void Function(String userID) getUserID;

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final _form = GlobalKey<FormState>();

  var _enteredEmail = '';
  var _enteredPassword = '';

  void _submit() {
    final isValid = _form.currentState!.validate();

    if (isValid) {
      _form.currentState!.save();

      for (var user in allUser) {
        if (user.email.compareTo(_enteredEmail) == 0 &&
            user.password.compareTo(_enteredPassword) == 0) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (ctx) => TabsScreen(
                userID: user.id,
              ),
            ),
          );
        } else {
          const SnackBar(
            content: Text("account doesn't exist!"),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 202, 183, 1),
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
              child: Image.asset('assets/img/logo_login.png'),
            ),
          ),
          Expanded(
            flex: 7,
            child: Card(
              elevation: 0,
              color: Colors.white,
              margin: EdgeInsets.zero,
              shape: const ContinuousRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(125),
                  topRight: Radius.circular(125),
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Form(
                    key: _form,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 40),
                        const Text(
                            style: TextStyle(
                              color: Color.fromRGBO(128, 0, 32, 1),
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            'Welcome Back!'),
                        const SizedBox(height: 20),
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
                              return 'password must be 8 character minimum';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _enteredPassword = value!;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const SizedBox(
                          width: double.infinity,
                          child: Text(
                            textAlign: TextAlign.right,
                            'Forgot Password?',
                            style: TextStyle(
                              color: Color.fromRGBO(128, 0, 32, 1),
                              fontSize: 13,
                            ),
                          ),
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
                            child: const Text('Log In'),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                    text: 'Don\'t have an account? ',
                                    style: TextStyle(color: Colors.black87)),
                                WidgetSpan(
                                    child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (ctx) =>
                                            const RegisterScreen(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    "Register Here",
                                    style: TextStyle(
                                      color: Color.fromRGBO(128, 0, 32, 1),
                                    ),
                                  ),
                                ))
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
