import 'package:flutter/material.dart';
import 'sliding_card.dart';
import 'data.dart';


class SlidingContainer extends StatefulWidget {
  const SlidingContainer({super.key});

  @override
  State<SlidingContainer> createState() => _SlidingContainerState();
}

class _SlidingContainerState extends State<SlidingContainer> {

  late final PageController pageController;
  double pageOffset = 0;


  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.84);
    pageController.addListener(() {
      setState(() => pageOffset = pageController.page ?? 0);
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: PageView(
        controller: pageController,
        children: List.generate(
          cards.length,
          (index) {
            return SlidingCard(
              card: cards[index],
              offset: pageOffset - index,
            );
          }
        ),
      ),
    );
  }
}
