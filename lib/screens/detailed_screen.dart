import 'package:cooking_recipe_app/constants/constant.dart';

import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailedScreen extends StatefulWidget {
  const DetailedScreen({super.key});

  @override
  State<DetailedScreen> createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor2,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, right: 30, left: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                FontAwesomeIcons.arrowLeft,
                                color: Colors.black87,
                                size: 20,
                              )),
                          const Spacer(),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                FontAwesomeIcons.magnifyingGlass,
                                color: Colors.black87,
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
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: RichText(
                            text: TextSpan(
                                style: Theme.of(context).textTheme.bodyLarge,
                                children: const [
                              TextSpan(
                                  text: "blue",
                                  style: TextStyle(
                                      color: textColor,
                                      fontSize: 40,
                                      fontWeight: FontWeight.w100)),
                              TextSpan(
                                  text: "Salad",
                                  style: TextStyle(
                                      color: textColor,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold)),
                            ])),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.40,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                ),
                child: ListView(
                  padding: const EdgeInsets.only(
                      top: 40, left: 30, right: 30, bottom: 30),
                  children: const [
                    Text(
                      "Direactions",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            right: -80,
            left: 30,
            top: MediaQuery.of(context).size.height * 0.22,
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.clock,
                            size: 18,
                            color: greenColor,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "32 MINS",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.supervisor_account_outlined,
                            size: 22,
                            color: greenColor,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "2 PEOPLE",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.local_fire_department_outlined,
                            size: 22,
                            color: greenColor,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "23 CALORIES",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        spreadRadius: -5,
                        offset: const Offset(15, 15),
                        blurRadius: 20)
                  ]),
                  child: const Image(
                    image: AssetImage("assets/images/salad.png"),
                    height: 250,
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
