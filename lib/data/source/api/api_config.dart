import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

import 'api_paths.dart';

class ApiConfig {
  static final ApiConfig _singleton = ApiConfig._internal();
  factory ApiConfig() => _singleton;

  late Dio dio;
  static final CacheStore cacheStore = MemCacheStore();

  // Global options
  final options = CacheOptions(
    // A default store is required for interceptor.
    store: cacheStore,

    // All subsequent fields are optional.
    // Default.
    policy: CachePolicy.refresh,
    // Returns a cached response on error but for statuses 401 & 403.
    // Also allows to return a cached response on network errors (e.g. offline usage).
    // Defaults to [null].
    hitCacheOnErrorExcept: [401, 403],
    // Overrides any HTTP directive to delete entry past this duration.
    // Useful only when origin server has no cache config or custom behaviour is desired.
    // Defaults to [null].
    maxStale: const Duration(days: 7),
    // Default. Allows 3 cache sets and ease cleanup.
    priority: CachePriority.normal,
    // Default. Body and headers encryption with your own algorithm.
    cipher: null,
    // Default. Key builder to retrieve requests.
    keyBuilder: CacheOptions.defaultCacheKeyBuilder,
    // Default. Allows to cache POST requests.
    // Overriding [keyBuilder] is strongly recommended when [true].
    allowPostMethod: false,
  );

  ApiConfig._internal() {
    //creates the singleton instance
    dio = Dio();
    dio.interceptors.add(DioCacheInterceptor(options: options),);
    // dio.interceptors.add(LogInterceptor(requestHeader: true),);
    // Set default configs
    dio.options.baseUrl = ApiPaths.baseURL;
    dio.options.connectTimeout = const Duration(seconds: 10); //10s
    dio.options.receiveTimeout = const Duration(seconds: 10);
  }
}
