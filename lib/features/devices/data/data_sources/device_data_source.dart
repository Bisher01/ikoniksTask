import 'dart:convert';

import '../../../../core/const/messages.dart';
import '../../../../core/const/url_builder.dart';
import '../../../../core/data_sources/http_client.dart';
import '../../../../core/error/exceptions.dart';
import '../models/device_model.dart';

abstract class DeviceDataSource{
  Future<DeviceListModel> fetchDeviceList({required int offset});
}

class DeviceDataSourceImpl extends DeviceDataSource{

  final HttpService client;
  final UrlBuilder urlBuilder;

  DeviceDataSourceImpl({required this.client}):urlBuilder=const UrlBuilder();

  @override
  Future<DeviceListModel> fetchDeviceList({required int offset})  async {
    var url = Uri.parse(urlBuilder.buildGetDeviceListPageUrl(offset));
    final response = await client.get(url).timeout(const Duration(seconds: 10));
    var data = json.decode(response.body);
    if (response.statusCode >= 200 && response.statusCode <= 300) {
      var deviceData = DeviceListModel.fromJson(data);
      return deviceData;
    } else {
      throw ServerException(message: fetchDeviceErrorMessage);
    }
  }

}