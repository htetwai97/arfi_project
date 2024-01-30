import 'package:arfi_project/core/core_config/config_color.dart';
import 'package:arfi_project/core/core_config/config_dimension.dart';
import 'package:flutter/material.dart';

class BannerSectionView extends StatefulWidget {
  final List<String> urlList;
  const BannerSectionView({
    super.key,
    required this.urlList,
  });

  @override
  State<BannerSectionView> createState() => _BannerSectionViewState();
}

class _BannerSectionViewState extends State<BannerSectionView> {
  int _position = 0;
  late PageController _pageController;
  late List<Map<String, bool>> _imageObjList;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _position);
    _imageObjList = widget.urlList.map((e) {
      return {e: false};
    }).toList();
    for (int i = 0; i < _imageObjList.length; i++) {
      _imageObjList[i][widget.urlList[i]] = false;
    }
    _imageObjList[0][widget.urlList[0]] = true;
    setState(() {});
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: scaleHeight(context) / 1.7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: PageView(
            controller: _pageController,
            onPageChanged: (pageNum) {
              setState(() {
                for (int i = 0; i < _imageObjList.length; i++) {
                  _imageObjList[i][widget.urlList[i]] = false;
                }
                _imageObjList[pageNum][widget.urlList[pageNum]] = true;
                _position = pageNum;
              });
            },
            children: widget.urlList
                .map(
                  (url) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        url,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        //const SizedBox(height: 10),
        SizedBox(
          height: 60,
          child: ListView.separated(
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                radius: 20,
                splashColor: Colors.black12,
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  setState(() {
                    for (int i = 0; i < _imageObjList.length; i++) {
                      _imageObjList[i][widget.urlList[i]] = false;
                    }
                    _imageObjList[index][widget.urlList[index]] = true;
                    _position = index;
                    _pageController.jumpToPage(index);
                  });
                },
                child: Container(
                  height: _imageObjList[index][widget.urlList[index]] == true
                      ? 54.0
                      : 50.0,
                  width: _imageObjList[index][widget.urlList[index]] == true
                      ? 54.0
                      : 50.0,
                  margin: EdgeInsets.symmetric(
                    vertical:
                        _imageObjList[index][widget.urlList[index]] == true
                            ? 0
                            : 3,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      widget.urlList[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 14),
            itemCount: widget.urlList.length,
          ),
        )
      ],
    );
  }
}
