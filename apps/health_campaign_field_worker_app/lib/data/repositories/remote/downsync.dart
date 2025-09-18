// Generated using mason. Do not modify by hand

import 'dart:async';

import 'package:digit_data_model/data_model.dart';
import 'package:dio/dio.dart';
import '../../../models/downsync/downsync.dart';

class DownsyncRemoteRepository
    extends RemoteRepository<DownsyncModel, DownsyncSearchModel> {
  DownsyncRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'Downsync',
  });

  @override
  DataModelType get type => DataModelType.downsync;

  FutureOr<Map<String, dynamic>> customDownSync(
    DownsyncSearchModel query, {
    int? offSet,
    int? limit,
    bool? useProjectId,
  }) async {
    Response response;

    try {
      response = await executeFuture(
        future: () async {
          return await dio.post(
            searchPath,
            queryParameters: {
              'offset': offSet ?? 0,
              'limit': limit ?? 100,
              'useProjectId': useProjectId,
              'tenantId': DigitDataModelSingleton().tenantId,
              if (query.isDeleted ?? false) 'includeDeleted': query.isDeleted,
            },
            data: {
              entityName == 'Downsync' ? 'DownsyncCriteria' : entityName:
                  query.toMap(),
            },
          );
        },
      );
    } catch (error) {
      return {};
    }

    final responseMap = response.data;

    if (!responseMap.containsKey(
      entityName,
    )) {
      throw InvalidApiResponseException(
        data: query.toMap(),
        path: searchPath,
        response: responseMap,
      );
    }

    return responseMap[entityName];
  }
}
