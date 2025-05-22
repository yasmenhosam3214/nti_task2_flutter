import 'package:flutter/material.dart';
import 'package:nti_task2_flutter/main.dart';
import 'package:nti_task2_flutter/navs/HomeScreen.dart';
import 'package:nti_task2_flutter/navs/ordersScreen.dart';

class MenuScreen extends StatefulWidget {
  final String id;
  final String image;
  final String name;
  final String desc;
  final List<Map<String, String>> foods;

  const MenuScreen({
    super.key,
    required this.id,
    required this.image,
    required this.name,
    required this.desc,
    required this.foods,
  });

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  List<Map<String, dynamic>> filteredFoods = [];
  List<Map<String, dynamic>> myOrders = [];
  List<Map<String, dynamic>> FinalOrders = [];
  String selectedOption = "Pickup";
  TextEditingController contactController = TextEditingController();
  DateTime? MyDateTime;

  @override
  void initState() {
    super.initState();
    filteredFoods =
        widget.foods.where((menu) => menu['id'] != widget.id).toList();
  }

  void _addToOrder(Map<String, dynamic> foodItem) {
    final index = myOrders.indexWhere(
      (order) => order['orderID'] == foodItem['id'],
    );
    if (index != -1) {
      setState(() {
        myOrders[index]['quantity'] += 1;
      });
    } else {
      setState(() {
        myOrders.add({
          "orderID": foodItem['id'],
          "orderName": foodItem['name'],
          "orderDesc": foodItem['description'],
          "orderImage": foodItem['image'],
          "numItems": foodItem['num'] ?? "",
          "type": foodItem['type'] ?? "",
          "quantity": 1,
          "date": foodItem['datetime'] ?? "",
        });
      });
    }
  }

  void _increaseQuantity(int orderIndex) {
    setState(() {
      myOrders[orderIndex]['quantity'] += 1;
    });
  }

  void _decreaseQuantity(int orderIndex) {
    setState(() {
      if (myOrders[orderIndex]['quantity'] > 1) {
        myOrders[orderIndex]['quantity'] -= 1;
      } else {
        myOrders.removeAt(orderIndex);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 45, left: 25),
              child: Text(
                "Order Details",
                style: TextStyle(color: Colors.black, fontSize: 22),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Container(
                width: 228,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 100,
                      height: 50,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            selectedOption = "Delivery";
                          });
                        },
                        style: TextButton.styleFrom(
                          backgroundColor:
                              selectedOption == "Delivery"
                                  ? Colors.pink.shade50
                                  : Colors.transparent,
                        ),
                        child: const Text("Delivery"),
                      ),
                    ),
                    const VerticalDivider(
                      color: Colors.black,
                      thickness: 2,
                      width: 20,
                    ),
                    Container(
                      width: 100,
                      height: 50,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            selectedOption = "Pickup";
                          });
                        },
                        style: TextButton.styleFrom(
                          backgroundColor:
                              selectedOption == "Pickup"
                                  ? Colors.pink.shade50
                                  : Colors.transparent,
                        ),
                        child: const Text("Pick up"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: contactController,
                decoration: const InputDecoration(
                  hintText: "Enter Your Contact Info",
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: TextButton(
                onPressed: () {
                  selectDateAndTime(context);
                },
                child: Text(
                  (MyDateTime != null) ? "$MyDateTime" : "Select Date And Time",
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Order Summary", style: TextStyle(fontSize: 28)),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: myOrders.length,
                itemBuilder: (context, index) {
                  var order = myOrders[index];
                  return ListTile(
                    leading: SizedBox(
                      height: 50,
                      width: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          order['orderImage']!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(order['orderName']),
                    subtitle: Text("Qty: ${order['quantity']}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () => _decreaseQuantity(index),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () => _increaseQuantity(index),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      FinalOrders =
                          myOrders.map((order) {
                            return {
                              'orderID': order['orderID'],
                              'orderName': order['orderName'],
                              'orderDesc': order['orderDesc'],
                              'orderImage': order['orderImage'],
                              'numItems': order['numItems'],
                              'type': selectedOption,
                              'quantity': order['quantity'],
                              'contact': contactController.text,
                              'datetime':
                                  MyDateTime?.toString() ?? 'Not selected',
                            };
                          }).toList();
                    });

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                            HomeView(orders: FinalOrders, changeTheme: () {}),
                      ),
                    );
                  },
                  child: Text("Submit", style: TextStyle(fontSize: 22)),
                ),
              ),
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              title: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black12, width: 2),
                  color: Colors.white.withOpacity(0.5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.name),
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(widget.image, fit: BoxFit.cover),
                  Positioned(
                    bottom: 8,
                    left: 8,
                    child: CircleAvatar(
                      backgroundColor: Colors.green.shade300,
                      radius: 25,
                      child: IconButton(
                        onPressed: () {
                          _addToOrder({
                            'id': widget.id,
                            'name': widget.name,
                            'description': widget.desc,
                            'image': widget.image,
                          });
                        },
                        icon: const Icon(
                          Icons.add_shopping_cart,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(widget.desc, style: const TextStyle(fontSize: 16)),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Menu",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              var foodMenu = filteredFoods[index];
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 13.0,
                  vertical: 8,
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(10),
                  leading: SizedBox(
                    height: 100,
                    width: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        foodMenu['image']!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(foodMenu['name']!),
                  subtitle: Text(foodMenu['description']!),
                  trailing: IconButton(
                    icon: const Icon(Icons.add, color: Colors.black, size: 30),
                    onPressed: () {
                      _addToOrder(foodMenu);
                    },
                  ),
                ),
              );
            }, childCount: filteredFoods.length),
          ),
        ],
      ),
    );
  }

  void selectDateAndTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2026),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        final DateTime selectedDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );

        setState(() {
          MyDateTime = selectedDateTime;
        });
      }
    }
  }
}
