import 'package:flutter/material.dart';

import '../constants/constant.dart';

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
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: currentIndex == index
                        ? greenColor.withOpacity(0.8)
                        : Colors.black.withOpacity(0),
                    spreadRadius: -5,
                    offset: const Offset(10, 10),
                    blurRadius: 18)
              ], color: greenColor, shape: BoxShape.circle),
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
                decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                  BoxShadow(
                      color: currentIndex == index
                          ? Colors.black.withOpacity(0.15)
                          : Colors.black.withOpacity(0),
                      spreadRadius: -5,
                      offset: const Offset(15, 15),
                      blurRadius: 20)
                ]),
                child: AnimatedRotation(
                  turns: currentIndex == index ? 1 / 2 : 0,
                  duration: const Duration(milliseconds: 400),
                  child: const Image(
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
                      margin: const EdgeInsets.only(top: 15, right: 10),
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
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Text(
                    "A Salad is a dish consisting of a mixture of small pieces of food, usually vegetables.",
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
