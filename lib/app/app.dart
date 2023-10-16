import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';


@StackedApp(

  // Routes are empty for mobile projects, only used in web support projects.
  routes: [],
  dependencies: [
    LazySingleton(classType: NavigationService),
  ]
)


class AppSetup {}