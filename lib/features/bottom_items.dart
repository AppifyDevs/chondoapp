import 'package:chondohealth/core/widgets/nav/nav_bar_model.dart';
import 'package:chondohealth/features/home/views/home_screen.dart';
import 'package:chondohealth/features/profile/views/profile_screen.dart';
import 'package:chondohealth/gen/assets.gen.dart';
import 'package:chondohealth/util/extensions/extension.dart';
import 'package:chondohealth/util/services/navigation_service.dart';

List<NavigationBarItem> rootBodyitems = [
  /// Home
  NavigationBarItem(
    icon: Assets.bottom.home,
    child: const SHome(),
  ),
  NavigationBarItem(
    icon: Assets.bottom.calendar,
    selectedColor: NavigationService.currentContext.themes.buttonTheme.colorScheme?.primary,
  ),
  NavigationBarItem(
    icon: Assets.bottom.contact,
    selectedColor: NavigationService.currentContext.themes.buttonTheme.colorScheme?.primary,
  ),
  NavigationBarItem(
    icon: Assets.bottom.videos,
    selectedColor: NavigationService.currentContext.themes.buttonTheme.colorScheme?.primary,
  ),

  NavigationBarItem(
    icon: Assets.bottom.menu,
    selectedColor: NavigationService.currentContext.themes.buttonTheme.colorScheme?.primary,
    child: const SProfile(),
  ),
];
