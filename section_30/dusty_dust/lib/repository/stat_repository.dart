import 'package:dio/dio.dart';
import 'package:dusty_dust/model/stat_model.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';

class StatRepository {
  static Future<void> fetchData() async {
    final isar = GetIt.I<Isar>();

    final now = DateTime.now();
    final compareDateTimeTarget = DateTime(
      now.year,
      now.month,
      now.day,
      now.hour,
    );

    final count = await isar.statModels
        .filter()
        .dateTimeEqualTo(compareDateTimeTarget)
        .count();

    print('현재 시간: $compareDateTimeTarget');
    print('전체 count 결과: $count');

    if (count > 0) {
      print('데이터가 존재합니다 : count: $count');
      return;
    }

    for (ItemCode itemCode in ItemCode.values) {
      await fetchDataByItemCode(itemCode: itemCode);
    }
  }

  static Future<List<StatModel>> fetchDataByItemCode({
    required ItemCode itemCode,
  }) async {
    final response = await Dio().get(
      'http://apis.data.go.kr/B552584/ArpltnStatsSvc/getCtprvnMesureLIst',
      queryParameters: {
        'serviceKey':
            'VkxFGueVrEqx1Q5L/dveVXpyKr33qI1NPveiuLidPqzO3TAbM631WkGfxrkPq1lE6Eva1VW2tWJpfm8SGbW3mw==',
        'returnType': 'json',
        'numOfRows': '100',
        'pageNo': '1',
        'itemCode': itemCode.name,
        'dataGubun': 'HOUR',
        'searchCondition': 'WEEK',
      },
    );

    final rawItemsList = response.data['response']['body']['items'];

    List<StatModel> stats = [];

    final List<String> skipKeys = [
      'dataGubun',
      'dataTime',
      'itemCode',
    ];

    for (Map<String, dynamic> item in rawItemsList) {
      final dateTime = DateTime.parse(item['dataTime']);

      for (String key in item.keys) {
        if (skipKeys.contains(key)) {
          continue;
        }

        final regionStr = key;
        final stat = double.parse(item[regionStr]);
        final region = Region.values.firstWhere((e) => e.name == regionStr);

        final statModel = StatModel()
          ..region = region
          ..stat = stat
          ..dateTime = dateTime
          ..itemCode = itemCode;

        final isar = GetIt.I.get<Isar>();

        final count = await isar.statModels
            .filter()
            .regionEqualTo(region)
            .dateTimeEqualTo(dateTime)
            .itemCodeEqualTo(itemCode)
            .count();

        if (count > 0) {
          continue;
        }

        await isar.writeTxn(() async {
          await isar.statModels.put(statModel);
        });
      }
    }
    return stats;
  }
}
