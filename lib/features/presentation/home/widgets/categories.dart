import 'package:flutter/material.dart';
import 'package:nilam/core/widgets/network_image.dart';
import 'package:nilam/core/widgets/text.dart';
import 'package:nilam/features/data/data_sources/config.dart';
import 'package:nilam/features/domain/entities/all_blocks_response.dart';
import 'package:nilam/features/domain/entities/category_response.dart';

class CategoryB extends StatelessWidget {
  const CategoryB(
      {super.key,
      required this.block,
      required this.categories,
      required this.goToSearch,
      this.grid = 4});

  final BlockResponse block;
  final List<CategoryResponse> categories;
  final Function goToSearch;
  final int grid;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.all(10),
        shrinkWrap: true,
        itemCount: categories.length,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: grid,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1),
        itemBuilder: (BuildContext context, int index) {
          final item = categories[index];
          return GestureDetector(
            onTap: () {
              goToSearch(
                  "product/search?Page=1&Length=24&ParentCategoryId=${item.id}");
            },
            child: Container(
              padding: const EdgeInsets.all(5),
              child: Column(
                children: [
                  Expanded(
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          child: NetworkImageB(
                              imageUrl: baseUrl + (item.headerIconUrl ?? "")))),
                  TextB(text: item.name!, fontColor: Colors.black, maxLines: 1)
                ],
              ),
            ),
          );
        });
  }
}
