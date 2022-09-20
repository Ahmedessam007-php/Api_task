import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class postposts extends StatefulWidget {
  const postposts({Key? key}) : super(key: key);

  @override
  State<postposts> createState() => _postpostsState();
}

class _postpostsState extends State<postposts> {
  Future<void> postposts() async {
    List postdata = [];
    try {
      Response response = await post(
          Uri.parse("https://jsonplaceholder.typicode.com/posts"),
          body: {
            "id": 1.toString(),
            "name": "Ahmed Essam",
            "email": "ahmedessam00718@gmail.com"
          });
      // List data = jsonDecode(response.body);
      /* setState(() {
            postdata.addAll(data);

          });*/
      print(response.body);
    } catch (e) {
      print("an error occured");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    postposts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Please press the button to add a post in API",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.white),),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: postposts,
                height: 50,
                shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                color: Colors.blue,
                child: Text("Send the post",style: TextStyle(color: Colors.white),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
