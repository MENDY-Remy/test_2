// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:a_dashboard_staring/responsive/responsive.dart';
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../models/my_files.dart';
import 'file_info_card.dart';

class MyFiles extends StatelessWidget {
  const MyFiles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //---
    final Size size = MediaQuery.of(context).size;
    //---
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "My Files",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            ElevatedButton.icon(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                  vertical:
                      defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                ),
              ),
              icon: const Icon(Icons.add),
              label: const Text("Add new"),
            ),
          ],
        ),
        //
        const SizedBox(height: defaultPadding),
        Responsive(
          mobile: FlileInfoCardGridView(
            crossAxisCount: size.width < 650 ? 2 : 4,
            childAspectRatio: size.width < 650 ? 1.3 : 1,
          ),
          tablet: const FlileInfoCardGridView(),
          desktop: FlileInfoCardGridView(
            childAspectRatio: size.width < 1400 ? 1.1 : 1.4,
          ),
        )
      ],
    );
  }
}

class FlileInfoCardGridView extends StatelessWidget {
  //
  final int crossAxisCount;
  final double childAspectRatio;

  //
  const FlileInfoCardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: demoMyFiels.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => FileInfoCard(
        info: demoMyFiels[index],
      ),
    );
  }
}
