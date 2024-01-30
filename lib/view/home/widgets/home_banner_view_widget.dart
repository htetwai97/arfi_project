import 'package:arfi_project/core/core_config/config_color.dart';
import 'package:arfi_project/core/core_config/config_dimension.dart';
import 'package:arfi_project/core/core_config/config_strings.dart';
import 'package:arfi_project/core/core_config/config_style.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class HomeBannerViewWidget extends StatefulWidget {
  final List<String> imageList;
  final Function onPressShopping;

  const HomeBannerViewWidget({
    super.key,
    required this.onPressShopping,
    required this.imageList,
  });

  @override
  State<HomeBannerViewWidget> createState() => _HomeBannerViewWidgetState();
}

class _HomeBannerViewWidgetState extends State<HomeBannerViewWidget> {
  int _position = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _position);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: scaleHeight(context) / 1.3,
          width: scaleWidth(context),
          child: PageView(
            controller: _pageController,
            onPageChanged: (pageNum) {
              setState(() {
                _position = pageNum;
              });
            },
            children: widget.imageList
                .map(
                  (e) => Image.asset(
                    e,
                    fit: BoxFit.cover,
                  ),
                )
                .toList(),
          ),
        ),
        Column(
          children: [
            SizedBox(height: scaleHeight(context) / 4),
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: DIMEN_SIXTEEN, vertical: DIMEN_FOURTEEN - 4),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 0.3),
              ),
              child: Text(
                CONTENT_ONE,
                style: ConfigStyle.regularStyleThree(
                  DIMEN_FOURTEEN,
                  MATERIAL_COLOR,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Visibility(
              visible: (widget.imageList.length != 0),
              child: DotsIndicator(
                dotsCount: (widget.imageList.length == 0)
                    ? 1
                    : widget.imageList.length,
                position: _position,
                decorator: DotsDecorator(
                  size: const Size.square(9.0),
                  activeSize: const Size(18.0, 9.0),
                  activeColor: SEPERATOR_COLOR,
                  color: Colors.grey,
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  SEPERATOR_COLOR,
                ),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(
                      horizontal: DIMEN_TWENTY_EIGHT * 2),
                ),
              ),
              onPressed: () {
                widget.onPressShopping();
              },
              child: Text(
                "Start Shopping",
                style: ConfigStyle.regularStyleThree(
                  DIMEN_FOURTEEN,
                  MATERIAL_COLOR,
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        )
      ],
    );
  }
}
