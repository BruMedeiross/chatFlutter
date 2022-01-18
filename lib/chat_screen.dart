
import 'dart:io';
import 'package:chat/text_composer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ChatScreen extends StatefulWidget {


  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  Map<String, dynamic> data = {};

 //{} opcionais na mensagem ou img
  void _sendMessage({String text, File imgFile}) async {


    if (imgFile != null){

      UploadTask task = FirebaseStorage.instance
          .ref()
          .child(DateTime.now().millisecondsSinceEpoch.toString()
      ).putFile(imgFile);

      TaskSnapshot taskSnapshot = task.snapshot;
      String url = await taskSnapshot.ref.getDownloadURL();
      print(url);
    }

    FirebaseFirestore.instance.collection('messages').add({
      'text': text,
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: Text('Olá!'),
        elevation: 0,
      ),
      body: TextComposer(_sendMessage),
    );
  }
}



