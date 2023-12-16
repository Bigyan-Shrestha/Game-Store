import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyRegisterPage extends StatefulWidget {
  const MyRegisterPage({super.key});

  @override
  State<MyRegisterPage> createState() => RegisterPage();
}

class RegisterPage extends State<MyRegisterPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidate = AutovalidateMode.disabled;
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
                      height: 20,
                    ),
                    const Text(
                      'Create a neon account.',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black38,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const SizedBox(
                        height: 45,
                        width: 400,
                        child: TextField(
                          decoration: InputDecoration(
                              labelText: 'Display Name  *',
                              labelStyle: TextStyle(
                                color: Colors.black87,
                              ),
                              filled: true,
                              fillColor: Colors.black26),
                        )),
                    const SizedBox(
                      height: 2,
                    ),
                    const Row(children: [
                      Flexible(
                        child: TextField(
                          decoration: InputDecoration(
                              labelText: '  First Name  *',
                              labelStyle: TextStyle(
                                color: Colors.black87,
                              ),
                              filled: true,
                              fillColor: Colors.black26,
                              contentPadding: EdgeInsets.all(1)),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Flexible(
                        child: TextField(
                          decoration: InputDecoration(
                              labelText: '  Last Name  *',
                              labelStyle: TextStyle(
                                color: Colors.black87,
                              ),
                              filled: true,
                              fillColor: Colors.black26,
                              contentPadding: EdgeInsets.all(1)),
                        ),
                      ),
                    ]),
                    const SizedBox(
                      height: 2,
                    ),
                    const SizedBox(
                        height: 45,
                        width: 400,
                        child: TextField(
                          decoration: InputDecoration(
                              labelText: 'Country  *',
                              labelStyle: TextStyle(
                                color: Colors.black87,
                              ),
                              filled: true,
                              fillColor: Colors.black26,
                              suffixIcon: Icon(
                                FontAwesomeIcons.flag,
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
                    const SizedBox(
                      height: 2,
                    ),
                    Form(
                        key: formKey,
                        autovalidateMode: autoValidate,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              DropdownDatePicker(
                                locale: "en",
                                inputDecoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.black26,
                                  contentPadding: EdgeInsets.all(1),
                                ),
                                // optional
                                isDropdownHideUnderline: true,
                                // optional
                                isFormValidator: true,
                                // optional
                                startYear: 1900,
                                // optional
                                endYear: 2020,
                                // optional
                                width: 0.5,
                                // optional
                                selectedDay: _selectedDay,
                                // optional
                                selectedMonth: _selectedMonth,
                                // optional
                                selectedYear: _selectedYear,
                                // optional
                                boxDecoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black26, width: 0.5),
                                ),
                                hintTextStyle:
                                    const TextStyle(color: Colors.black38),
                                onChangedDay: (value) {
                                  _selectedDay = int.parse(value!);
                                  //print('onChangedDay: $value');
                                },
                                onChangedMonth: (value) {
                                  _selectedMonth = int.parse(value!);
                                  //print('onChangedMonth: $value');
                                },
                                onChangedYear: (value) {
                                  _selectedYear = int.parse(value!);
                                  //print('onChangedYear: $value');
                                },
                              ),
                            ],
                          ),
                        )),
                    const SizedBox(
                      height: 1,
                    ),
                    CheckboxListTile(
                      activeColor: Colors.black54,
                      title: const Text(
                        'I have read and agree to Terms of Service.',
                        style: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: 12,
                        ),
                      ),
                      value: true,
                      onChanged: (newValue) {},
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
                              DateTime? date = _dateTime(
                                  _selectedDay, _selectedMonth, _selectedYear);
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
                              //print('on error');
                              setState(() {
                                autoValidate = AutovalidateMode.always;
                              });
                            }
                          },
                          child: const Text('Create Neon Account'),
                        )
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

  //String to datetime conversion
  DateTime? _dateTime(int? day, int? month, int? year) {
    if (day != null && month != null && year != null) {
      return DateTime(year, month, day);
    }
    return null;
  }
}
