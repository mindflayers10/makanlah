import 'package:flutter/material.dart';
import 'food_data.dart';

class FoodDetail extends StatelessWidget {
  final  place;

  const FoodDetail({required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xFF545D68),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'MAKANLAH',
          style: TextStyle(
              fontFamily: 'Varela', fontSize: 20.0, color: Color(0xFF545D68)),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notifications_none,
              color: Color(0xFF545D68),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(children: [
        SizedBox(height: 15.0),
        Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text(place.name,
              style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF17532))),
        ),
        SizedBox(height: 15.0),
        Center(
            child: Image.asset(place.imageAsset,
                height: 200.0, width: 150.0, fit: BoxFit.fitHeight)),
        SizedBox(height: 20.0),
        Center(
          child: Text(place.price,
              style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF17532))),
        ),
        SizedBox(height: 10.0),
        // Center(
        //   child: Text(place.name,
        //       style: TextStyle(
        //           color: Color(0xFF575E67),
        //           fontFamily: 'Varela',
        //           fontSize: 24.0)),
        // ),
        SizedBox(height: 20.0),
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width - 50.0,
            child: Text(place.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Varela',
                    fontSize: 16.0,
                    color: Color(0xFFB4B8B9))),
          ),
        ),
        SizedBox(height: 20.0),
        Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Container(
                  width: MediaQuery.of(context).size.width - 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Color(0xFFF17532)),
                  child: Center(
                      child: Text(
                        'Add to cart',
                        style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ))),
            ))
      ]),
    );
  }
}
