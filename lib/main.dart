import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tutorials/src/data_.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: HomeScreen(),
    );
  }
}



class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int pageIndex = 0;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: gwtFooter(),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 45),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "My Library",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 22),
            ),
            SizedBox(
              height: 15,
            ),
            KidsBoks(),
            SizedBox(
              height: 33,
            ),
            Text(
              "Featured",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 22),
            ),
            SizedBox(
              height: 10,
            ),
            Books(),
            SizedBox(
              height: 35,
            ),
            Text(
              "Categories",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 22),
            ),
            SizedBox(
              height: 10,
            ),
            Categore()
          ],
        ),
      ),
    );
  }

  gwtFooter() {
    List bottomItems = [
      pageIndex == 0 ? "assets/home_active_icon.svg" : "assets/home_icon.svg",
      pageIndex == 1
          ? "assets/search_active_icon.svg"
          : "assets/search_icon.svg",
      pageIndex == 2 ? "assets/love_active_icon.svg" : "assets/love_icon.svg",
      pageIndex == 3
          ? "assets/account_active_icon.svg"
          : "assets/account_icon.svg",
    ];
    List color = [
      pageIndex == 0 ? Colors.orange : Colors.white,
    ];
    return Container(
      width: double.infinity,
      height: 70,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(bottomItems.length, (index) {
            return InkWell(
                onTap: () {
                  selectedTap(index);
                },
                child: SvgPicture.asset(
                  bottomItems[index],
                  color: pageIndex == index
                      ? Colors.orange
                      : Color.fromARGB(255, 100, 100, 100),
                  width: 27,
                ));
          }),
        ),
      ),
    );
  }

  selectedTap(index) {
    setState(() {
      pageIndex = index;
    });
  }
}

class KidsBoks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(kidBooks.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(left: 0, right: 15),
            child: Container(
              width: 105,
              height: 75,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage(kidBooks[index])),
                  borderRadius: BorderRadius.circular(12)),
            ),
          );
        }),
      ),
    );
  }
}

class Books extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(books.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(left: 0, right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 105,
                  height: 150,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(books[index]["img"])),
                      borderRadius: BorderRadius.circular(12)),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  books[index]["nam"],
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  books[index]["dic"],
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey),
                ),

                //🌟🌟🌟🌟🌟
                SizedBox(
                  height: 7,
                ),
                Text(
                  "🌟🌟🌟🌟🌟",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class Categore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(category.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(left: 0, right: 15),
            child: CupertinoButton(
                color: Color.fromARGB(255, 250, 157, 18),
                child: Text(category[index]),
                onPressed: () {}),
          );
        }),
      ),
    );
  }
}
