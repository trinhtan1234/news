import 'package:dio/dio.dart';
import 'package:news/networking/responsitories/url.dart';

class HttpService {
  final Dio _dio = Dio();

  // HttpService() {
  //   _dio.interceptors.add(DioCacheInterceptor(options: cacheOptions()));
  // }

  // Options cacheOptions() {
  //   final cacheOptions = CacheOptions(
  //     store: MemCacheStore(maxSize: 10485760, maxEntrySize: 1048576), // Lưu trữ cache trong bộ nhớ
  //     policy: CachePolicy.request, // Cài đặt chính sách cache
  //     hitCacheOnErrorExcept: [500, 401], // Bỏ qua cache khi nhận các mã lỗi nhất định
  //     priority: CachePriority.normal, // Ưu tiên cache
  //     maxStale: const Duration(days: 7), // Cho phép cache cũ được sử dụng trong 7 ngày
  //   );

  //   return Options(
  //     extra: cacheOptions.toExtra(),
  //   );
  // }

  Future<Response?> request(String url, {APIMethod method = APIMethod.Get}) {
    try {
      switch (method) {
        case APIMethod.Get:
          return _dio.get(
            url,
            // options: cacheOptions(),
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
