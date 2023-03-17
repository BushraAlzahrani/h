import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const String baseURL =
      'https://experimental.willow.vectara.io/v1/chat/completions';


 var msgRes = []; // save previous responses from the chat assistant (choices)

  talkToChatGpt(String role,String userMsg) async {
    // first save the user input in msgRes

    // then the save the data response in msgRes

    try {
      final response = await http.post(Uri.parse('${baseURL}'), body:
      json.encode( 
       {
        "model": "gpt-3.5-turbo",
        "messages": [
          {"role": role, "content": userMsg}
        ]
      })
     , headers: {
        'customer-id': '4271855006',
        'x-api-key': 'zqt__p9VnshHXErIL8kRx4GxGCMnyRfn0wzRclJp7Q',
      });
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());

        // msgRes.add(data)
        print('Added message!!!!!!!!!');
        print(data);
        return data;
      } else {
        print('error in response!!!!!!!');
        var data = jsonDecode(response.body.toString());
        print(data);
     
      }
    } catch (e) {
      print('error in catch!!!!!!!!');
      print(e.toString());
    }
  }


  getMsgMemory(String newUserMsg, List lastMsgs){

  // send the new msg as user

  // talkToChatGpt('user', newUserMsg);


  // var msgcompletion = talkToChatGpt(lastMsgs.toString());
  

  // var msgresponse = msgcompletion.choices[0].message.content;
  // print(msgresponse);

  // return msgresponse;
  }

   


    // var newMsg = getMsgMemory('',msgRes);
    // msgRes.add({"role": "assistant", "content": newMsg});



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // talkToChatGpt('describe yourself');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Text('data'),
        ));
  }
}
