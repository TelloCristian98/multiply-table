import 'package:flutter/material.dart';

class tableScreen extends StatelessWidget{
 final int number; 
 const tableScreen({required this.number, super.key});
 
  @override
  Widget build(BuildContext context){
    List<String> results=List.generate(10, (i) => "${number}x${i + 1}=${number *(i+1)}");
    return Scaffold(
      appBar: AppBar(
        title: Text("Tabla de $number"),
         backgroundColor: Color.fromARGB(255, 181, 164, 237),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: 'CustomFont',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Center(
        child: Container(
            padding: const EdgeInsets.all(16.0),
            margin: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 208, 219, 224),
              border: Border.all(color: Colors.deepPurple, width: 2),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), 
                ),
              ],
            ),
             child: Column(
              mainAxisSize: MainAxisSize.min,
              children: results.map((result)=>Center(
                child: Text(result, style: TextStyle(fontSize: 18)),
              )).toList(),         
        ),
      ),
      ),
    );
  }

  
}