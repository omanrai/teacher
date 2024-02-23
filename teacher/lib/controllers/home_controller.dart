import 'dart:convert';
import 'dart:developer';

import '../services/oauth_client_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../controllers/auth_controller.dart';

import '../services/cache_service.dart';
import '../widgets/Loading_overlay.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../services/auth_api_service.dart';
import '../services/home_api_service.dart';

class HomeController extends GetxController with StateMixin {
  final HomeApiService _homeApiService;

  HomeController(this._homeApiService);

  @override
  onInit() async {
    change(null, status: RxStatus.loading());
    OAuthClientService oAuthClientService = Get.find();

    var response = await load();
    log('Home loaded successfully');
    // if done, change status to success
    change(null, status: RxStatus.success());
    super.onInit();
  }

  Future load() async {
    try {
      var response = await _homeApiService.loadHome();
      if (response.statusCode == 401) {
        // Get.toNamed(Routes.LOGIN);
      }
      if (response.statusCode == 200) {
        //return json.decode(response.body);
        change(response, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.empty());
      }
      // var message = response.toString();
      //

      // log('${json.decode(response.body)}');

    } catch (err, _) {
      log('${err}');
      rethrow;
    }
  }
}
