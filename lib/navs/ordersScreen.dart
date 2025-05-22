import 'package:flutter/material.dart';

class OrdersScreen extends StatefulWidget {
  final List<Map<String, dynamic>> orders;

  OrdersScreen({super.key, required this.orders});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  String selectedOption = "Delivery";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          widget.orders.length == 0
              ? Center(child: Text("No Orders Yet"))
              : Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: ListView.builder(
                    itemCount: widget.orders.length,
                    itemBuilder: (context, index) {
                      final order = widget.orders[index];
                      return InkWell(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 2,
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  order['orderImage'],
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Order Date: ${order['datetime']}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.delivery_dining,
                                          size: 16,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          order['type'],
                                          style: const TextStyle(
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 3),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.shopping_bag,
                                          size: 16,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          "${order['quantity']} items",
                                          style: const TextStyle(
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
    );
  }
}
