import 'package:flutter/material.dart';
import 'package:pokeapp/models/common_type.dart';
import 'package:pokeapp/ui/common/ui_helpers.dart';
import 'package:pokeapp/utils/app_theme.dart';
import 'package:pokeapp/utils/screen_helper.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required this.filters,
    required this.onChanged,
    required this.onClearFilters,
    required this.onApplyFilters,
    required this.filterCount,
    this.backgroundColor,
  });

  final List<CommonType> filters;
  final void Function(bool? value, CommonType type) onChanged;
  final VoidCallback onClearFilters;
  final VoidCallback onApplyFilters;
  final Color? backgroundColor;

  final int filterCount;

  @override
  Widget build(BuildContext context) {
    final ScreenHelper display = ScreenHelper();

    return Drawer(
      width: MediaQuery.of(context).size.width *
          (display.isMobile(context) ? 0.8 : 0.5),
      elevation: 0,
      backgroundColor: backgroundColor,
      child: Container(
        margin: const EdgeInsets.fromLTRB(
          AppTheme.padding,
          AppTheme.padding,
          AppTheme.padding,
          0,
        ),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpaceTiny,
            Row(
              children: [
                const Text(
                  'Filtrar:',
                  style: AppTheme.title,
                ),
                const Spacer(),
                filterCount != 0
                    ? TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.redAccent.withOpacity(0.2),
                        ),
                        onPressed: onClearFilters,
                        child: const Text(
                          'Limpiar',
                          style: TextStyle(
                            color: Colors.redAccent,
                          ),
                        ),
                      )
                    : Container(),
                horizontalSpaceTiny,
                filterCount != 0 && !display.isMobile(context)
                    ? TextButton(
                        onPressed: onApplyFilters,
                        child: Text(
                          'Aplicar ($filterCount)',
                        ),
                      )
                    : Container(),
              ],
            ),
            const Divider(),
            SingleChildScrollView(
              clipBehavior: Clip.antiAlias,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...filters.map(
                    (filter) => CheckboxListTile(
                      checkColor: Colors.white,
                      activeColor: AppTheme.primary,
                      title: Text(
                        filter.name,
                        style: AppTheme.subtitle.copyWith(
                          color: filter.isSelected ? AppTheme.primary : null,
                        ),
                      ),
                      value: filter.isSelected,
                      onChanged: (value) => onChanged(value, filter),
                    ),
                  ),
                ],
              ),
            ),
            verticalSpaceMedium,
          ],
        ),
      ),
    );
  }
}
