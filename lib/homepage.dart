import 'package:flutter/material.dart';

class MyHomepage extends StatefulWidget {
  const MyHomepage({Key? key}) : super(key: key);

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  String? _selectedImage;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 15, 14, 23),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(75),
          child: AppBar(
            backgroundColor: const Color.fromARGB(255, 15, 14, 23),
            title: Text(
              'Welcome to my App',
              style: TextStyle(
                color: Colors.purple[50],
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            actions: <Widget>[
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.person_2_outlined,
                ),
                color: Colors.white,
              ),
            ],
          ),
        ),
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(left: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'list-Product',
                    style: TextStyle(
                      color: Colors.purple[50],
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (int i = 1; i <= 4; i++)
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedImage = 'assets/images/Image$i.jpeg';
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                    imagePath: 'assets/images/Image$i.jpeg',
                                    tag: 'image$i',
                                  ),
                                ),
                              );
                            },
                            child: Hero(
                              tag: 'image$i',
                              child: Container(
                                margin: EdgeInsets.only(
                                  left: i == 1 ? 0 : 10,
                                  right: 10,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 150,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              'assets/images/Image$i.jpeg'),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 7.5,
                                    ),
                                    Text(
                                      'Art by Pin_ker',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '155 view',
                                      style: TextStyle(
                                        color: Color(0xffFF6332),
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Highlights',
                    style: TextStyle(
                      color: Colors.purple[50],
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (int i = 5; i <= 12; i++)
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedImage = 'assets/images/image$i.png';
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                    imagePath: 'assets/images/image$i.png',
                                    tag: 'image$i',
                                  ),
                                ),
                              );
                            },
                            child: Hero(
                              tag: 'image$i',
                              child: Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: size.height * 0.3,
                                      width: size.width * 0.9,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              'assets/images/image$i.png'),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Art $i',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 15, 14, 23),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          selectedItemColor: Color(0xFFFF6332),
          unselectedItemColor: Color(0xFF892CFF),
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String imagePath;
  final String tag;
  const DetailPage({required this.imagePath, required this.tag});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 15, 14, 23),
        title: Text(
          'Detail',
          style: TextStyle(
            color: Colors.purple[50],
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Hero(
            tag: tag,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage(imagePath),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
