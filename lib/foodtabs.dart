import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';


class FoodTab extends StatefulWidget{
  @override
  _FoodTabState createState() => _FoodTabState();
}

class _FoodTabState extends State<FoodTab>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: ListView(
        children: <Widget>[
          _buildListItem('Wyciskany sok', 4.0, '8', 'assets/juice.jpeg'),
          _buildListItem('Croissant', 3.0, '5', 'assets/croissant.jpeg')
        ],
      ),
    );
  }
  _buildListItem(String foodName, rating, String price, String imgPath){
    return Padding(
        padding: EdgeInsets.all(15.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
        width: 210.0,
        child: Row(
          children: [
            Container(
              height: 75.0,
               width: 75.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0),
                color: Colors.lime
              ),
              child: Center(
                child: Image.asset(imgPath, height: 60.0, width: 60.0)
              )
            ),
            SizedBox(width: 20.0),
            Expanded(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  foodName,
                  style: GoogleFonts.nobile(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400
                  )
                ),
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 20.0,
              itemPadding: EdgeInsets.symmetric(horizontal: 0.5),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amberAccent,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
                Row(
                  children: <Widget>[
                    Text(price + ' zł',
                      style: GoogleFonts.aBeeZee(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        textStyle: TextStyle(
                          color: Colors.black
                        )
                      ),
                    ),
                    SizedBox(width: 3.0),
                    Text('10' + ' zł',
                      style: GoogleFonts.aBeeZee(
                        fontSize: 14.0,
                        decoration: TextDecoration.lineThrough,
                        fontWeight: FontWeight.w600,
                        textStyle: TextStyle(
                          color: Colors.grey.withOpacity(0.4)
                        )
                      ),
                    )
                  ],
                )
              ],
            )
            )
          ]
        )
    ),
            FloatingActionButton(
        heroTag: foodName,
      mini: true,
      onPressed: (){},
      child: Center(
        child: Icon(Icons.add, color: Colors.black)
      ),
              backgroundColor: Colors.white,
    )
      ],
    ),);
  }
}