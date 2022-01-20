import 'package:flutter/material.dart';
import 'detail_screen.dart';
import 'food_data.dart';


class MainScreen extends StatefulWidget {
  String value;

  MainScreen({required this.value});

  @override
  _MainScreenState createState() => _MainScreenState(value);
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  String value;

  _MainScreenState(this.value);

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'MakanLah',
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
      body: ListView(
        padding: EdgeInsets.only(left: 20.0),
        children: <Widget>[
          SizedBox(
            height: 15.0,
          ),
          Text('Welcome ${value} :)',
              style: TextStyle(fontFamily: 'Varela', fontSize: 18.0)),
          Text('Categories',
              style: TextStyle(
                  fontFamily: 'Varela',
                  fontWeight: FontWeight.bold,
                  fontSize: 42.0)),
          SizedBox(
            height: 15.0,
          ),
          TabBar(
            controller: _tabController,
            indicatorColor: Colors.transparent,
            labelColor: Color(0xFF545D68),
            isScrollable: true,
            labelPadding: EdgeInsets.only(right: 45.0),
            unselectedLabelColor: Color(0xFFCDCDCD),
            tabs: [
              Tab(
                child: Text('Semua Menu',
                    style: TextStyle(fontFamily: 'Varela', fontSize: 21.0)),
              ),
              Tab(
                child: Text('Makanan',
                    style: TextStyle(fontFamily: 'Varela', fontSize: 21.0)),
              ),
              Tab(
                child: Text('Minuman',
                    style: TextStyle(fontFamily: 'Varela', fontSize: 21.0)),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Container(
              height: MediaQuery.of(context).size.height - 30,
              width: double.infinity,
              child: TabBarView(
                controller: _tabController,
                children: [
                  FoodList(
                    gridCount: 2,
                    add: false,
                  ),
                  FoodList(
                    gridCount: 2,
                    add: false,
                  ),
                  FoodList(
                    gridCount: 2,
                    add: false,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blueGrey,
        child: Icon(Icons.shopping_cart),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class FoodList extends StatelessWidget {
  final int gridCount;
  final bool add;

  FoodList({
    required this.gridCount,
    required this.add,
  });

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      isAlwaysShown: false,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: gridCount,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 15.0,
          childAspectRatio: 0.8,
          children: foodDataList.map((place) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return FoodDetail(place: place);
                }));
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ]),
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          FavoriteButton(),
                        ],
                      ),
                      Expanded(
                        child: Image.asset(
                          place.imageAsset,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      Center(
                        child: Text(
                          place.price,
                          style: TextStyle(
                              fontFamily: 'Valera',
                              fontSize: 14.0,
                              color: Colors.grey),
                        ),
                      ),
                      Center(
                        child: Text(
                          place.name,
                          style: TextStyle(
                            fontFamily: 'Valera',
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Container(
                          color: Color(0XFFEBEBEB),
                          height: 2.0,
                        ),
                      ),
                      AddButton(),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  @override
  bool isFavorite = false;

  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}

class AddButton extends StatefulWidget {
  @override
  _AddButtonState createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  @override
  bool isAdded = false;

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if (!isAdded) ...[
            Icon(
              Icons.shopping_basket,
              color: Colors.green,
              size: 15.0,
            ),
            SizedBox(
              height: 28,
              child: TextButton(
                child: Text('Pesan',
                    style: TextStyle(
                        fontFamily: 'Varela',
                        color: Colors.green,
                        fontSize: 12.0)),
                onPressed: () {
                  setState(() {
                    isAdded = !isAdded;
                  });
                },
              ),
            ),
          ],
          // if (!isAdded) ...[
          //   Icon(Icons.shopping_basket,
          //       color: Color(0xFFD17E50), size: 15.0),
          //   Container(
          //     height: 10,
          //     child: TextButton(onPressed: (){},
          //         child: Text(
          //           'Add to cart'
          //
          //         ),
          //     ),
          //   ),
          // ],
          if (isAdded) ...[
            Icon(Icons.remove_circle_outline,
                color: Colors.lightBlueAccent, size: 15.0),
            Text('3',
                style: TextStyle(
                    fontFamily: 'Varela',
                    color: Colors.lightBlueAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0)),
            Icon(Icons.add_circle_outline,
                color: Colors.lightBlueAccent, size: 15.0),
          ]
        ],
      ),
    );
  }
}
