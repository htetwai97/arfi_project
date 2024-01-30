import 'package:arfi_project/connection_test_service/scaffold_with_connection_status.dart';
import 'package:arfi_project/core/core_config/config_color.dart';
import 'package:arfi_project/core/core_config/config_dimension.dart';
import 'package:arfi_project/core/core_config/config_style.dart';
import 'package:arfi_project/core/core_functions/functions.dart';
import 'package:arfi_project/view/article/bloc/article_bloc.dart';
import 'package:arfi_project/view/article/widgets/article_photo_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithConnectionStatus(
      child: SafeArea(
        child: ChangeNotifierProvider(
          create: (context) => ArticleBloc(),
          child: Selector<ArticleBloc, bool>(
            selector: (context, bloc) => bloc.isLoading,
            builder: (context, isLoading, child) => Stack(
              children: [
                Consumer<ArticleBloc>(builder: (context, bloc, child) {
                  return Scaffold(
                    appBar: Functions.commonAppBar(
                        "Articles", context, bloc.cartLength ?? 0),
                    body: ListView.separated(
                      padding: const EdgeInsets.all(DIMEN_SIXTEEN),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemBuilder: (c, i) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: DIMEN_SIXTEEN,
                              vertical: DIMEN_FOURTEEN - 4),
                          decoration: BoxDecoration(
                            color: MATERIAL_COLOR,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              Functions.buildBoxShadow(),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: SEPERATOR_COLOR, width: 0.5),
                                        color: MATERIAL_COLOR),
                                    child: const Center(
                                      child: Icon(
                                        Icons.person,
                                        size: 34,
                                        color: SEPERATOR_COLOR,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: DIMEN_SIXTEEN),
                                  Text(
                                    bloc.blogList?[i].author ?? "",
                                    style: ConfigStyle.regularStyleThree(
                                      DIMEN_FOURTEEN + 1,
                                      BLACK_HEAVY,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    bloc.blogList?[i].createdAt
                                            ?.substring(0, 10) ??
                                        "",
                                    style: ConfigStyle.regularStyleThree(
                                      DIMEN_FOURTEEN - 2,
                                      Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: DIMEN_FOURTEEN),
                              Text(
                                bloc.blogList?[i].title ?? "",
                                style: ConfigStyle.regularStyleTwoWithUnderLine(
                                  16,
                                  Colors.black,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                bloc.blogList?[i].subtitle ?? "",
                                style: ConfigStyle.boldStyleThree(
                                  14,
                                  Colors.black,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                bloc.blogList?[i].description ?? "",
                                style: ConfigStyle.regularStyleThree(
                                  13,
                                  Colors.black,
                                ),
                                maxLines: bloc.blogList?[i].isExpanded == false
                                    ? 3
                                    : 30,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: InkWell(
                                  onTap: () {
                                    bloc.onTapReadMoreOrLess(i);
                                  },
                                  child: Text(
                                    bloc.blogList?[i].isExpanded == false
                                        ? "Read More"
                                        : "Read Less",
                                    style: const TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: SEPERATOR_COLOR,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: DIMEN_FOURTEEN),
                              ArticleImageWidget(
                                url: bloc.blogList?[i].photo ?? "",
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (c, i) => SizedBox(
                        height: 40,
                        child: Center(
                          child: Container(
                            height: 1,
                            color: BLACK_HEAVY,
                          ),
                        ),
                      ),
                      itemCount: bloc.blogList?.length ?? 0,
                    ),
                  );
                }),
                Visibility(
                  visible: isLoading,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ArticleImageWidget extends StatelessWidget {
  final String url;
  const ArticleImageWidget({
    super.key,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Functions.bottomTopUp(
          context,
          ArticlePhotoViewWidget(
            url: url,
          ),
        );
      },
      child: SizedBox(
        width: scaleWidth(context),
        height: scaleHeight(context) / 5,
        child: Image.network(
          url,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
