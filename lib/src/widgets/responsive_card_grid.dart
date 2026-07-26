import 'package:flutter/material.dart';

import 'package:portfolio/src/utils/app_dimens.dart';

/// Lays cards out in as many columns as fit, where every card in a row shares
/// the height of the tallest one.
///
/// A [GridView] with a fixed `mainAxisExtent` cannot do this: content that
/// runs long (a wordy description, chips wrapping to an extra line) overflows
/// the tile instead of growing it.
class ResponsiveCardGrid extends StatelessWidget {
  const ResponsiveCardGrid({
    super.key,
    required this.children,
    this.minTileWidth = 360,
    this.maxColumns = 3,
    this.spacing = AppSpacing.md,
  });

  final List<Widget> children;
  final double minTileWidth;
  final int maxColumns;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final int columns =
            (constraints.maxWidth / minTileWidth).floor().clamp(1, maxColumns);
        final List<Widget> rows = [];

        for (int start = 0; start < children.length; start += columns) {
          final List<Widget> row = children.skip(start).take(columns).toList();

          rows.add(
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (int column = 0; column < columns; column++) ...[
                    if (column > 0) SizedBox(width: spacing),
                    // Empty slots keep the last row aligned with the ones
                    // above instead of stretching a lone card full width.
                    Expanded(
                      child: column < row.length
                          ? row[column]
                          : const SizedBox.shrink(),
                    ),
                  ],
                ],
              ),
            ),
          );
        }

        return Column(
          children: [
            for (int index = 0; index < rows.length; index++) ...[
              if (index > 0) SizedBox(height: spacing),
              rows[index],
            ],
          ],
        );
      },
    );
  }
}
