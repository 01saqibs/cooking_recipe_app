import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants/constant.dart';
import '../custom_widgets/cutom_container.dart';

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


