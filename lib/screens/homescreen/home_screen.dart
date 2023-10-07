import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:service_provider/screens/activity/activity.dart';
import 'package:service_provider/screens/profile/profile.dart';
import 'package:service_provider/utils/colors.dart';
import 'package:service_provider/screens/homescreen/components/posted_jobs.dart';
import 'package:service_provider/screens/homescreen/sidebar.dart';
import 'package:service_provider/screens/search/search_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'components/job_post.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavigationPage(
        title: "Service Provider",
      ),
    );
  }
}

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _BottomNavigationPageState createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  late int currentIndex;
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  void changePage(int? index) {
    setState(() {
      currentIndex = index!;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _uid = user!.uid;
    print(_uid);
    return Scaffold(
      body: <Widget>[
        const Homepage(),
        const Search(),
        const JobsActivity(),
        ProfilePage(
          userID: _uid,
        ),
      ][currentIndex],
      floatingActionButton: currentIndex == 0 || currentIndex == 1
          ? FloatingActionButton(
              backgroundColor: const Color.fromARGB(255, 245, 171, 59),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => Upload(
                            userID: _uid,
                          ) //const LoginScreen(),
                      ),
                );
              },
              child: const Icon(
                Icons.add_rounded,
                //size: 40,
                color: Colors.white,
              ),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        showUnselectedLabels: false,
        showSelectedLabels: false,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.dashboard,
              color: Colors.black,
              size: 32,
            ),
            label: 'trial',
            activeIcon: Icon(
              Icons.dashboard,
              size: 33,
              color: Colors.red,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.black,
              size: 32,
            ),
            label: 'trial',
            activeIcon: Icon(
              Icons.search,
              size: 33,
              color: Colors.orange,
            ),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.book,
              color: Colors.black,
              size: 32,
            ),
            label: 'trial',
            activeIcon: FaIcon(
              FontAwesomeIcons.book,
              size: 33,
              color: Colors.blue,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.black,
              size: 32,
            ),
            label: 'trial',
            activeIcon: Icon(
              Icons.person,
              size: 33,
              color: Colors.green,
            ),
          ),
        ],
        onTap: changePage,
      ),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        iconTheme: const IconThemeData(
          color: Colors.orange,
        ),
        title: const Padding(
          padding: EdgeInsets.only(left: 180),
          child: Text(
            "Service Provider",
            style: TextStyle(color: Colors.orange, fontSize: 17),
          ),
        ),
      ),
      body: const SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15, top: 20),
              child: Text(
                "Find Your Perfect ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, bottom: 15),
              child: Text(
                "Job",
                style: TextStyle(
                  color: yellow,
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                ),
              ),
            ),
            // Category(),
            SizedBox(
              height: 10,
            ),
            Postedjob(),
            //Bottomnavbar(),
          ],
        ),
      ),
    );
  }
}
