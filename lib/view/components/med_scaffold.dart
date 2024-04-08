// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:medrecords/authentication/welcome_page.dart';

// ignore: must_be_immutable
class MedScaffold extends StatelessWidget {
  final title;
  final silverList;
  final fab;
  bool backButton;
  MedScaffold({
    super.key,
    required this.title,
    required this.silverList,
    this.fab,
    this.backButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 252, 80, 106),
        title: Center(
            child: Container(
                child: Text(
          title,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
        ))),
      ),
      backgroundColor: const Color.fromRGBO(254, 199, 180, 1.000),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xffFF4667),
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
                      'Patients Name',
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
      floatingActionButton: (fab != null)
          ? FloatingActionButton.extended(
              onPressed: fab,
              backgroundColor: Color.fromARGB(255, 177, 10, 49),
              foregroundColor: Color.fromARGB(255, 243, 221, 228),
              elevation: 10,
              icon: const Icon(Icons.add),
              label: const Text("Add"),
            )
          : const SizedBox(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            elevation: 20,
            expandedHeight: 170,
            leading: (backButton)
                ? const BackButton(color: Colors.white)
                : const SizedBox(),
            flexibleSpace: FlexibleSpaceBar(
              expandedTitleScale: 2,
              title: Image.asset(
                'assets/images/heart.png',
                height: 100,
              ),
              centerTitle: true,
            ),
          ),
          if (silverList != null) ...[silverList]
        ],
      ),
    );
  }
}
