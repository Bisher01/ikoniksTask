import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:task/core/const/url_builder.dart';
import 'package:task/core/data_sources/http_client.dart';
import 'package:task/dependency_injection.dart';
import 'package:task/features/devices/domain/usecases/fetch_devices.dart';

void main() {
  test(
      'on success: number of data should be 10, on fail: error message should be returned',
      () async {
    await inject();
    final result = await di<FetchDevices>().call(params: 0);
    result.fold((l) => expect(l.properties.length, 1),
        (r) => expect(r.results.length, 10));
  });
  test('http request should return 200', () async {
    final http = HttpService(client: Client(), unauthorizedRoutes: []);
    const urlBuilder = UrlBuilder();
    final result =
        await http.get(Uri.parse(urlBuilder.buildGetDeviceListPageUrl(0)));
    expect(result.statusCode, 200);
  });
}
