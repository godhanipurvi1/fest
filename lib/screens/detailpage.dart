import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Alignment selectedAlignment = Alignment.center;
  String? imgSelected;
  String userInputText = '';
  Alignment textAlignment = Alignment.bottomLeft;
  Color textColor = Colors.white;
  Color textBgColor = Colors.black54;
  bool showContainer = true;
  bool isBold = false;
  bool isItalic = false;
  bool isUnderlined = false;
  String selectedFont = 'Roboto';
  double fontSize = 18;
  double textOpacity = 1.0;

  final List<Color> colorList = [
    Colors.white,
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
  ];

  final List<String> fontList = [
    'Roboto',
    'Arial',
    'Courier New',
    'Georgia',
    'Times New Roman',
    'Verdana',
  ];

  @override
  Widget build(BuildContext context) {
    final Map fest = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 18),

              // Image Container
              Center(
                child: Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xFFBDB8B8),
                        offset: Offset(0, 4),
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(18.0),
                        child: Image.asset(
                          imgSelected ?? fest['path'], // Default image
                          height: 250,
                          width: 250,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: textAlignment,
                        child: showContainer
                            ? Container(
                                padding: const EdgeInsets.all(4.0),
                                color: textBgColor,
                                child: Opacity(
                                  opacity: textOpacity,
                                  child: Text(
                                    userInputText,
                                    style: TextStyle(
                                      color: textColor,
                                      fontSize: fontSize,
                                      fontWeight: isBold
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      fontStyle: isItalic
                                          ? FontStyle.italic
                                          : FontStyle.normal,
                                      decoration: isUnderlined
                                          ? TextDecoration.underline
                                          : TextDecoration.none,
                                      fontFamily: selectedFont,
                                    ),
                                  ),
                                ),
                              )
                            : Opacity(
                                opacity: textOpacity,
                                child: Text(
                                  userInputText,
                                  style: TextStyle(
                                    color: textColor,
                                    fontSize: fontSize,
                                    fontWeight: isBold
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    fontStyle: isItalic
                                        ? FontStyle.italic
                                        : FontStyle.normal,
                                    decoration: isUnderlined
                                        ? TextDecoration.underline
                                        : TextDecoration.none,
                                    fontFamily: selectedFont,
                                  ),
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Image Selection
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Choose an Image:'),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(fest['img']?.length ?? 0, (i) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              imgSelected = fest['img'][i];
                              textAlignment = Alignment.center;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 8.0),
                            child: Image.asset(
                              fest['img'][i],
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Text Input
              TextField(
                onChanged: (value) {
                  setState(() {
                    userInputText = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Enter text to display on image',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              // Text Alignment Selection
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Choose text alignment:'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.format_align_left,
                          color: selectedAlignment == Alignment.centerLeft
                              ? Colors.black
                              : Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            selectedAlignment = Alignment.centerLeft;
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.format_align_center,
                          color: selectedAlignment == Alignment.center
                              ? Colors.black
                              : Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            selectedAlignment = Alignment.center;
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.format_align_right,
                          color: selectedAlignment == Alignment.centerRight
                              ? Colors.black
                              : Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            selectedAlignment = Alignment.centerRight;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Text Color Selection
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Choose text color:'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: colorList.map((color) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            textColor = color;
                          });
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: color,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                offset: const Offset(0, 4),
                                blurRadius: 6.0,
                                spreadRadius: 1.0,
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Container Visibility Toggle
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Show Background Container:'),
                  Switch(
                    value: showContainer,
                    onChanged: (value) {
                      setState(() {
                        showContainer = value;
                      });
                    },
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Text Formatting Options
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Text Formatting:'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.format_bold,
                          color: isBold ? Colors.black : Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            isBold = !isBold;
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.format_italic,
                          color: isItalic ? Colors.black : Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            isItalic = !isItalic;
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.format_underline,
                          color: isUnderlined ? Colors.black : Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            isUnderlined = !isUnderlined;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Font Size Adjust Buttons
              Container(
                width: 150,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          fontSize += 1;
                        });
                      },
                      icon: const Icon(Icons.add),
                      tooltip: 'Increase Font Size',
                    ),
                    Text(
                      '$fontSize',
                      style: const TextStyle(fontSize: 18),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (fontSize > 8) {
                            fontSize -= 1;
                          }
                        });
                      },
                      icon: const Icon(Icons.remove),
                      tooltip: 'Decrease Font Size',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
