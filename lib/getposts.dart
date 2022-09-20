import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class getposts extends StatefulWidget {
  const getposts({Key? key}) : super(key: key);

  @override
  State<getposts> createState() => _getpostsState();
}

class _getpostsState extends State<getposts> {
  List posts = [];

  Future<void> getpost() async {
    try {
      Response response = await get(
          Uri.parse("https://jsonplaceholder.typicode.com/posts"));
      List data = jsonDecode(response.body);
      setState(() {
        posts.addAll(data);
      });
      //print(posts[0]["title"]);


    } catch (e) {
      print("There is an error");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getpost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[300],
      body: SafeArea(
        child: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("This is the API response ",
                  style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),),
                  Icon(Icons.tag_faces_rounded,color: Colors.yellow,)
                ],
              ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Take a tour ",
                      style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),),
                    Icon(Icons.favorite,color: Colors.red,)
                  ],
                ),
            Container(
              height: 200,
              width: 500,
              margin: EdgeInsets.all(15),
              foregroundDecoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.black,)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(" user id is : ${posts[0]["userId"]}"),
                    Text(" title is  : ${posts[0]["title"]}"),
                    Text(("the body is : ${posts[0]["body"]}"))
                  ],
                ),
              ),


            )
            ,
            Container(
            height: 200,
            width: 500,
            margin: EdgeInsets.all(15),
            foregroundDecoration: BoxDecoration(border: Border.all(width: 2,color: Colors.black,)),
            child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
            children: [
            Text(" user id is : ${posts[1]["userId"]}"),
            SizedBox(height: 2,),
            Text(" title is  : ${posts[1]["title"]}"),
            SizedBox(height: 2,),
            Text(("the body is : ${posts[1]["body"]}"))
            ],
            ),
            ),
            ),
            Container(
            height: 200,
            width: 500,
            margin: EdgeInsets.all(15),
            foregroundDecoration: BoxDecoration(border: Border.all(width: 2,color: Colors.black,)),
            child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
            children: [
            Text(" user id is : ${posts[2]["userId"]}"),
            SizedBox(height: 2,),
            Text(" title is  : ${posts[2]["title"]}"),
            SizedBox(height: 2,),
            Text(("the body is : ${posts[2]["body"]}"))
            ],
            ),
            )
            ,
            )
            ,
            ]
            ,
            // if we need to get all data from the API so we should write   Text(("the body is : ${posts[index]["body"]}"))
            );
          },),
      ),
    );
  }
}
