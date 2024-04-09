import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    List<String> imageList = [
      'assets/images/autumn.jpg',
      'assets/images/falltree.jpg',
      'assets/images/flowers.jpg',
      'assets/images/squirrel.jpg',
      'assets/images/winter.webp',
      'assets/images/tree.jpg'
    ];

    List<String> imageTitle = [
      'Autumn',
      'Tree',
      'Flower',
      'Squirrel',
      'Pinecone',
      'River'
    ];

    double Width = MediaQuery.of(context).size.width;
    double Height = MediaQuery.of(context).size.height;

    List<Widget> gridStuff = List.generate(6, (index) {
      return Container(
        width: Width,
        height: Height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          image: DecorationImage(
            image: AssetImage(imageList[index]),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            imageTitle[index],
            style: TextStyle(
              color: Colors.white,
              fontSize: 34,
              fontWeight: FontWeight.normal,
              shadows: [
                Shadow(
                  blurRadius: 5,
                  color: Colors.black.withOpacity(0.5),
                  offset: Offset(5, 5),
                ),
              ],
            ),
          ),
        ),
      );
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 236, 137, 81),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Home Page',
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
            SizedBox(
              width: 100,
            ),
            TextButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Alert'),
                        content: Text('This is an alert dialog.'),
                        actions: [
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      );
                    });
              },
              child: Icon(Icons.notification_add, color: Colors.white),
            ),
            Icon(Icons.settings),
          ],
        ),
      ),
      drawer: Drawer(
          child: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Settings'),
            onTap: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Profile'),
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
        ],
      )),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 239, 166, 65),
        ),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 240,
            ),
            itemCount: gridStuff.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Container(height: 240, child: gridStuff[index]),
                ],
              );
            }),
      ),
      bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          currentIndex: 0,
          items: const [
            BottomNavigationBarItem(
                backgroundColor: Color.fromARGB(255, 239, 166, 65),
                icon: Icon(Icons.home),
                label: 'Home'),
            BottomNavigationBarItem(
                backgroundColor: Color.fromARGB(255, 239, 166, 65),
                icon: Icon(Icons.search),
                label: 'Search'),
            BottomNavigationBarItem(
                backgroundColor: Color.fromARGB(255, 239, 166, 65),
                icon: Icon(Icons.settings),
                label: 'Settings'),
            BottomNavigationBarItem(
                backgroundColor: Color.fromARGB(255, 239, 166, 65),
                icon: Icon(Icons.person),
                label: 'Profile'),
          ],
          onTap: (int index) {
            switch (index) {
              case 0:
                Navigator.pushNamed(context, '/');
                break;
              case 2:
                Navigator.pushNamed(context, '/settings');
                break;
              case 3:
                Navigator.pushNamed(context, '/profile');
                break;
            }
          }),
    );
  }
}
