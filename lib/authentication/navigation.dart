import 'package:flutter/material.dart';
import 'package:medrecords/view/components/doctor/homepage_doctor.dart';
import 'package:medrecords/view/homepage.dart';
import 'package:medrecords/authentication/welcome_page.dart';

class NavigationPage extends StatelessWidget {
  static const route = '/navigation';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Navigation Page',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 252, 80, 106),
        elevation: 0.0,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 252, 80, 106),
              ),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 80.0,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Doctor Name',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Navigate to settings page
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () {
                // Logout
                Navigator.pushNamed(context, WelcomePage.route);
              },
            ),
          ],
        ),
      ),
      body: Container(
        color: const Color.fromRGBO(254, 199, 180, 1.000),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/heart.png',
                height: 250.0,
              ),
              const Text('Who are you?',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  )),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Homepage.route);
                },
                child: const Text('Patient',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                    )),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, DoctorHomePage.route);
                },
                child: const Text('Doctor',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
