import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hiveapp/main.dart';
import 'package:hiveapp/question_list.dart';
import 'package:hiveapp/result_screens.dart';

void main(List<String> args) {
  runApp(MyApp());


}


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color mainColor=Color.fromARGB(255, 24, 7, 139);
  Color secondColor=Color.fromARGB(255, 51, 95, 225);
  PageController? _controller=PageController(initialPage: 0);
  bool isPressed=false;
  Color istrue=Colors.green;
  Color isWrong =Colors.red;
  Color binColor= Color.fromARGB(255, 51, 95, 225);
  int score= 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 18, 31, 111),
        title: Text("Biologiya 8-sinf Test"),),
       backgroundColor: mainColor,
      
       drawer: Drawer(),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: PageView.builder(
          physics: NeverScrollableScrollPhysics(),
          controller: _controller!,
          onPageChanged: (Page){
            setState(() {
              isPressed=false;
            });
            
          },
          itemCount: questions.length,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               SizedBox(
                width: double.infinity,
                 child: Text(
                  "Savollar ${index+1}/${questions.length}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
                  ),
               ),
                const Divider(
                  height: 8,
                  thickness: 2,
                  color: Colors.white,
                ),
               const SizedBox(
                  height: 20,
                ),
                Text(questions[index].question!,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                color: Colors.white),
                ),
                SizedBox(
                  height: 25,
                ),
                for(int i=0;i<questions[index].answers!.length;i++)
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 15),
                 
                  child: MaterialButton(
                    shape: StadiumBorder(),
                    color: isPressed?questions[index].answers!.entries.toList()[i].value?istrue:isWrong:secondColor,
                     padding: EdgeInsets.symmetric(vertical: 18),
                    onPressed: isPressed? (){}:(){
                      
                        setState(() {
                          isPressed=true;
                        });
                      if(questions[index].answers!.entries.toList()[i].value){
                        score+=10;
                        print(score);
                      }
                    },
                    
                  child: Text(questions[index].answers!.keys.toList()[i],                    
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white
                  ),
                  ),
                  ),
                ),
                SizedBox(
                  height: 45,

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,

                  children: [
                    ElevatedButton(

                      onPressed: isPressed?
                       index + 1==questions.length?(){
                        Navigator.push(
                          context, MaterialPageRoute(
                            builder: (context)=>ResultScreens(score),),
                        );
                       }:
                       (){_controller!.nextPage(
                          duration: Duration(milliseconds: 300), 
                          curve: Curves.decelerate);
                          setState(() {
                            isPressed=false;
                          });
                          
                          }:null,
                          style: OutlinedButton.styleFrom(
                            shape: StadiumBorder(),
                            side: BorderSide(color: Colors.yellow,width: 1)
                          ),
                          


                    child: Text(index + 1==questions.length
                    ?"Natijani ko`rish"
                    :"Keyingi Savol",
                    style: TextStyle(color: Colors.white),
                    ),
                    
                    ),
                  ],
                ),
              ],
            );
          } ,
          ),
      ),
    );
  }
}
