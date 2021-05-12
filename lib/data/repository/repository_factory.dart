


import 'package:flutter_template_vip/data/service/connectivity_service.dart';
import 'package:flutter_template_vip/data/service/enums.dart';
import 'package:flutter_template_vip/data/repository/base_repository.dart';
import 'package:flutter_template_vip/data/repository/api_repository.dart';

class RepositoryFactory {
  RepositoryFactory._();

  static Future<IBaseRepository> createRepository(
      Repository repositoryType) async {
    final isConnected = await ConnectivityService.isConnected();

    switch (repositoryType) {
      case Repository.CleanApp:
        return isConnected ? AppRepository() : AppRepository();//OfflineAppRepository();
      default:
        throw Exception('Repository type is not supported!');
    }
  }
}
