class UrlBuilder {
  const UrlBuilder({
    String? baseUrl,
  }) : _baseUrl = baseUrl ?? 'https://dummyjson.com';

  final String _baseUrl;

  String buildGetDeviceListPageUrl(int page) =>
      '$_baseUrl/products?limit=10&skip=$page';

  String buildSearchDevicePageUrl(String searchText) =>
      '$_baseUrl/products/search?q=$searchText';
}
