import 'package:flutter/material.dart';
import 'package:jobtask1/ServicesAPIs/Post.dart';

import 'ServicesAPIs/Api.dart';

class Threadspage extends StatefulWidget {
  const Threadspage({super.key});

  @override
  State<Threadspage> createState() => _ThreadspageState();
}

class _ThreadspageState extends State<Threadspage> {
  List<dynamic>? res = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getAPIdata();
  }

  void getAPIdata() async {
    res = await Api().getData();
    if (res != null && mounted && res!.isNotEmpty) {
      setState(() {
        isLoading = false;
      });
    }

    print("response from Thread Page:$res");
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      ListView.builder(
        itemCount: res!.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.black38,
                  child: Icon(
                    Icons.person,
                  ) /*Image.asset("assets/avatar.png")*/,
                ),
                title: Text("${res![index]["title"]}"),
                subtitle: Text("${res![index]["body"]}"),
              ),
              SizedBox(height: 5),
              Divider(thickness: 2),
            ],
          );
        },
      ),
      Center(child: Text("Search")),
      Center(child: Text("Add")),
      Center(child: Text("Favourite")),
      Center(child: Text("Profile")),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Threads", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Post()),
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body:
          isLoading
              ? Center(child: CircularProgressIndicator())
              : pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        enableFeedback: true,
        currentIndex: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        elevation: 3,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,
        showSelectedLabels: false,

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add"),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favourites",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
