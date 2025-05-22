import 'package:flutter/material.dart';

import '../MenuScreen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List<Map<String, String>> foods = [
    {
      "id": "1",
      "image":
          "https://th.bing.com/th/id/OIP.QgQo4hNgxc-hdqtzD2ZaSAHaEo?rs=1&pid=ImgDetMain",
      "name": "Spaghetti Carbonara",
      "description":
          "A classic Italian pasta dish made with eggs, cheese, pancetta, and pepper.",
    },
    {
      "id": "2",

      "image":
          "https://th.bing.com/th/id/OIP.3f4uw03GjHN2wa2tSeNc4wHaIu?rs=1&pid=ImgDetMain",
      "name": "Grilled Chicken Salad",
      "description":
          "Fresh greens topped with grilled chicken breast, tomatoes, cucumbers, and vinaigrette.",
    },
    {
      "id": "3",

      "image":
          "https://th.bing.com/th/id/OIP.lJ4EaOtNXeTZYoqX21OYXwHaLG?rs=1&pid=ImgDetMain",
      "name": "Sushi Platter",
      "description":
          "A delicious assortment of nigiri and sushi rolls with soy sauce and wasabi.",
    },
    {
      "id": "4",

      "image":
          "https://th.bing.com/th/id/OIP.4V28BgPzt1cCRLWpi-A-tgHaLG?w=683&h=1024&rs=1&pid=ImgDetMain",
      "name": "Avocado Toast",
      "description":
          "Toasted sourdough topped with smashed avocado, chili flakes, and poached egg.",
    },
    {
      "id": "5",
      "image":
          "https://th.bing.com/th/id/OIP.bjQuqqh4xYI7ybSeysPS2AHaFj?w=500&h=375&rs=1&pid=ImgDetMain",
      "name": "Cheeseburger Deluxe",
      "description":
          "Juicy beef patty with cheddar cheese, lettuce, tomato, onions, and pickles on a toasted bun.",
    },
    {
      "id": "6",
      "image":
          "https://th.bing.com/th/id/OIP.-SEeKo3A86pBJlZLI_FMSwHaE4?rs=1&pid=ImgDetMain",
      "name": "Spaghetti Carbonara",
      "description":
          "A classic Italian pasta dish made with eggs, cheese, pancetta, and pepper.",
    },
    {
      "id": "7",

      "image":
          "https://i.pinimg.com/originals/dd/ad/9c/ddad9c1348f63e58ec082e74102d94c1.jpg",
      "name": "Grilled Chicken Salad",
      "description":
          "Fresh greens topped with grilled chicken breast, tomatoes, cucumbers, and vinaigrette.",
    },
    {
      "id": "8",

      "image":
          "https://ichef.bbci.co.uk/food/ic/food_16x9_1600/recipes/red_lentil_and_aubergine_33187_16x9.jpg",
      "name": "Sushi Platter",
      "description":
          "A delicious assortment of nigiri and sushi rolls with soy sauce and wasabi.",
    },
    {
      "id": "9",

      "image":
          "https://images.food52.com/kWr1Bx7mt9efXac8i2PEfbuBINo=/fit-in/1200x0/b89ad9a6-8f01-4c73-b05f-539c3bc66cf1--IMG_4040.jpg",
      "name": "Avocado Toast",
      "description":
          "Toasted sourdough topped with smashed avocado, chili flakes, and poached egg.",
    },
    {
      "id": "10",
      "image":
          "https://www.awesomecuisine.com/wp-content/uploads/2024/06/Easy-Chicken-Recipes-For-Dinner-With-Few-Ingredients.png",
      "name": "Cheeseburger Deluxe",
      "description":
          "Juicy beef patty with cheddar cheese, lettuce, tomato, onions, and pickles on a toasted bun.",
    },
  ];

  List<Map<String, String>> comments = [
    {
      "comment":
          "This looks absolutely mouthwatering! Can't beat a classic Carbonara.",
      "time": "20 min ago",
    },
    {
      "comment": "Perfect choice for a healthy lunch. Love the freshness!",
      "time": "15 min ago",
    },
    {
      "comment": "Sushi game strong! I could eat this every day!",
      "time": "10 min ago",
    },
    {
      "comment":
          "Simple, nutritious, and delicious. Avocado toast is always a win!",
      "time": "5 min ago",
    },
    {
      "comment":
          "That burger looks insanely good! The cheese melt is on point.",
      "time": "Just now",
    },
  ];

  List<Map<String, String>> categories = [
    {
      "name": "Fast Food",
      "image":
          "https://th.bing.com/th/id/OIP.jzZEkPpg3kj9cTNfijyBIwHaEK?rs=1&pid=ImgDetMain",
    },
    {
      "name": "Sandwiches",
      "image":
          "https://th.bing.com/th/id/OIP.k6hKBbbjWhRD-jxynvecVQHaFP?rs=1&pid=ImgDetMain",
    },
    {
      "name": "Soup",
      "image":
          "https://th.bing.com/th/id/OIP.jng_G63m19b4-nwj2O08AwHaE7?rs=1&pid=ImgDetMain",
    },
    {
      "name": "Chinese Food",
      "image":
          "https://th.bing.com/th/id/OIP.RWxHHdgNaidR3t5IX6hkmAHaE8?rs=1&pid=ImgDetMain",
    },
    {
      "name": "Food With Vegetable",
      "image":
          "https://th.bing.com/th/id/R.ff35cd4e56a80ffe4776ab5dc31cd894?rik=CyPqQkmy03r9Fw&pid=ImgRaw&r=0",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "Food near me",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 250,
              child: ListView.builder(
                itemCount: foods.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var food = foods[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => MenuScreen(
                                id: food['id']!,
                                image: food['image']!,
                                desc: food['description']!,
                                name: food['name']!,
                                foods: foods,
                              ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: SizedBox(
                        width: 250,
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      topLeft: Radius.circular(10),
                                    ),
                                    child: Image.network(
                                      food['image']!,
                                      fit: BoxFit.cover,
                                      height: 140,
                                      width: double.infinity,
                                    ),
                                  ),
                                  Positioned(
                                    right: 0.0,
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 8.0,
                                    bottom: 8.0,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(food['name']!),
                                      Text(food['description']!),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "Friend\'s Activity",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                itemCount: comments.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var comment = comments[index];
                  return Container(
                    width: 280,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage: AssetImage("assets/donut.png"),
                              radius: 26,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    comment['comment']!,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    comment['time']!,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "Categories",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            SizedBox(
              height: 280,
              child: ListView.builder(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var cat = categories[index];
                  return Container(
                    width: 280,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      clipBehavior: Clip.antiAlias,
                      // clips content to rounded corners
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                            child: Image.network(
                              cat['image']!,
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                cat['name']!,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
