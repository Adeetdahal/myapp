import 'package:flutter/material.dart';
import 'package:flutter_app/submitPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: Container(
          color: Colors.grey[400],
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            //mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(15),
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Text('Partners',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              )),
                          Expanded(child: Container()),
                          Text('EcoWorld',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.blue,
                              )),
                        ],
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        prefixIcon: Icon(Icons.search),
                        labelText: 'Search Partners',
                      ),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    TabBar(
                      indicatorColor: Colors.blue,
                      labelColor: Colors.black,
                      tabs: [
                        Tab(icon: Icon(Icons.flight),text: "home",),
                        Tab(icon: Icon(Icons.alt_route)),
                        Tab(icon: Icon(Icons.person)),
                        Tab(icon: Icon(Icons.more_vert)),
                        Tab(icon: Icon(Icons.android)),
                      ],
                    ),

                    Container(
                      height: 500,
                      color: Colors.white,
                      child: TabBarView(
                        children: [
                          tab1(),
                          Text(
                            'world',
                            style: TextStyle(fontSize: 30),
                          ),
                          Text(
                            'This',
                            style: TextStyle(fontSize: 30),
                          ),
                          Text(
                            'is',
                            style: TextStyle(fontSize: 30),
                          ),
                          Text(
                            'Demo App',
                            style: TextStyle(fontSize: 30),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget tab1() {
    return Column(
      //shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Top Offers',
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
            ),
          ),

          Container(
            height: 440,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Stack(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image.asset('assets/aa.jpg')),
                          Positioned(
                              top: 15,
                              left: 15,
                              child: Text(
                                "Hello",
                                style: TextStyle(color: Colors.white),
                              )),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(3.0),
                                child: Container(
                                  height: 25,
                                  width: 80,
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Text('Redeem',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                                      )
                                    ],
                                  ),
                                ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          )
        ]);
  }
}
