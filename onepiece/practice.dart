// -------------------------------------------------------------------

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:json_annotation/json_annotation.dart';


// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   // const MyApp({Key? key}) : super(key: key);
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         textTheme: GoogleFonts.comicNeueTextTheme(), // Apply Google Fonts theme
//       ),
//       // theme: ThemeData(
//       //   primarySwatch: Colors.green,
//       // ),
//       home: const MyHomePage(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   var jsonList;
//   @override
//   void initState() {
//     getData();
//   }
//
//   void getData() async {
//     try {
//       var response = await Dio()
//           // .post('https://jsonplaceholder.typicode.com/posts/1');
//           .get('https://protocoderspoint.com/jsondata/superheros.json');
//           // .get('https://api.openweathermap.org/data/2.5/weather?q=dubai&units=metric&appid=ab4d83ded0552485cb5fdd7e4331e0af');
//           // .get('https://164.100.196.159/Labour_Api/api/Master/GetListofForms');
//       // https://api.openweathermap.org/data/2.5/weather?q=dubai&units=metric&appid=ab4d83ded0552485cb5fdd7e4331e0af
//             print(response.data.toString());
//       if(response.statusCode == 200){
//         setState((){
//           jsonList=response.data['superheros'] as List;
//         });
//       }else{
//         print(response.statusCode);
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Super Heroes',
//             style: TextStyle(
//                 color: Colors.white,
//               fontWeight: FontWeight.bold,
//             ),
//         ),
//         centerTitle: true,
//         backgroundColor:const Color(0xff314028),
//       ),
//       body: ListView.builder(
//           // itemCount: 10,
//         itemCount: jsonList == null ? 0:jsonList.length,
//           itemBuilder: (BuildContext context, int index) {
//             return Card(
//               color: const Color(0xff252d1e),
//                 child: ListTile(
//                   // title: Text('name'),
//                   // subtitle: Text('power'),
//                   leading:ClipRRect(
//                     borderRadius:BorderRadius.circular(10),
//                       child:Image.network(
//                         jsonList[index]['url'],
//                         fit:BoxFit.fill,
//                         width:50,
//                         height:50,
//                       ),
//                   ),
//                   title: Text(jsonList[index]['name'],
//                       style:const TextStyle(
//                         color: Color(0xffe4e8dc),
//                         fontWeight: FontWeight.bold,
//                       ),
//                   ),
//                   subtitle: Text(jsonList[index]['power'],
//                     style:const TextStyle(color:Color(0xffd1dac8),
//                     ),
//                   ),
//                 ),
//             );
//           }),
//       backgroundColor:const Color(0xff1f2418),
//     );
//   }
// }


// ));

// -----------------------------------------------------------------------
// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class Post {
//   final int id;
//   final String title;
//   final String body;
//
//   Post({required this.id, required this.title, required this.body});
//
//   factory Post.fromJson(Map<String, dynamic> json) {
//     return Post(
//       id: json['id'],
//       title: json['title'],
//       body: json['body'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'title': title,
//       'body': body,
//     };
//   }
// }
//
// class MyApp extends StatelessWidget {
//   Future<List<Post>> fetchPosts() async {
//     final dio = Dio();
//     final response = await dio.post('https://jsonplaceholder.typicode.com/posts', data: {
//       'title': 'New Post Title',
//       'body': 'New Post Body',
//       'userId': 1,
//     });
//
//     if (response.statusCode == 201) {
//       // If the server returns a 201 Created response, parse the created post
//       Post newPost = Post.fromJson(response.data);
//       return [newPost];
//     } else {
//       // If the server did not return a 201 Created response, throw an exception
//       throw Exception('Failed to create a new post');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('API Data Display'),
//         ),
//         body: FutureBuilder<List<Post>>(
//           future: fetchPosts(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (snapshot.hasError) {
//               return Center(child: Text('Error: ${snapshot.error}'));
//             } else {
//               return ListView.builder(
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (context, index) {
//                   return Card(
//                     margin: EdgeInsets.all(8.0),
//                     child: ListTile(
//                       title: Text(
//                         'New Post ID: ${snapshot.data![index].id}',
//                         style: TextStyle(fontSize: 18),
//                       ),
//                       subtitle: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Title: ${snapshot.data![index].title}',
//                             style: TextStyle(fontSize: 16),
//                           ),
//                           Text(
//                             'Body: ${snapshot.data![index].body}',
//                             style: TextStyle(fontSize: 16),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
// -------------------------------------------------------------------
// ----------------------------------------------------------------------------------------

// import 'package:flutter/material.dart';
// import 'dart:math' as math;
// void main() {
//   runApp(MyApp());
// }
//
// class Post {
//   late int id;
//   late String title;
//   late String body;
//
//   Post({
//     required this.id,
//     required this.title,
//     required this.body,
//   });
//
//   factory Post.fromJson(Map<String, dynamic> json) {
//     return Post(
//       id: json['id'],
//       title: json['title'],
//       body: json['body'],
//     );
//   }
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   late Dio _dio;
//   late Future<List<Post>> _posts;
//
//   @override
//   void initState() {
//     super.initState();
//     _dio = Dio();
//     _posts = fetchPosts();
//   }
//
//   Future<List<Post>> fetchPosts() async {
//     final response = await _dio.get('https://jsonplaceholder.typicode.com/posts');
//
//     if (response.statusCode == 200) {
//       List<Post> posts = (response.data as List).map((json) => Post.fromJson(json)).toList();
//       return posts;
//     } else {
//       throw Exception('Failed to load posts');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('JSON Data from API in ListView'),
//       ),
//       body: FutureBuilder<List<Post>>(
//         future: _posts,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             // return _buildLoadingIndicator(); // Show loading indicator while data is being fetched
//             return const Center(child: CircularProgressIndicator(
//               backgroundColor:Color(0xffdadada),
//               // valueColor:AlwaysStoppedAnimation<Color>
//                 // (Colors.green),
//               strokeWidth:8,
//               strokeCap: StrokeCap.round,
//             ));
//             // return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else {
//             List<Post> posts = snapshot.data ?? [];
//             return ListView.builder(
//               itemCount: posts.length,
//               itemBuilder: (context, index) {
//               backgroundColor:const Color(0xffdadada);
//                 return Card(
//                   margin: const EdgeInsets.all(8.0),
//                   child: ListTile(
//                     title: Text(
//                       'Title: ${posts[index].title}',
//                       style: const TextStyle(fontWeight: FontWeight.bold),
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     subtitle: Text('ID: ${posts[index].id}'),
//                     onTap: () {
//                       _showDetails(posts[index]);
//                     },
//                   ),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
//
//   void _showDetails(Post post) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Post Details'),
//           content: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text('Title: ${post.title}',
//                 overflow: TextOverflow.ellipsis,
//               ),
//               const SizedBox(height: 8),
//               Text('Body: ${post.body}',
//                 maxLines:2,
//               ),
//               // const SizedBox(height: 8),
//               // Text('ID: ${post.id}'),
//             ],
//           ),
//           actions: [
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text('Close'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
// ----------------------------< :: MAIN CODE :: >-----------------------------------
import 'package:json_annotation/json_annotation.dart';
// import 'package:dio/dio.dart';

// Widget _buildLoadingIndicator() {
//   return Stack(
//     alignment: Alignment.center,
//     children: [
//       // Main content
//       Opacity(
//         opacity: 0.7,
//         child: Image.network(
//           'assets/images/loading.gif',
//           fit: BoxFit.cover,
//           height: double.infinity,
//           width: double.infinity,
//         ),
//       ),
//       // Loading indicator
//       // const CircularProgressIndicator(),
//     ],
//   );
// }
// -----------------------< : FINAL ONE : >-------------------------

import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

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


//--------------------- JSON Modal Class VALIDATIONS : -------------------


// File Name : AnswerData.g.dart
// // GENERATED CODE - DO NOT MODIFY BY HAND
//
// part of 'AnswerData.dart';
//
// // **************************************************************************
// // JsonSerializableGenerator
// // **************************************************************************
//
// AnswerData _$AnswerDataFromJson(Map<String, dynamic> json) => AnswerData(
//   json['token'] == null ? "" : json['token'].toString(),
//   json['ans_submission_id'] == null ? "" : json['ans_submission_id'] as String,
//   json['form_id'] == null ? "" : json['form_id'] as String,
//   json['department_id'] == null ? "" : json['department_id'].toString(),
//   json['input_control_key'] == null ? "" : json['input_control_key'].toString(),
//   json['ques_id'] == null ? "" : json['ques_id'].toString(),
//   json['ans_type_options'] == null ? "" : json['ans_type_options'].toString(),
//   json['user_id'] == null ? "" : json['user_id'].toString(),
//   (json['ans_value'] as List<dynamic>?)?.map((e) => OptionValueData.fromJson(e as Map<String, dynamic>)).toList(),
// );
//
// Map<String, dynamic> _$AnswerDataToJson(AnswerData instance) => <String, dynamic>{
//   'token': instance.token,
//   'ans_submissiom_id': instance.ans_submissiom_id,
//   'form_id': instance.form_id,
//   'department_id': instance.department_id,
//   'input_control_key': instance.input_control_key,
//   'ques_id': instance.ques_id,
//   'ans_type_options': instance.ans_type_options,
//   'user_id': instance.user_id,
//   'ans_value': instance.ans_value,
// };

//--------------------- JSON Modal Class with Validations as Imported here from File(AnswerData.g.dart) : -------------------

// import 'package:json_annotation/json_annotation.dart';
// import 'package:labourproject/modal/OptionValueData.dart';
//
// part 'AnswerData.g.dart';
//
// @JsonSerializable()
// class AnswerData {
//
//
//   late String token;
//   late String ans_submissiom_id;
//   late String form_id;
//   late String department_id;
//   late String input_control_key;
//   late String ques_id;
//   late String ans_type_options;
//   late String user_id;
//   late List<OptionValueData>? ans_value;
//
//
//
//   AnswerData(
//       this.token,
//       this.ans_submissiom_id,
//       this.form_id,
//       this.department_id,
//       this.input_control_key,
//       this.ques_id,
//       this.ans_type_options,
//       this.user_id,
//       this.ans_value,
//       );
//
//   factory AnswerData.fromJson(Map<String,dynamic> json) => _$AnswerDataFromJson(json);
//   Map<String, dynamic> toJson() => _$AnswerDataToJson(this);
// }
//
