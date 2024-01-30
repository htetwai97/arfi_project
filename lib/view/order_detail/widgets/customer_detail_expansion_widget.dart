import 'package:arfi_project/core/core_config/config_color.dart';
import 'package:arfi_project/core/core_config/config_style.dart';
import 'package:flutter/material.dart';

class CustomerDetailExpansionWidget extends StatelessWidget {
  final String name, email, phone, address;
  const CustomerDetailExpansionWidget({
    super.key,
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        "Customer Detail",
        style: ConfigStyle.boldStyleThree(
          14,
          BLACK_HEAVY,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 120,
                    child: Text(
                      "Name",
                      style: ConfigStyle.regularStyleThree(14, BLACK_HEAVY),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      name,
                      style: ConfigStyle.regularStyleThree(14, BLACK_HEAVY),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 120,
                    child: Text(
                      "Email",
                      style: ConfigStyle.regularStyleThree(14, BLACK_HEAVY),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      email,
                      style: ConfigStyle.regularStyleThree(14, BLACK_HEAVY),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 120,
                    child: Text(
                      "Phone",
                      style: ConfigStyle.regularStyleThree(14, BLACK_HEAVY),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      phone,
                      style: ConfigStyle.regularStyleThree(14, BLACK_HEAVY),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 120,
                    child: Text(
                      "Address",
                      style: ConfigStyle.regularStyleThree(14, BLACK_HEAVY),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      address,
                      style: ConfigStyle.regularStyleThree(14, BLACK_HEAVY),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }
}
