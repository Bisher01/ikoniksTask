class UrlBuilder {
  const UrlBuilder({
    String? baseUrl,
  }) : _baseUrl = baseUrl ?? 'https://dummyjson.com';

  final String _baseUrl;

  String buildGetDeviceListPageUrl(int page) {
    return '$_baseUrl/products?limit=10&skip=$page';
  }


}
