

import 'dart:math';

import 'package:flutter/foundation.dart';




import 'package:flutter/material.dart';

void main() {
  runApp( MaterialApp(home:App()));
}


class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}




class AppState extends State<App>{
  double width = 0.0;
  double yourWidth = 0.0;
  bool showDialog = false;

  var data=[];


  String title= "Hello";
  
  var random;
  void addItem(){
     

    setState(() {

      this.data.add({
        "title":this.title,
        "id":Random().nextInt(1000),
      });

    });
  }
  


  @override
  Widget build(BuildContext context) {
    this.width = MediaQuery.of(context).size.width;
    this.yourWidth = width * 50;



    return MaterialApp(
      home: Scaffold(
       
         floatingActionButton: FloatingActionButton(
        onPressed: () {
        setState(() {
       
      this.showDialog = true;
          
        });

        
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
        backgroundColor: Colors.red,
        appBar:AppBar(
          backgroundColor: Colors.red,
        title: const Text("Home"),
      ),
      
      body:
        Padding(
          padding: EdgeInsets.all(20),
          child: Column(children:<Widget>[
            if(this.showDialog)
                    Container(
                      width: yourWidth,
                      height: 200,
                      child:  Dialog(
                      
                  shape: RoundedRectangleBorder(
                  
                    borderRadius:BorderRadius.circular(20.0)),
                    child: Container(
                    constraints: BoxConstraints(maxHeight: 350),
                    child: Padding(
                      
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         
                          RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                              text:"Add Item : ",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Colors.black,
                                wordSpacing: 1
                              )
                            ),
                          ),

                           TextField(
                            onChanged: (val)=>{
                              this.setState(() {
                                this.title = val;
                              })

                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter Title',
                            ),
                          ),
                          Text(" "),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            
                            children: [
                                  TextButton(
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor:  MaterialStateProperty.all<Color>(Colors.blue)
                          ),
                          onPressed: () { 
                          addItem();
                          },
                          child: Text('Add'),
                        ),


                          TextButton(
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor:  MaterialStateProperty.all<Color>(Colors.red)
                          ),
                          onPressed: () { 
                          setState(() {
                            
                            this.showDialog = false;
                          });
                          },
                          child: Text('Close'),
                        )
                          ],),
                          
                        ],
                      ),
                    ),
                  ),
                ),
                    ),
                   




            for(int i=0; i<data.length; i++)
              Container(
            
            color:Colors.orange,
           
            margin: new EdgeInsets.only(top: 20),
            width:  this.yourWidth,
            height: 50,
            child: Padding(padding: new EdgeInsets.all(15),child: 
             Container(
            color: Colors.orange,
             
            width: this.yourWidth,
            height: 50,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
              Text(data[i]['title'].toString()),
              TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                backgroundColor:  MaterialStateProperty.all<Color>(Colors.red)
              ),
              onPressed: () { 
                setState(() {
                  this.data.remove(this.data[i]);

                });
              },
              child: Text('Delete'),
            )
            ]),
          ),
          ),
             
          ),
          ]
            

         

          ),
        )
       
      ),
    );
  }
}


