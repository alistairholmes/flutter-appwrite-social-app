import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 390,
                width: 370,
                child: Card(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: Image.network(
                              'https://images.unsplash.com/photo-1574986849078-0123e6045aa3?ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80',
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('masonlee'),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 350,
                          height: 300,
                          child: Image.network(
                            'https://images.unsplash.com/photo-1574986849078-0123e6045aa3?ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text('I turn coffee into code, time to fill up.')
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
