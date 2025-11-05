import 'package:flutter/material.dart';
import 'package:football_news/screens/newslist_form.dart'; 
import 'package:football_news/widgets/left_drawer.dart'; 

// Class untuk merepresentasikan data setiap menu
class NewsItem {
  final String name;
  final IconData icon;
  final Color color;

  const NewsItem(this.name, this.icon, this.color); 
}

// Class utama untuk halaman Menu
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key}); 

  final List<NewsItem> items = const [
    const NewsItem("Lihat Berita", Icons.newspaper, Colors.red),
    const NewsItem("Tambah Berita", Icons.add_box, Colors.blue),
    const NewsItem("Logout", Icons.logout, Colors.grey),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Football News',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      // Tambahkan Drawer
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0), 
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  'Football News Mobile', 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout untuk menampilkan menu item
              GridView.count(
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((NewsItem item) {
                  // Gunakan widget NewsItemCard untuk setiap item
                  return NewsItemCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget kustom untuk setiap kartu menu
class NewsItemCard extends StatelessWidget {
  final NewsItem item;

  const NewsItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));

          if (item.name == "Tambah Berita") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NewsFormPage(), 
              ),
            );
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}