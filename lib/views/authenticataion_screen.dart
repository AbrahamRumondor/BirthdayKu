import 'package:flutter/material.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 202, 183, 1),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
            flex: 4,
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
            flex: 6,
            child: Card(
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
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 50),
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
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Password'),
                          obscureText: true,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                Color.fromRGBO(204, 204, 204, 1),
                              ),
                              foregroundColor: MaterialStatePropertyAll<Color>(
                                Colors.white,
                              ),
                            ),
                            onPressed: () {},
                            child: const Text('Log In'),
                          ),
                        ),
                        const Center(
                          child: Text('Dont have an account? Register Here'),
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
