import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants/constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List categories = [
      "Bread",
      "Noodles",
      "Seafood",
    ];

    PageController controller = PageController(viewportFraction: 0.8);

    const double padding = 40;

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Positioned(
            right: 0,
            child: Container(
              width: size.width * 0.25,
              height: size.height,
              color: backgroundShed,
            ),
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: padding, right: padding, top: padding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            FontAwesomeIcons.magnifyingGlass,
                            color: Colors.black38,
                            size: 20,
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.grid_view_outlined,
                          size: 24,
                          color: Colors.black38,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: padding),
                  child: RichText(
                      text: TextSpan(
                          style: Theme.of(context).textTheme.bodyLarge,
                          children: const [
                        TextSpan(
                            text: "break",
                            style: TextStyle(
                                color: textColor,
                                fontSize: 40,
                                fontWeight: FontWeight.w100)),
                        TextSpan(
                            text: "fast",
                            style: TextStyle(
                                color: textColor,
                                fontSize: 40,
                                fontWeight: FontWeight.bold)),
                      ])),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Column(
                        children: List.generate(
                            categories.length,
                            (index) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    children: [
                                      Transform.rotate(
                                        angle: 300,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 40),
                                          child: Text(
                                            categories[index],
                                            style: TextStyle(
                                                color: index == 0
                                                    ? textColor
                                                    : Colors.black38,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w900),
                                          ),
                                        ),
                                      ),
                                      index == 0
                                          ? Container(
                                              height: 6,
                                              width: 6,
                                              decoration: const BoxDecoration(
                                                color: greenColor,
                                                shape: BoxShape.circle,
                                              ),
                                            )
                                          : const SizedBox(),
                                    ],
                                  ),
                                )),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 450,
                        child: PageView.builder(

                            onPageChanged: (int applyIndex) {
                              setState(() {
                                currentIndex = applyIndex;
                              });
                            },
                            controller: controller,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return CustomContainer(
                                currentIndex: currentIndex,
                                index: index,
                              );
                            }),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.currentIndex,
    required this.index,
  });

  final int currentIndex, index;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: EdgeInsets.only(
          right: 50, top: 40, bottom: currentIndex == index ? 30 : 60),
      decoration: BoxDecoration(
          color: backgroundColor2,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: currentIndex == index
                    ? Colors.black.withOpacity(0.15)
                    : Colors.black.withOpacity(0),
                spreadRadius: -7,
                offset: const Offset(12, 12),
                blurRadius: 25)
          ]),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -20,
            left: -20,
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: currentIndex == index
                            ? greenColor.withOpacity(0.8)
                            : Colors.black.withOpacity(0),
                        spreadRadius: -5,
                        offset: const Offset(10, 10),
                        blurRadius: 18)
                  ],
                  color: greenColor, shape: BoxShape.circle),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite,
                    size: 20,
                    color: Colors.white,
                  )),
            ),
          ),
          Positioned(
              right: -25,
              top: 30,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: currentIndex == index
                              ? Colors.black.withOpacity(0.15)
                              : Colors.black.withOpacity(0),
                          spreadRadius: -5,
                          offset: const Offset(15, 15),
                          blurRadius: 20)
                    ]
                ),
                child: AnimatedRotation(
                  turns: currentIndex == index ? 1/2 : 0,
                  duration: Duration(milliseconds: 400),
                  child: Image(

                    image: AssetImage("assets/images/salad.png"),
                    height: 150,
                  ),
                ),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 15, right: 10),
                      height: 10,
                      width: 10,
                      decoration: const BoxDecoration(
                        color: greenColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    RichText(
                        text: TextSpan(
                            style: Theme.of(context).textTheme.bodyLarge,
                            children: const [
                              TextSpan(
                                  text: "Blue",
                                  style: TextStyle(
                                      color: textColor,
                                      fontSize: 26,
                                      fontWeight: FontWeight.w100)),
                              TextSpan(
                                  text: "\nSalad",
                                  style: TextStyle(
                                      color: textColor,
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold)),
                            ])),
                  ],
                ),
                SizedBox(height: 20,),
                SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Text("A Salad is a dish consisting of a mixture of small pieces of food, usually vegetables.",
                  style: TextStyle(fontSize: 12),
                  maxLines: 4,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
