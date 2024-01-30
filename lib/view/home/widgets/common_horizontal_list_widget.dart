import 'package:arfi_project/core/core_config/config_dimension.dart';
import 'package:arfi_project/view/home/widgets/home_item_detail_widget.dart';
import 'package:arfi_project/view/home/widgets/title_and_view_all_widget.dart';
import 'package:flutter/cupertino.dart';

class CommonHorizontalListWidget extends StatelessWidget {
  final String title;
  final double itemWidth, itemHeight, listHeight;
  const CommonHorizontalListWidget({
    Key? key,
    required this.title,
    required this.itemHeight,
    required this.itemWidth,
    required this.listHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: DIMEN_SIXTEEN,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleAndViewAllWidget(title: title),
          const SizedBox(height: DIMEN_FOURTEEN),
          SizedBox(
            height: listHeight,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (c, i) {
                return ItemDetailViewWidget(
                  onTap: () {},
                  itemHeight: itemHeight,
                  itemWidth: itemWidth,
                  name: "Navy Blue",
                  description: "Scrub Suit",
                  photo: "https://www.vastramedwear.com/wp-content/uploads/2022/12/60-1.png",
                );
              },
              separatorBuilder: (c, i) => const SizedBox(
                width: DIMEN_FOURTEEN,
              ),
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
