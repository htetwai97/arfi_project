import 'dart:async';
import 'dart:ui' as ui;
import 'package:arfi_project/core/core_config/config_color.dart';
import 'package:arfi_project/core/core_config/config_dimension.dart';
import 'package:flutter/material.dart';

class ArticlePhotoViewWidget extends StatefulWidget {
  final String url;
  const ArticlePhotoViewWidget({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  State<ArticlePhotoViewWidget> createState() => _ArticlePhotoViewWidgetState();
}

class _ArticlePhotoViewWidgetState extends State<ArticlePhotoViewWidget> {
  double _imageWidth = 0.0;
  double _imageHeight = 0.0;
  @override
  void initState() {
    super.initState();
    Image image = Image.network(widget.url);
    Completer<ui.Image> completer = Completer<ui.Image>();
    image.image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener(
        (ImageInfo info, bool synchronousCall) {
          completer.complete(info.image);
          _imageWidth = info.image.width.toDouble();
          _imageHeight = info.image.height.toDouble();
          print(
              "Link ===> ${widget.url}\nWidth ===> $_imageWidth\nHeight ==> $_imageHeight");
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: BLACK_HEAVY,
        body: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              width: scaleWidth(context),
              height: scaleHeight(context),
              color: BLACK_HEAVY,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.url),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
              width: 50,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.close,
                  color: MATERIAL_COLOR,
                  size: DIMEN_TWENTY_EIGHT,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
