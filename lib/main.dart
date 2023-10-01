import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:datepicker_dropdown/datepicker_dropdown.dart';


Future<void> main()
  async {
    WidgetsFlutterBinding.ensureInitialized();
    if (!kIsWeb && Platform.isWindows)
      await DesktopWindow.setMinWindowSize(const Size(550, 650));;

    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.red[300]
      ),
      home: LoginPage(),
    )
    ); //My App

  }



class MyRegisterPage extends StatefulWidget {
  const MyRegisterPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyRegisterPage> createState() => RegisterPage();
}

class RegisterPage extends State<MyRegisterPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidate = AutovalidateMode.disabled;
  int _selectedDay = 14;
  int _selectedMonth = 10;
  int _selectedYear = 1993;


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
                  colors:
                  [
                    Color(0xFF424242),
                    Color(0xff9C27B0),
                    Color(0xFF303030),
                  ],
                  stops:
                  [
                    0.05,0.25,0.7
                  ],
              ),
            ),

            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              const SizedBox(height:35,),
                //Image.asset(name),
              const SizedBox(height: 15,),
              const Text
                ('Neon',
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: 40,
                  ),
                ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(100, 1, 20, 10),
                child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Text(  'A Gamers Paradise',
                          style: TextStyle(color: Colors.purple[300],
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize :10
                          ),
                      ),
                    ],
                  ),
              ),
              const SizedBox(height: 30,),
              Container(
                height: 480,
                width: 325,
                child:

                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:
                    [
                   const SizedBox (height: 20,),
                   const Text
                      ('Sign in into your Neon account.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black38,
                          fontWeight:FontWeight.bold,
                          fontStyle: FontStyle.italic
                        ),
                    ),
                     const SizedBox(height: 30,),
                     Container(
                          height: 45,
                          width:400,
                          child: TextField(
                            decoration: InputDecoration(labelText: 'Display Name  *',filled:true,fillColor:Colors.black26),
                          )
                      ),
                    SizedBox(height:2,),
                    Row(
                      children: [
                        Flexible(
                          child: TextField(
                            decoration: InputDecoration(labelText: '  First Name  *',filled:true,fillColor:Colors.black26,suffixIcon: Icon(FontAwesomeIcons.envelope,size:17),contentPadding: EdgeInsets.all(1)),
                          ),
                        ),
                        SizedBox(width:5,),
                        Flexible(
                          child: TextField(
                            decoration: InputDecoration(labelText: '  Last Name  *',filled:true,fillColor:Colors.black26,suffixIcon: Icon(FontAwesomeIcons.envelope,size:17),contentPadding: EdgeInsets.all(1)),
                          ),
                        ),

                      ]
                    ),
                      SizedBox(height:2,),
                      Container(
                          height: 45,
                          width:400,
                          child: TextField(
                            decoration: InputDecoration(labelText: 'Country  *',filled:true,fillColor:Colors.black26,suffixIcon: Icon(FontAwesomeIcons.eyeSlash,size:17)),
                          )
                      ),
                      SizedBox(height:2,),
                      Container(
                          height: 45,
                          width:400,
                          child: TextField(
                            decoration: InputDecoration(labelText: 'Email Address  *',filled:true,fillColor:Colors.black26,suffixIcon: Icon(FontAwesomeIcons.eyeSlash,size:17)),
                          )
                      ),
                      SizedBox(height:2,),
                      Container(
                          height: 45,
                          width:400,
                          child: TextField(
                            decoration: InputDecoration(labelText: 'Password  *',filled:true,fillColor:Colors.black26,suffixIcon: Icon(FontAwesomeIcons.eyeSlash,size:17)),
                          )
                      ),



                      SizedBox(height: 2,),

                      Form(
                        key: formKey,
                        autovalidateMode: _autovalidate,

                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              DropdownDatePicker(
                                locale: "en",
                                 inputDecoration: InputDecoration(

                                    filled:true,
                                    fillColor:Colors.black26,

                                     contentPadding: EdgeInsets.all(1),

                                   ), // optional
                                isDropdownHideUnderline: true, // optional
                                isFormValidator: true, // optional
                                startYear: 1900, // optional
                                endYear: 2020, // optional
                                width: 0.5, // optional
                                selectedDay: _selectedDay, // optional
                                selectedMonth: _selectedMonth, // optional
                                selectedYear: _selectedYear, // optional
                                boxDecoration: BoxDecoration(
                                  border: Border.all(color: Colors.black26, width:0.5),

                                ),
                                hintTextStyle: const TextStyle(color: Colors.black38),
                                onChangedDay: (value) {
                                  _selectedDay = int.parse(value!);
                                  print('onChangedDay: $value');
                                },
                                onChangedMonth: (value) {
                                  _selectedMonth = int.parse(value!);
                                  print('onChangedMonth: $value');
                                },
                                onChangedYear: (value) {
                                  _selectedYear = int.parse(value!);
                                  print('onChangedYear: $value');
                                },
                              ),

                            ],
                          ),
                        )
                      ),

                      SizedBox(height: 1,),
                      CheckboxListTile(
                        activeColor: Colors.black54,
                        title: Text('I have read and agree to Terms of Service.',
                          style: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontSize: 12,
                          ),),
                        value: true,
                        onChanged: (newValue){ },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black38,
                                foregroundColor: Colors.white70,
                              ),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();
                                  DateTime? date =
                                  _dateTime(_selectedDay, _selectedMonth, _selectedYear);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      action: SnackBarAction(
                                        label: 'OK',
                                        onPressed: () {},
                                      ),
                                      content: Text('selected date is $date'),
                                      elevation: 20,
                                    ),
                                  );
                                } else {
                                  print('on error');
                                  setState(() {
                                    _autovalidate = AutovalidateMode.always;
                                  });
                                }
                              },
                              child: const Text('Create Neon Account'),
                            )
                          ]
                      ),
                      ],
                    ),
              )
                 ],
                ),
              )
            ),

          );
  }
  //String to datetime conversion
  DateTime? _dateTime(int? day, int? month, int? year) {
    if (day != null && month != null && year != null) {
      return DateTime(year, month, day);
    }
    return null;
  }
}



class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors:
                  [
                    Color(0xFF424242),
                    Color(0xff9C27B0),
                    Color(0xFF303030),
                  ],
                  stops:
                  [
                    0.05,0.25,0.7
                  ],
                ),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height:35,),
                  //Image.asset(name),
                  const SizedBox(height: 15,),
                  Text
                    ('Neon',
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 40,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(100, 1, 20, 10),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(  'A Gamers Paradise',
                          style: TextStyle(color: Colors.purple[300],
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              fontSize :10
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30,),
                  Container(
                    height: 480,
                    width: 325,
                    child:

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:
                      [
                        const SizedBox (height: 30,),
                        Text
                          ('Sign in into your Neon account.',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black38,
                              fontWeight:FontWeight.bold,
                              fontStyle: FontStyle.italic
                          ),
                        ),
                        const SizedBox(height: 60,),
                        Container(
                            height: 45,
                            width:250,
                            child: TextField(
                              decoration: InputDecoration(labelText: 'Email Address.',filled:true,fillColor:Colors.black26,suffixIcon: Icon(FontAwesomeIcons.envelope,size:17)),
                            )
                        ),
                        const SizedBox(height:2,),
                        Container(
                            height: 45,
                            width:250,
                            child: TextField(
                              decoration: InputDecoration(labelText: 'Password.',filled:true,fillColor:Colors.black26,suffixIcon: Icon(FontAwesomeIcons.eyeSlash,size:17)),
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.fromLTRB(50, 1, 30, 20),
                            child:  Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  child:
                                  Text('Forget Password?'),
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    foregroundColor: Colors.purple[300],
                                  ),
                                ),
                              ],
                            )
                        ),
                        const SizedBox(height:20,),


                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [

                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black38,
                                  foregroundColor: Colors.white70,
                                ),
                                onPressed: () {},
                                child: const Text('Sign in to Neon'),
                              )
                            ]
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('New on Neon?',
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight:FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              child:
                              Text('Register.'),
                              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) =>const MyRegisterPage(title: '',)),);},
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.purple[300],
                              ),
                            ),
                          ],
                        ),


                        const SizedBox(height: 10,),
                        Text('Or',

                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight:FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Text('Login Using.',
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight:FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: 2,),

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
            )
        )
    );
  }
}













