import 'package:get/get.dart';
import 'package:huecart/services/auth_service.dart';
import 'package:huecart/services/user_service.dart';
import 'package:huecart/services/product_service.dart';
import 'package:huecart/services/cart_service.dart';
import 'package:huecart/services/order_service.dart';
import 'package:huecart/services/firebase_storage_service.dart';

class ServiceProvider extends GetxService {
  late final AuthService authService;
  late final UserService userService;
  late final ProductService productService;
  late final CartService cartService;
  late final OrderService orderService;
  late final FirebaseStorageService storageService;

  Future<ServiceProvider> init() async {
    authService = Get.put(AuthService());
    userService = Get.put(UserService());
    productService = Get.put(ProductService());
    cartService = Get.put(CartService());
    orderService = Get.put(OrderService());
    storageService = Get.put(FirebaseStorageService());
    return this;
  }

  static ServiceProvider get to => Get.find();
} 