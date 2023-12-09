import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Dio Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,

      ),
      home: const MyHomePage(),
    );
  }
}

class Post {
  late int id;
  late String title;
  late String body;

  Post({
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      body: json['body'] ?? '',
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Dio dio;
  bool loading = true;
  List<Post> posts = [];

  @override
  void initState() {
    super.initState();
    dio = Dio();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await dio.get('https://jsonplaceholder.typicode.com/posts');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        setState(() {
          loading = false;
          posts = data.map((post) => Post.fromJson(post)).toList();
        });
      } else {
        showErrorSnackBar('Error: ${response.statusCode}');
      }
    } catch (e, stackTrace) {
      showErrorSnackBar('Error fetching data. Please try again.');
    }
  }

  void showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API JSON Show with Validater',
          style: TextStyle(
            color:Color(0xffF3CE8B)
        ),
        ),
      backgroundColor: const Color(0xff30466E),
        // color:const Color(0xffdadada),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index){
    //   return ListTile(
    //     title: Text(
    //       'Title: ${posts[index].title}',
    //       style: TextStyle(fontWeight: FontWeight.bold),
    //     ),
    //     subtitle: Text('ID: ${posts[index].id}'),
    //     onTap: () {
    //       Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) => PostDetailsScreen(post: posts[index]),
    //         ),
    //       );
    //       backgroundColor:const Color(0xffdadada);
    //     },
    //   );
    // },
          return Card(
          color: const Color(0xffF3CE8B), // Background color (black)
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: ListTile(
          title: Text(
          'Title: ${posts[index].title}',
          style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xffD5E3F5), // Text color (white)
          ),
          ),
          subtitle: Text(
          'ID: ${posts[index].id}',
          style: const TextStyle(color: Color(0xffD5E3F5)), // Text color (white)
          ),
          onTap: () {
            // side: const BorderSide(color: Colors.black,width:2.0), // Border color (black)
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PostDetailsScreen(post: posts[index]),
                  ),
                );
              },
            ),
          );
    }),
    );
  }
}

class PostDetailsScreen extends StatelessWidget {
  final Post post;

  const PostDetailsScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Details',
        style: TextStyle(
        color:Color(0xffF3CE8B)
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,color: Color(0xffF3CE8B)),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Text.rich(
        TextSpan(
          text: 'ID : ',
              style: const TextStyle(fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(text: '${post.id}',
                  style: const TextStyle(fontWeight: FontWeight.normal),
                )
              ]
          ),
        ),
            // Text(
            //   'ID: ${post.id}',
            //   style: const TextStyle(
            //       fontWeight: FontWeight.bold,
            //       color: Color(0xffF3CE8B),
            //   ),
            // ),
            const SizedBox(height: 8),
            Text(
              'Title: ${post.title}',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xffF3CE8B),
              ),
            ),
            const SizedBox(height: 8),
            Text('Body: ${post.body}'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Close the details screen
              },
              child: const Text('Close'),
            ),
          ],
        ),
      ),
    );
  }
}

