import 'dart:async';


import 'package:flutter_template_vip/data/repository/base_repository.dart';



abstract class IAppOfflineRepository extends IBaseRepository {
  Future<List<String>> getAllPosts();
}
