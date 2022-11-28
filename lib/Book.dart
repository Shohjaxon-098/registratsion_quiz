import 'package:flutter/material.dart';



class BookPage extends StatefulWidget {
  const BookPage({ Key? key }) : super(key: key);

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
    title: Text("8-sinf Biologiya Kitobi"),
    ),
    body: SingleChildScrollView(
      child: Container(
         child: Text(""),
      ),
    ),
    );
    
  }
}