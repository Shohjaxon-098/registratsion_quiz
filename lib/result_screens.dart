import 'package:hiveapp/home_page.dart';
import 'package:hiveapp/main.dart';
import 'package:flutter/material.dart';

class ResultScreens extends StatefulWidget {
  final int score;
  const ResultScreens(this.score, {Key? key}) : super(key: key);

  @override
  State<ResultScreens> createState() => _ResultScreensState();
}

class _ResultScreensState extends State<ResultScreens> {
  @override
  Widget build(BuildContext context) {
    Color mainColor = Color.fromARGB(255, 24, 7, 139);
    Color secondColor = Color.fromARGB(255, 51, 95, 225);
    return Container(
      child: Scaffold(
        backgroundColor: mainColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Tabriklayman",
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "sizning balingiz:",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "${widget.score}",
                style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 80,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 60,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                elevation: 0,
                color: Colors.yellow,
                child: Text(
                  "Testni qayta ishlash",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
