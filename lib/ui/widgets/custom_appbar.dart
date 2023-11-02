import 'package:flutter/material.dart';
import 'package:pokeapp/ui/common/ui_helpers.dart';
import 'package:pokeapp/ui/views/home/home_viewmodel.dart';
import 'package:pokeapp/utils/app_theme.dart';
import 'package:pokeapp/utils/screen_helper.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key, required this.viewModel});

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final ScreenHelper display = ScreenHelper();
    String? search = viewModel.searchController.text;

    return AppBar(
      toolbarHeight: 70,
      leading: display.isMobile(context) || display.isTablet(context)
          ? Builder(
              builder: (context) => Stack(
                alignment: Alignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.menu_rounded),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
                  viewModel.getTotalFilters() == 0
                      ? const SizedBox()
                      : Positioned(
                          right: 6,
                          top: 6,
                          child: Container(
                            width: 22,
                            height: 22,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.white),
                              borderRadius: BorderRadius.circular(90.0),
                              color: AppTheme.primary,
                            ),
                            child: Center(
                                child: Text(
                                    viewModel.getTotalFilters().toString())),
                          ),
                        )
                ],
              ),
            )
          : null,
      title: display.isMobile(context)
          ? const SizedBox()
          : Text(
              search.isEmpty ? 'Lista de pokemons' : 'Resultados de "$search"',
              style: AppTheme.subtitle.copyWith(color: Colors.white70),
            ),
      actions: [
        SizedBox(
          width: display.isMobile(context)
              ? MediaQuery.of(context).size.width - 72
              : 400,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AppTheme.padding / 2,
              ),
              child: TextFormField(
                controller: viewModel.searchController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, escribe el nombre del pokemon';
                  }
                  return null;
                },
                onFieldSubmitted: (value) => viewModel.searchPokemon(),
                decoration: InputDecoration(
                  hintText: 'Buscar por nombre',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: search.isEmpty
                      ? const SizedBox()
                      : IconButton(
                          onPressed: viewModel.clearSearch,
                          icon: const Icon(Icons.clear),
                        ),
                ),
                style: const TextStyle(color: Colors.white70),
              ),
            ),
          ),
        ),
        horizontalSpaceSmall,
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(70);
}
