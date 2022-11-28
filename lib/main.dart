import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hiveapp/Book.dart';
import 'package:hiveapp/container.dart';
import 'package:hiveapp/home_page.dart';
import 'package:form_field_validator/form_field_validator.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 18, 31, 111),
        title: Text(
          "Testga Kirish ",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/biologiya.jpg"),
                            fit: BoxFit.fill),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.save),
              title: ElevatedButton(
                onPressed: () {
                
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookPage(),
                    ),
                  );
                },
                child: Text(
                  "Biologiya 8-sinf Kitobi",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(primary: Colors.white),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: ListView(
            padding: EdgeInsets.only(top: 50, left: 40, right: 40),
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    child: Text(
                      "Biologiyadan 20 ta test",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 200,
                width: 200,
                child: Image(
                  image: AssetImage("assets/loogin.png"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(
                  color: Colors.white,
                ),
              ),
              TextFormField(
                validator: MultiValidator([
                  RequiredValidator(errorText: "Ismingizni Kiriting **"),
                ]),
                obscureText: false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)),
                    labelText: "Ismingizni Kiriting"),
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              TextFormField(
                obscureText: false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)),
                    labelText: "Familiyangizni Kiriting"),
                validator:
                    RequiredValidator(errorText: "Familiyangizni Kiriting **"),
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (formKey.currentState!.validate()) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    }
                  });
                },
                child: Text(
                  "Kirish",
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(100, 50), shape: StadiumBorder()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  }

