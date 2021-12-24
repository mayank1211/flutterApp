import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
// Own modules
import 'selectedItem.dart';
import 'shoppingCart.dart';
import 'disabledPagesText.dart';

final List<String> viewListItemNames = ["Sneakers", "Jacket", "Watch"];
final List<String> viewListIconUrls = [
  'https://www.vhv.rs/dpng/d/170-1703412_collection-of-free-jordans-drawing-download-on-ui.png',
  'https://cdn.dribbble.com/users/2744556/screenshots/16993349/media/d490d0324391f9d3f9abe868893b2a13.png',
  'https://cdn.dribbble.com/users/7135249/screenshots/16894656/media/97b05870189511fae7f8606702642a49.jpg'
];
final List<String> viewListSneakersPics = [
  'sneaker1.png',
  'sneaker1.png',
  'sneaker1.png'
];

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedPage = 0;
  final _pageOptions = [
    MainPage(),
    DisabledPagesText(),
    ShoppingCart(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 248, 248, 1),
      appBar: AppBar(
        elevation: 0,
        leading: Container(
          height: 20,
          width: 20,
          margin: EdgeInsets.only(left: 15, top: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: IconButton(
            icon: Icon(
              Icons.sort,
              color: Colors.grey,
              size: 25,
            ),
            onPressed: () {
              print("Pressed");
            },
          ),
        ),
        title: Text(''),
        actions: [
          Container(
            height: 20,
            width: 50,
            margin: EdgeInsets.only(right: 15, top: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network(
                "https://source.unsplash.com/50x50/?portrait",
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
        backgroundColor: Color.fromRGBO(248, 248, 248, 1),
      ),
      body: _pageOptions[selectedPage],
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.react,
        items: [
          TabItem(icon: Icons.home, title: "Home"),
          TabItem(icon: Icons.search),
          TabItem(icon: Icons.shopping_basket),
          TabItem(icon: Icons.favorite_border)
        ],
        initialActiveIndex: 0,
        onTap: (int index) {
          (index == 3)
              ? setState(() => selectedPage = 1)
              : setState(() => selectedPage = index);
        },
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 30, right: 30, bottom: 30, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Our",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 30)),
            Text("Products",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
            SizedBox(height: 30),
            IntrinsicHeight(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      new Flexible(
                        child: Container(
                          width: MediaQuery.of(context).size.height * 0.3,
                          height: 45,
                          child: new TextField(
                            maxLines: 1,
                            decoration: InputDecoration(
                                filled: true,
                                contentPadding: EdgeInsets.all(10.0),
                                fillColor: Colors.grey.shade200,
                                prefixIcon: Icon(Icons.search),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      width: 15.0, color: Colors.grey),
                                ),
                                hintText: "Search Products"),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.filter_list),
                          onPressed: () {
                            print("Pressed");
                          },
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 30),
            new Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: viewListIconUrls.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.orange.shade600,
                        width: 2,
                      ),
                    ),
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(right: 10),
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.network(viewListIconUrls[index],
                            width: 40, height: 30),
                        SizedBox(width: 5),
                        Text(
                          viewListItemNames[index],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 30),
            Text(
              "View All",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10),
            new Row(
              children: <Widget>[
                Expanded(
                  child: SizedBox(
                    height: 230,
                    width: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: viewListIconUrls.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return GestureDetector(
                          onTap: () {
                            Future(() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SelectedItem(
                                    imageUrl: viewListSneakersPics[index],
                                  ),
                                ),
                              );
                            });
                          },
                          child: Column(
                            children: [
                              Row(
                                children: <Widget>[
                                  Container(
                                    height: 230,
                                    width: 180,
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    margin: EdgeInsets.only(right: 30),
                                    child: Column(
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              alignment: Alignment.topLeft,
                                              padding: EdgeInsets.only(
                                                  left: 30, top: 25),
                                              child:
                                                  Icon(Icons.favorite_border),
                                            ),
                                            Image(
                                              image: AssetImage(
                                                  "assets/images/${viewListSneakersPics[index]}"),
                                              height: 100,
                                              width: 100,
                                            ),
                                            Text(
                                              "Nike Air Max 200",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "Trending Now",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.orange),
                                            ),
                                            Text(
                                              r"$240",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 30),
            Text(
              "View All",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
