import 'package:chat/chat_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(MyApp());

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        //defininto cor de todos os icones
        iconTheme: IconThemeData(
          color: Colors.blueAccent,
        )
      ),
      home: ChatScreen(),
    );
  }
}

/*
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();

// escrevendo dados-
// FirebaseFirestore.instance.collection("mensagens").doc().collection("arquivos").doc().set({"texto":"Olá"});

//lendo dados I
QuerySnapshot snapshot =  await FirebaseFirestore.instance.collection("col").get();

snapshot.docs.forEach((d) {
print(d.data());
print(d.id);
d.reference.update({'lido': true});
print(" ");
});

//lendo dados II
//document diferente de queySnapshot = query (varios documentos) document ( apenas um documento)
DocumentSnapshot snap =  await FirebaseFirestore.instance.collection("mensagens").doc("NddPP7ZL2q1VqWy8yxiC").get();
print(snap.data());

//atualização em tempo real
FirebaseFirestore.instance.collection("mensagens").snapshots().listen((dado){
dado.docs.forEach((element) {
print(element.data());
});
});

//atualização em tempo real de um documento especifico
FirebaseFirestore.instance.collection("col").doc("doc2").snapshots().listen((dado){
print(dado.data());
});

 */