import 'package:flutter/material.dart';

import '../utils/list.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isicon = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isicon = !isicon;
                });
              },
              icon: Icon(isicon ? Icons.grid_view : Icons.list))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: isicon
                ? GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.7),
                    itemCount: allQuoteData.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'DetailPage',
                            arguments: allQuoteData[index]);
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 2,
                                blurRadius: 8,
                                offset: Offset(4, 4),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(children: [
                              Image.asset(
                                allQuoteData[index]['path'],
                                height: 200,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              Spacer(),
                              Text(
                                ' ${allQuoteData[index]['fest']}',
                                style: TextStyle(
                                    fontSize: 14, fontStyle: FontStyle.italic),
                              ),
                            ]),
                          )),
                    ),
                  )
                : ListView.builder(
                    itemCount: allQuoteData.length,
                    itemBuilder: (context, index) {
                      final data = allQuoteData[index];
                      return ListTile(
                        contentPadding: const EdgeInsets.all(16.0),
                        title: Image.asset(
                          data['path'],
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        subtitle: Text(
                          '- ${data['fest']}',
                          style: TextStyle(
                              fontSize: 14, fontStyle: FontStyle.italic),
                        ),
                      );
                    })),
      ),
    );
  }
}
