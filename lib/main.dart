import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// ================= MAIN APP =================
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram UI',
      home: const InstagramPage(),
    );
  }
}

// ================= HALAMAN INSTAGRAM =================
class InstagramPage extends StatelessWidget {
  const InstagramPage({super.key});

  // ================= DATA STORIES =================
  final List<Map<String, String>> stories = const [
    {
      "name": "You",
      "image":
          "https://images.unsplash.com/photo-1518791841217-8f162f1e1131"
    },
    {
      "name": "budi_@",
      "image":
          "https://images.unsplash.com/photo-1574158622682-e40e69881006"
    },
    {
      "name": "sari_ayu",
      "image":
          "https://images.unsplash.com/photo-1543852786-1cf6624b9987"
    },
    {
      "name": "rinaa__",
      "image":
          "https://images.unsplash.com/photo-1519052537078-e6302a4968d4"
    },
    {
      "name": "andi_dev",
      "image":
          "https://images.unsplash.com/photo-1495360010541-f48722b34f7d"
    },
    {
      "name": "joko_id",
      "image":
          "https://images.unsplash.com/photo-1518791841217-8f162f1e1131"
    },
    {
      "name": "luna_cat",
      "image":
          "https://images.unsplash.com/photo-1574158622682-e40e69881006"
    },
  ];

  // ================= DATA POSTS =================
  final List<Map<String, String>> posts = const [
    {
      "username": "milo_cat",
      "image":
          "https://images.unsplash.com/photo-1518791841217-8f162f1e1131",
      "caption": "Meow meow 🐱"
    },
    {
      "username": "nailong_fun",
      "image":
          "https://images.unsplash.com/photo-1543852786-1cf6624b9987",
      "caption": "Hari yang menyenangkan ✨"
    },
    {
      "username": "kitty_love",
      "image":
          "https://images.unsplash.com/photo-1574158622682-e40e69881006",
      "caption": "Tidur dulu 😴"
    },
    {
      "username": "luna_cat",
      "image":
          "https://images.unsplash.com/photo-1519052537078-e6302a4968d4",
      "caption": "Main-main dulu 🐾"
    },
    {
      "username": "cutecat",
      "image":
          "https://images.unsplash.com/photo-1495360010541-f48722b34f7d",
      "caption": "Mood hari ini 🤍"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ================= APP BAR =================
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,

        // ICON PLUS KIRI
        leading: const Icon(
          Icons.add,
          color: Colors.black,
        ),

        // JUDUL INSTAGRAM
        title: const Text(
          'Instagram',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),

        // ICON KANAN
        actions: const [
          Icon(Icons.favorite_border, color: Colors.black),
          SizedBox(width: 15),
          Icon(Icons.send_outlined, color: Colors.black),
          SizedBox(width: 10),
        ],
      ),

      // ================= BODY =================
      body: ListView(
        children: [
          // ================= STORIES =================
          SizedBox(
            height: 110,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: stories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 32,
                        backgroundImage:
                            NetworkImage(stories[index]["image"]!),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        stories[index]["name"]!,
                        style: const TextStyle(fontSize: 11),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          const Divider(),

          // ================= POSTS =================
          ...posts.map((post) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // HEADER POST
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(post["image"]!),
                  ),
                  title: Text(
                    post["username"]!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: const Icon(Icons.more_vert),
                ),

                // GAMBAR POST
                Image.network(
                  post["image"]!,
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                // ICON LIKE + ANGKA
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Icon(Icons.favorite_border),
                      SizedBox(width: 5),
                      Text(
                        "228",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(width: 20),

                      Icon(Icons.mode_comment_outlined),
                      SizedBox(width: 5),
                      Text(
                        "60",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(width: 20),

                      Icon(Icons.send_outlined),
                    ],
                  ),
                ),

                // CAPTION
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    "${post["username"]!}: ${post["caption"]!}",
                  ),
                ),

                const SizedBox(height: 20),
              ],
            );
          }),
        ],
      ),

      // ================= ICON BAWAH =================
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_collection_outlined),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.send),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "",
          ),
        ],
      ),
    );
  }
}