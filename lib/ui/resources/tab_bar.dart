import 'package:chefcito/core/constants/image_assets.dart';
import 'package:chefcito/core/constants/strings.dart';
import 'package:chefcito/ui/views/request/request_view.dart';
import 'package:chefcito/core/constants/colors.dart' as colors;
import 'package:chefcito/core/constants/constraints.dart' as constraints;
import 'package:flutter/material.dart';

class TabBarApp extends StatelessWidget {
  const TabBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const TabBarExample(),
    );
  }
}

class TabBarExample extends StatelessWidget {
  const TabBarExample({super.key});
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Row(children: [
            Container(
              height: screenSize.height * 0.04,
              alignment: Alignment.center,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: const Image(
                    fit: BoxFit.cover,
                    image: AssetImage(ImageAssets.chefcitoLogo),
                  )),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    Texts.chefcito,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: colors.background,
                        fontFamily: constraints.fontFamily,
                        fontSize: 20,
                        fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            ),
          ]),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: "Generate",
                icon: Icon(Icons.food_bank),
              ),
              Tab(
                text: "Profile",
                icon: Icon(Icons.person),
              ),
              Tab(
                text: "Guides",
                icon: Icon(Icons.book),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: RequestPage(),
            ),
            Center(
              child: Text("To Do"),
            ),
            Center(
              child: Text("To do"),
            ),
          ],
        ),
      ),
    );
  }
}
