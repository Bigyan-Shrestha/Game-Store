import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_neon/App%20Screens/register_screen.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF424242),
                Color(0xff9C27B0),
                Color(0xFF303030),
              ],
              stops: [0.05, 0.25, 0.7],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 35,
              ),
              //Image.asset(name),
              const SizedBox(
                height: 15,
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 200,
                  maxWidth: 200,
                ),
                child: Image.asset(
                  'assets/app_icon.png',
                ),
              ),

              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 480,
                width: 325,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Sign in into your Neon account.',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black38,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    const SizedBox(
                        height: 45,
                        width: 400,
                        child: TextField(
                          decoration: InputDecoration(
                              labelText: 'Email Address  *',
                              labelStyle: TextStyle(
                                color: Colors.black87,
                              ),
                              filled: true,
                              fillColor: Colors.black26,
                              suffixIcon: Icon(
                                FontAwesomeIcons.envelope,
                                size: 17,
                                color: Colors.black87,
                              )),
                        )),
                    const SizedBox(
                      height: 2,
                    ),
                    const SizedBox(
                        height: 45,
                        width: 400,
                        child: TextField(
                          decoration: InputDecoration(
                              labelText: 'Password  *',
                              labelStyle: TextStyle(
                                color: Colors.black87,
                              ),
                              filled: true,
                              fillColor: Colors.black26,
                              suffixIcon: Icon(
                                FontAwesomeIcons.eyeSlash,
                                size: 17,
                                color: Colors.black87,
                              )),
                        )),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(50, 1, 30, 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.purple[300],
                              ),
                              child: const Text('Forget Password?'),
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black38,
                          foregroundColor: Colors.white70,
                        ),
                        onPressed: () {},
                        child: const Text('Sign in to Neon'),
                      )
                    ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'New on Neon?',
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MyRegisterPage()),
                            );
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.purple[300],
                          ),
                          child: const Text('Register.'),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Or',
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Login Using.',
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black38,
                            foregroundColor: Colors.white70,
                          ),
                          onPressed: () {},
                          icon: const Icon(
                            FontAwesomeIcons.google,
                          ),
                          label: const Text('Sign in with Google'),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black38,
                            foregroundColor: Colors.white70,
                          ),
                          onPressed: () {},
                          icon: const Icon(
                            FontAwesomeIcons.facebook,
                          ),
                          label: const Text('Sign in with Facebook'),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
