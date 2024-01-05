import 'package:flutter/material.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:project_neon/ui/store.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _loading = false;

  final supabase = Supabase.instance.client;

  PageController pageController = PageController();
  SideMenuController sideMenu = SideMenuController();

  List<String> errors = [];
  int currentPageIndex = 0; // Add this variable

  @override
  void initState() {
    super.initState();
    sideMenu.addListener((index) {
      Future.delayed(Duration(milliseconds: 1), () {
        pageController.jumpToPage(index);
        if (_loading) {
          setState(() {
            _loading = true;
            currentPageIndex = index; // Update the current page index
          });
        } else {
          setState(() {
            _loading = false;
          });
        }
      });
    });
  }

  @override
  void dispose() {
    sideMenu.dispose();
    pageController.dispose();
    super.dispose();
  }

  getCurrentUser() async {
    final currentUser = supabase.auth.currentUser;
    if (currentUser != null) {
      final response = await supabase.from('current_user').select(
        {
          'email': currentUser.email,
          'username': currentUser.userMetadata?['display_name'],
          'fullname':currentUser.userMetadata?['fullname'],
        } as String,

      );
      print('Error displaying user data: ${response}');
        } else {
      print('No current user authenticated');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
            controller: sideMenu,
            style: SideMenuStyle(
              displayMode: SideMenuDisplayMode.auto,
              hoverColor: Colors.black26,
              selectedHoverColor: Colors.black26,
              selectedColor: Colors.black54,
              selectedTitleTextStyle: const TextStyle(color: Colors.white),
              selectedIconColor: Colors.white,
              backgroundColor: Colors.black87,
            ),
            title: Column(
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 200,
                    maxWidth: 200,
                  ),
                  child: Image.asset(
                    'assets/app_icon.png',
                  ),
                ),
                const Divider(
                  indent: 8.0,
                  endIndent: 8.0,
                ),
              ],
            ),
            footer: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  child: Text(
                    'Bigyan Shrestha',
                    style: TextStyle(fontSize: 15, color: Colors.grey[800]),
                  ),
                ),
              ),
            ),
            items: [
              SideMenuItem(
                title: 'Store',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                icon: const Icon(Icons.home),
                tooltipContent: "This is a tooltip for Dashboard item",
              ),
              SideMenuItem(
                title: 'Library',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                icon: const Icon(Icons.supervisor_account),
              ),
              SideMenuItem(
                builder: (context, displayMode) {
                  return const Divider(
                    endIndent: 8,
                    indent: 8,
                  );
                },
              ),
              SideMenuItem(
                title: 'Log Out',
                onTap: (index, _) async {
                  sideMenu.changePage(index);
                },
                icon: Icon(Icons.exit_to_app),
              ),
            ],
          ),
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: 4, // Number of pages
              itemBuilder: (context, index) {
                switch (index) {
                  case 0:
                    return Store(); // Your Store page
                  case 1:
                    return Container(
                      color: Colors.black87,
                      // Set your desired background color
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'User Information:',
                              style: TextStyle(color: Colors.white, fontSize: 25),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            FutureBuilder(
                              future: getCurrentUser(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  // You can return a loading indicator here if needed
                                  return CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  // Handle error
                                  return Text('Error: ${snapshot.error}');
                                } else {
                                  // Display user information
                                  final user = snapshot.data;
                                  return Column(
                                    children: [
                                      //Text('Email: ${getCurrentUser().email}'),
                                      Text('Username: ${getCurrentUser().user['display_name']}'),
                                      //Text('Fullname: ${getCurrentUser()['email']}'),
                                    ],
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  case 2:


                  case 3:
                    return Container(
                      color: Colors.black87,
                      // Set your desired background color
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Are you sure you want to log out?',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                setState(() {
                                  _loading = true;
                                });
                                await Future.delayed(Duration(seconds: 1));

                                dispose();
                                await supabase.auth.signOut();

                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()),
                                );

                                setState(() {
                                  _loading = false;
                                });
                              },
                              child: _loading
                                  ? const CircularProgressIndicator()
                                  : const Text('Log Out'),
                            ),
                          ],
                        ),
                      ),
                    );

                  default:
                    return Container(); // Handle other cases if needed
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  bool get wantKeepAlive => true;
}
