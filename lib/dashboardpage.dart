import 'package:emoji/sernikpage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'foodtabs.dart';

class DashboardPage extends StatefulWidget{
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState(){
    super.initState();
    tabController = TabController(vsync: this, length: 4);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(Icons.menu, color: Colors.indigoAccent),
                  Container(
                    height: 50.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.white12.withOpacity(0.3),
                              blurRadius: 6.0,
                              spreadRadius: 4.0,
                              offset: Offset(0.0, 3.0)
                          )
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/avatar.png'),
                            fit: BoxFit.contain
                        )
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                'SZUKAJ',
                style: GoogleFonts.nobile(
                    fontWeight: FontWeight.w800, fontSize: 27.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                'SŁODKOŚCI',
                style: GoogleFonts.nobile(
                    fontWeight: FontWeight.w800, fontSize: 27.0),
              ),
            ),
            SizedBox(height: 25.0),
            Padding(
                padding: EdgeInsets.only(left: 15.0, right: 15.0),
                child: Container(
                    padding: EdgeInsets.only(left: 5.0),
                    decoration: BoxDecoration(
                        color: Colors.indigo.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Szukaj',
                          hintStyle: GoogleFonts.nobile(
                              fontSize: 14.0
                          ),
                          border: InputBorder.none,
                          fillColor: Colors.lime.withOpacity(0.5),
                          prefixIcon: Icon(Icons.search, color: Colors.lime)
                      ),
                    )
                )
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                'Polecane',
                style: GoogleFonts.nobile(
                    fontWeight: FontWeight.w500, fontSize: 18.0),
              ),
            ),
            SizedBox(height: 15.0),
            Container(
              height: 200.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  _buildListItem(
                      'Sernik', 'assets/cheesecake.png', '16', Colors.green, Colors.white),
                  _buildListItem(
                      'Cappuccino', 'assets/cappuccino.png', '10', Colors.greenAccent, Colors.white),
                  _buildListItem(
                      'Ciastko', 'assets/cookie.png', '4', Colors.lightGreenAccent, Colors.white),
                ],
              )
            ),
            SizedBox(height: 10.0),
            Padding(
                padding: EdgeInsets.only(left: 15.0),
              child: TabBar(
              controller: tabController,
              isScrollable: true,
                indicatorColor: Colors.transparent,
                labelColor: Colors.lime,
                unselectedLabelColor: Colors.black.withOpacity(0.5),
                labelStyle: GoogleFonts.nobile(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700
                ),
                unselectedLabelStyle: GoogleFonts.nobile(
                  fontSize: 12.0,
                   fontWeight: FontWeight.w500
                ),
                tabs: [
                  Tab(child: Text('WYRÓŻNIONE')),
                  Tab(child: Text('KOMBINACJA')),
                  Tab(child: Text('ULUBIONE')),
                  Tab(child: Text('POLECANE')),
                ]
            )),
            Container(
              height: MediaQuery.of(context).size.height - 450.0,
              child: TabBarView(
                controller: tabController,
                children: [
                  FoodTab(),
                  FoodTab(),
                  FoodTab(),
                  FoodTab(),
                ],
              ),
            )
                ]),
    );
  }

  _buildListItem(String foodName, String imgPath, String price, Color bgColor, Color cirColor) {
    return Padding(
        padding: EdgeInsets.only(left: 15.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SernikPage(heroTag: foodName, foodName: foodName, pricePerItem: price,  imgPath: imgPath)));
            },
            child: Container(
              height: 175.0,
              width: 150.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: bgColor
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Hero(
                        tag: foodName,
                        child: Container(
                          height: 75.0,
                          width: 75.0,
                          decoration: BoxDecoration(
                            color: cirColor,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                              child: Image.asset(
                                  imgPath, height: 50.0, width: 50.0)
                          ),
                        )
                    ),
                    SizedBox(height: 25.0),
                    Text(foodName,
                      style: GoogleFonts.nobile(
                        fontSize: 17.0,
                      ),
                    ),
                    Text(price + ' \zł',
                        style: GoogleFonts.nobile(
                          fontSize: 17.0,
                        )
                    )
                  ]
              ),
            )
        )
    );
  }
  }