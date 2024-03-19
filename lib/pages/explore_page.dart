import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final List<String> _bookTitles = [
    'Token Black... Danielle Prescod',
    'Jackal K A THE A NOVEL',
    'NIGHT SHIP THE ULTIMA STE JESS KIDD',
    'The Night Ship Gerals\'s',
    'Erin E. Adams',
  ];

  final double _gridSpacing = 8.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _bookTitles.length,
                itemBuilder: (context, index) {
                  final double leftMargin = index == 0 ? _gridSpacing : 0;
                  final double topMargin = _gridSpacing;
                  final double rightMargin =
                      (index + 1) % 3 == 0 ? _gridSpacing : 0;
                  final double bottomMargin = _gridSpacing;

                  return Container(
                      margin: EdgeInsets.only(
                          left: leftMargin,
                          top: topMargin,
                          right: rightMargin,
                          bottom: bottomMargin),
                      width: 50,
                      height: 70,
                      child: Column(
                        children: [
                          Container(
                            width: 90,
                            height: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                    image: AssetImage(
                                        'lib/assets/images/bacheloretteNumberFive.jpeg'),
                                    fit: BoxFit.cover)),
                          )
                        ],
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
