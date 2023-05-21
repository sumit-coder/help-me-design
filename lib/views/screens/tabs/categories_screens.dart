import 'package:flutter/material.dart';

import '../../../constants/text_constants.dart';
import '../../widgets/container_pattern_painter.dart';
import 'widgets/tab_view_hero_card.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 200,
      // height: 200,
      // color: Colors.deepPurple,
      child: Column(
        children: [
          TabViewHeroCard(
            // title: MyTextConstants.docsTabHeadline,
            title: "Learning.",
            shortDescription: MyTextConstants.docsTabShortDescription,
            posterImage: 'https://i.ibb.co/SNVPkKM/original-dd50f8430ab324b03b6af592e73ca6c7-removebg-preview.png',
            bgPattern: ContainerSquarePatternTwoPainter(44, context),
          ),
          Text('Categories'),
          IconButton(
            onPressed: () {
              longestConsecutive([100, 4, 200, 1, 3, 2]);
            },
            icon: Icon(Icons.question_answer),
          )
        ],
      ),
    );
  }

  int longestConsecutive(List<int> nums) {
    Set set = Set.from(nums);

    // for (var i = 0; i < nums.length; i++) {
    //   if (nums[i] == i) {}
    // }
    print(set);

    return 0;
  }
}
