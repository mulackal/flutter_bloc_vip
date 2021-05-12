

import 'package:flutter_template_vip/data/model/login_responds.dart';
import 'package:flutter_template_vip/data/repository/offline/iapp_offline_repository.dart';

class OfflineAppRepository implements IAppOfflineRepository {

  @override
  Future<List<String>> getAllPosts() async {
   /* final db = await DatabaseService.instance;
    final posts = db.getAllPosts();
    return posts;*/
  }
}
