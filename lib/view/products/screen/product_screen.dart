import 'package:arfi_project/core/core_config/config_dimension.dart';
import 'package:arfi_project/core/core_functions/functions.dart';
import 'package:arfi_project/data/vo/counting_unit_vo.dart';
import 'package:arfi_project/view/home/widgets/common_grid_widget.dart';
import 'package:arfi_project/view/products/bloc/products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  final String gender, color, category;
  final List<CountingUnitVO>? unitList;
  const ProductScreen({
    Key? key,
    required this.gender,
    required this.color,
    required this.category,
    required this.unitList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductBloc(unitList, color, gender, category),
      child: Scaffold(
        appBar: Functions.commonAppBarWithBack(context, category),
        body: SingleChildScrollView(
          child: Consumer<ProductBloc>(
            builder: (context, bloc, child) => (bloc.isLoading)
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : CommonGridWidget(
                    title: "",
                    visibleTitle: false,
                    mainExtent: scaleHeight(context) / 2.65,
                    itemWidth: scaleWidth(context) / 2.3,
                    itemHeight: scaleHeight(context) / 3.8,
                    unitList: bloc.unitList,
                  ),
          ),
        ),
      ),
    );
  }
}
