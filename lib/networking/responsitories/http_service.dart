import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:news/networking/responsitories/url.dart';

class HttpService {
  final Dio _dio = Dio();
  HttpService() {
    _dio.interceptors.add(
      DioCacheInterceptor(
        options: CacheOptions(
          store: MemCacheStore(),
          policy: CachePolicy.forceCache,
          hitCacheOnErrorExcept: [401, 403],
        ),
      ),
    );
  }
  Future<Response?> request(String url, {APIMethod method = APIMethod.Get}) {
    try {
      switch (method) {
        case APIMethod.Get:
          return _dio.get(
            url,
          );
        case APIMethod.Put:
          return _dio.put(url);
        case APIMethod.Delete:
          return _dio.delete(url);
        default:
          return _dio.post(url);
      }
    } catch (e) {
      rethrow;
    }
  }
}
