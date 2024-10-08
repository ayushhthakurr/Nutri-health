import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medrecords/authentication/login_page.dart';
import 'package:medrecords/authentication/navigation.dart';
import 'package:medrecords/authentication/signup_page.dart';
import 'package:medrecords/authentication/welcome_page.dart';
import 'package:medrecords/config/theme.dart';
import 'package:medrecords/view/allergies.dart';
import 'package:medrecords/view/components/doctor/ViewPatientRecord.dart';
import 'package:medrecords/view/components/doctor/drawer/AppointmentDetail.dart';
import 'package:medrecords/view/components/doctor/drawer/DoctorAppointment.dart';
import 'package:medrecords/view/components/doctor/SavePatient.dart';
import 'package:medrecords/view/homepage.dart';
import 'package:medrecords/view/components/doctor/homepage_doctor.dart';
import 'package:medrecords/view/medical_history.dart';
import 'package:medrecords/view/medical_visit.dart';
import 'package:medrecords/view/vaccinations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'authentication/authservices.dart';

late SharedPreferences prefs;
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  prefs = await SharedPreferences.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSignedIn = true;

  @override
  void initState() {
    super.initState();
    getUserLoggedInStatus();
  }

  getUserLoggedInStatus() {
    HelperFunction.getUserLoggedInStatus().then((value) {
      log(value.toString());
      if (value != null) {
        setState(() {
          _isSignedIn = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MedRecords',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: _isSignedIn ? NavigationPage() : const WelcomePage(),
      routes: {
        NavigationPage.route: (context) => NavigationPage(),
        DoctorHomePage.route: (context) => DoctorHomePage(),
        Homepage.route: (context) => const Homepage(),
        WelcomePage.route: ((context) => const WelcomePage()),
        LoginPage.route: (context) => const LoginPage(),
        SignupPage.route: (context) => const SignupPage(),
        MedicalHistoryPage.route: (context) => const MedicalHistoryPage(),
        MedicalVisitPage.route: ((context) => const MedicalVisitPage()),
        AllergiesPage.route: (context) => const AllergiesPage(),
        VaccinationPage.route: ((context) => const VaccinationPage()),
        SavePatientRecordPage.route: (context) => SavePatientRecordPage(),
        AppointmentDetailPage.route: ((context) => AppointmentDetailPage()),
        DoctorAppointmentsPage.route: ((context) => DoctorAppointmentsPage()),
        ViewPatientsPage.route: ((context) => ViewPatientsPage()),
      },
    );
  }
}
