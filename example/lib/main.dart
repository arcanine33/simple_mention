import 'package:flutter/material.dart';
import 'package:simple_mention/simple_mention.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
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
  late MentionTextFieldController controller;
  List<MentionMemberModel> list = [];
  @override
  void initState() {

    controller = MentionTextFieldController(
        myName: 'James Anderson', memberList: [
      MentionMemberModel(uid: '1', name: 'Emily Thompson', picture: 'assets/b.jpg'),
      MentionMemberModel(uid: '2', name: 'Oliver Smith', picture: 'assets/a.jpg'),
      MentionMemberModel(uid: '3', name: 'Sophia Johnson', picture: ''),
      MentionMemberModel(uid: '4', name: 'Elijah Williams', picture: ''),
      MentionMemberModel(uid: '5', name: 'Olivia Jones', picture: ''),
      MentionMemberModel(uid: '6', name: 'William Brown', picture: 'assets/d.jpg'),
      MentionMemberModel(uid: '7', name: 'Ava Davis', picture: 'assets/c.jpg'),
      MentionMemberModel(uid: '8', name: 'James Miller', picture: ''),
      MentionMemberModel(uid: '9', name: 'Isabella Wilson', picture: 'assets/e.jpg'),
      MentionMemberModel(uid: '10', name: '홍길동', picture: ''),
      MentionMemberModel(uid: '11', name: '너무 멋진 강아지', picture: ''),
      MentionMemberModel(uid: '12', name: '행복한 다람쥐', picture: ''),
      MentionMemberModel(uid: '13', name: '조용한 고양이', picture: ''),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: MentionTextField(
          controller: controller,
        )
      ),
    );
  }
}
