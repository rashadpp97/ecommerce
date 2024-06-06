import 'package:flutter/material.dart';

class Secondpage extends StatelessWidget {
  const Secondpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(right: 14.0),
          child: Icon(
            Icons.keyboard_arrow_left,
            color: Color.fromARGB(255, 153, 153, 153),
            size: 26.4,
          ),
        ),
         actions: <Widget>[
          const Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: CircleAvatar(
              backgroundColor: Color.fromRGBO(255, 255, 255, 0.824),
              radius: 19,
              child: Icon(
                Icons.favorite,
                color: Color.fromARGB(255, 248, 10, 10),
                size: 16.4,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Container(
                height: 315,
                width: 315,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/nike.png",
                    ),
                    scale: 0.9,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 320,
            width: double.maxFinite,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(20.0))),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 12.0, top: 12),
                      child: Text(
                        "Puma Max",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 12.0, top: 12),
                      child: Text(
                        "\$100.00",
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 115, 201),
                          fontSize: 23,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 12.0),
                      child: Text("By Puma"),
                    ),
                    Spacer(),
                    Icon(Icons.star, color: Colors.amber),
                    Text("4.3"),
                    SizedBox(width: 13),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Container(
                        height: 30,
                        width: 55,
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Center(
                          child: Text(
                            "Size",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 50),
                    Container(
                      height: 30,
                      width: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: Center(
                        child: Text(
                          "Us 6",
                          style: TextStyle(
                              fontSize: 16, 
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Container(
                      height: 30,
                      width: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        color: const Color.fromARGB(255, 7, 7, 7),
                      ),
                      child: Center(
                        child: Text(
                          "Us 7",
                          style: TextStyle(
                             fontSize: 16, 
                             fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Container(
                      height: 30,
                      width: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: Center(
                        child: Text(
                          "Us 8",
                          style: TextStyle(
                            fontSize: 16, 
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Container(
                      height: 30,
                      width: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: Center(
                        child: Text(
                          "Us 9",
                          style: TextStyle(
                            fontSize: 16, 
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Container(
                        height: 30,
                        width: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        child: Center(
                          child: Text(
                            "Color",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 50),
                    Container(
                      height: 30,
                      width: 55,
                      child: CircleAvatar(
                        backgroundColor: Colors.amber,
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      height: 30,
                      width: 55,
                      child: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 7, 114, 255),
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      height: 30,
                      width: 55,
                      child: CircleAvatar(
                        backgroundColor: const Color.fromARGB(255, 7, 255, 255),
                      ),
                    ),
                    SizedBox(width: 15),
                    Container(
                      height: 30,
                      width: 55,
                      child: CircleAvatar(
                        backgroundColor: const Color.fromARGB(255, 255, 7, 69),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        child: Center(
                          child: Text(
                            "Description",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left:3.0),
                  child: Text("Sometimes fashion just looks fast"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
