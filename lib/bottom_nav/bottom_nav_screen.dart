import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:news_app/bottom_nav/favourite_page.dart';
import 'package:news_app/bottom_nav/home_page.dart';
import 'package:news_app/bottom_nav/trending_page.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {


  List<Widget> pages = [HomePage(),TrendingPage(),FavouritePage()];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    double displayWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      //backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("News App",style: TextStyle(color: Colors.amber,fontSize: 20,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: pages[currentIndex],
      bottomNavigationBar: Container(
        //color: Colors.transparent,
        margin: EdgeInsets.all(displayWidth * .02),
        //margin: EdgeInsets.only(bottom: 5),
        //height: displayWidth * .155,
        decoration: BoxDecoration(
          color: Colors.blue,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 30,
              offset: Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),



        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              tabBorderRadius: 15,
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.amber,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.amber,
              color: Colors.white,
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.local_fire_department_outlined,
                  text: 'Trending',
                ),

                GButton(
                  icon: Icons.bookmark_border_outlined,
                  text: 'Favourite',
                ),
              ],
              //selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
        ),


      ),
    );
  }
}
