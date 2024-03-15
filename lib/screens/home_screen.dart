import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants/constant.dart';
import '../custom_widgets/cutom_container.dart';
import 'detailed_screen.dart';

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
                // Top Icons
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

                // BreakFast Typography

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

                // Categories and list of items

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Rotated Categories list

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

                    // Containers list (Page View)

                    Expanded(
                      child: SizedBox(
                        height: 450,
                        child: PageView.builder(
                            physics: const BouncingScrollPhysics(),
                            onPageChanged: (int applyIndex) {
                              setState(() {
                                currentIndex = applyIndex;
                              });
                            },
                            controller: controller,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (BuildContext context) {
                                    return const DetailedScreen();
                                  }));
                                },
                                child: CustomContainer(
                                  currentIndex: currentIndex,
                                  index: index,
                                ),
                              );
                            }),
                      ),
                    )
                  ],
                ),

                // Bottom icon and list of food category
                Container(
                  padding: const EdgeInsets.only(left: padding),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.filter_list,
                        size: 28,
                        color: Colors.black38,
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              final list = ["Juices", "Foods", "Others"];
                              return Padding(
                                padding: const EdgeInsets.only(right: 30),
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: index == 1
                                          ? greenColor
                                          : Colors.black.withOpacity(0.05)),
                                  child: Text(
                                    list[index],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: index == 1
                                            ? Colors.white
                                            : Colors.black.withOpacity(0.30)),
                                  ),
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
