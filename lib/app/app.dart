import 'package:pokeapp/services/pokemon_service.dart';
import 'package:pokeapp/ui/views/home/home_view.dart';
import 'package:pokeapp/ui/views/pokemon_detail/pokemon_detail_view.dart';
import 'package:pokeapp/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: PokemonDetailView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: PokemonService),
// @stacked-service
  ],
)
class App {}
