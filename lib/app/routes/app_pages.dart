import 'package:get/get.dart';

import '../modules/admin_add_item/bindings/admin_add_item_binding.dart';
import '../modules/admin_add_item/views/admin_add_item_view.dart';
import '../modules/admin_edit_item/bindings/admin_edit_item_binding.dart';
import '../modules/admin_edit_item/views/admin_edit_item_view.dart';
import '../modules/admin_home/bindings/admin_home_binding.dart';
import '../modules/admin_home/views/admin_home_view.dart';
import '../modules/admin_listItem/bindings/admin_list_item_binding.dart';
import '../modules/admin_listItem/views/admin_list_item_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/signUp/bindings/sign_up_binding.dart';
import '../modules/signUp/views/sign_up_view.dart';
import '../modules/user_maps/bindings/user_maps_binding.dart';
import '../modules/user_maps/views/user_maps_view.dart';
import '../modules/user_profile/bindings/user_profile_binding.dart';
import '../modules/user_profile/views/user_profile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_HOME,
      page: () => const AdminHomeView(),
      binding: AdminHomeBinding(),
      children: [
        GetPage(
          name: _Paths.ADMIN_HOME,
          page: () => const AdminHomeView(),
          binding: AdminHomeBinding(),
        ),
        GetPage(
          name: _Paths.ADMIN_HOME,
          page: () => const AdminHomeView(),
          binding: AdminHomeBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_LIST_ITEM,
      page: () => const AdminListItemView(),
      binding: AdminListItemBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_ADD_ITEM,
      page: () => const AdminAddItemView(),
      binding: AdminAddItemBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_EDIT_ITEM,
      page: () => const AdminEditItemView(),
      binding: AdminEditItemBinding(),
    ),
    GetPage(
      name: _Paths.USER_PROFILE,
      page: () => const UserProfileView(),
      binding: UserProfileBinding(),
    ),
    GetPage(
      name: _Paths.USER_MAPS,
      page: () => const UserMapsView(),
      binding: UserMapsBinding(),
    ),
  ];
}
