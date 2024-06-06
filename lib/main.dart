import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
// To parse this JSON data, do

//     final ecommerce = ecommerceFromJson(jsonString);

List<Ecommerce> ecommerceFromJson(String str) =>
    List<Ecommerce>.from(json.decode(str).map((x) => Ecommerce.fromJson(x)));

String ecommerceToJson(List<Ecommerce> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Ecommerce {
  int? id;
  String? title;
  double? price;
  String? description;
  Category? category;
  String? image;
  Rating? rating;

  Ecommerce({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  factory Ecommerce.fromJson(Map<String, dynamic> json) => Ecommerce(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        description: json["description"],
        category: categoryValues.map[json["category"]],
        image: json["image"],
        rating: Rating.fromJson(json["rating"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": categoryValues.reverse[category],
        "image": image,
        "rating": rating,
      };
}

enum Category { ELECTRONICS, JEWELERY, MEN_S_CLOTHING, WOMEN_S_CLOTHING }

final categoryValues = EnumValues({
  "electronics": Category.ELECTRONICS,
  "jewelery": Category.JEWELERY,
  "men's clothing": Category.MEN_S_CLOTHING,
  "women's clothing": Category.WOMEN_S_CLOTHING
});

class Rating {
  double rate;
  int count;

  Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"]?.toDouble(),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

Future<List<Ecommerce>> fetchAlbums() async {
  final response =
      await http.get(Uri.parse('https://fakestoreapi.com/products'));
  print('API IS HERE ${response.statusCode}');
  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    return data.map((albumJson) => Ecommerce.fromJson(albumJson)).toList();
  } else {
    throw Exception('Failed to load albums');
  }
}

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 188, 179, 169),
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: const Color.fromRGBO(255, 188, 179, 169),
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          
          child: IconButton(
            icon: const Icon(
              Icons.grid_view_rounded,
              color: Color.fromRGBO(255, 77, 116, 0.702),
            ),
            onPressed: () {}, // omitting onPressed makes the button disabled
          ),
        ),
        title: const Text(
          'Home',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: CircleAvatar(
              backgroundColor: Color.fromRGBO(236, 227, 227, 0.824),
              radius: 19,
              child: Icon(
                Icons.badge,
                color: Color.fromARGB(255, 153, 151, 151),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/menpic.png'),
              backgroundColor: Colors.amber,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Container(
                    height: 40,
                    width: 324,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.all(Radius.circular(11)),
                    ),
                    child: const Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: TextField(
                              textAlign: TextAlign.left,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search),
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 16.0),
                                border: InputBorder.none,
                                hintText: 'search',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Container(
                    height: 40,
                    width: 48,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 253, 111, 170),
                      borderRadius: BorderRadius.all(Radius.circular(11)),
                    ),
                    child: const Icon(Icons.tune),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 17),
            Container(
              padding: const EdgeInsets.all(15.0),
              height: 155,
              width: 380,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(13)),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color.fromARGB(255, 76, 94, 252),
                    Color.fromARGB(255, 156, 235, 255),
                  ],
                ),
              ),
              child: Row(
                children: [
                  Container(
                    height: 170,
                    width: 107,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 127, 140, 252),
                      borderRadius: BorderRadius.all(Radius.circular(11)),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Beauty in your feet',
                          style: TextStyle(
                            color: Color.fromARGB(221, 255, 255, 255),
                            fontSize: 9,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          '50%',
                          style: TextStyle(
                            color: Color.fromARGB(221, 255, 255, 255),
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'OFF',
                          style: TextStyle(
                            color: Color.fromARGB(221, 255, 255, 255),
                            fontSize: 38,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: const DecorationImage(
                          image: AssetImage('assets/shoes.png'),
                          scale: 2.4,
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 112.0),
                    child: CircleAvatar(
                      child: Icon(
                        Icons.star,
                        size: 18.3,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      backgroundColor: Color.fromARGB(255, 138, 225, 247),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 18.0),
                  Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.all(Radius.circular(11)),
                    ),
                    height: 50,
                    width: 80,
                    child: const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Icon(
                            Icons.grid_view_rounded,
                            color: Color.fromRGBO(255, 77, 116, 0.702),
                          ),
                        ),
                        Text(
                          "All",
                          style: TextStyle(
                            color: Color.fromRGBO(255, 77, 116, 0.702),
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 18.0),
                  Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.all(Radius.circular(11)),
                    ),
                    height: 50,
                    width: 125,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset("assets/footwear.png"),
                        ),
                        const Text(
                          "Footwear",
                          style: TextStyle(
                            color: Color.fromRGBO(99, 97, 97, 0.702),
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 18.0),
                  Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.all(Radius.circular(11)),
                    ),
                    height: 50,
                    width: 105,
                    child: const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Icon(
                            Icons.watch,
                            color: Color.fromRGBO(46, 46, 46, 0.702),
                          ),
                        ),
                        Text(
                          "Watch",
                          style: TextStyle(
                            color: Color.fromRGBO(99, 97, 97, 0.702),
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 18.0),
                  Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.all(Radius.circular(11)),
                    ),
                    height: 50,
                    width: 105,
                    child: const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Icon(
                            Icons.badge,
                            color: Color.fromRGBO(46, 46, 46, 0.702),
                          ),
                        ),
                        Text(
                          "Bags",
                          style: TextStyle(
                            color: Color.fromRGBO(99, 97, 97, 0.702),
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 18.0),
                  Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.all(Radius.circular(11)),
                    ),
                    height: 50,
                    width: 105,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset("assets/tshirt.png"),
                        ),
                        const Text(
                          "T-Shirt",
                          style: TextStyle(
                            color: Color.fromRGBO(99, 97, 97, 0.702),
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 18),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "View all",
                    style: TextStyle(
                      fontSize: 14,
                      fontStyle: FontStyle.normal,
                      color: Colors
                          .black, // You can change the color to your preference
                    ),
                  ),
                ],
              ),
            ),
            FutureBuilder(
                future: fetchAlbums(),
                builder: (context, snapshot) {
                  print(snapshot.hasData);
                  print(snapshot.error);
                  print(snapshot.hasError);

                  print('ddddddddddddddddddddddd');
                  if (snapshot.hasData) {
                    return GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 20,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 8,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: 80,
                          height: 95,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                    width: 20,
                                  ),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    width: 115,
                                    height: 115,
                                    decoration: BoxDecoration(
                                      // borderRadius: BorderRadius.circular(12),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          snapshot.data![index].image ?? "",
                                        ),
                                        scale: 1.6,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    maxLines: 1,
                                    snapshot.data![index].title ?? "",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  Text(
                                    snapshot.data![index].price.toString() ??
                                        "",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  height: 19,
                                  width: 36,
                                  color: Color.fromARGB(255, 255, 255, 51),
                                  child: const Text(
                                    'New',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                }),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(255, 255, 254, 254),
        selectedItemColor: const Color.fromARGB(255, 189, 185, 185),
        unselectedItemColor:
            const Color.fromARGB(255, 189, 185, 185).withOpacity(0.90),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (value) {
          // Respond to item press.
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Home', // Change 'title' to 'label'
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Favorites', // Change 'title' to 'label'
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            label: 'Cart', // Change 'title' to 'label'
            icon: Icon(Icons.shopping_cart),
          ),
          BottomNavigationBarItem(
            label: 'User', // Change 'title' to 'label'
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
