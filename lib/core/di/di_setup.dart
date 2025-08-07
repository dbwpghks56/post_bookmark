import 'package:get_it/get_it.dart';
import 'package:post_bookmark/core/utils/http/data_source/http_data_source.dart';
import 'package:post_bookmark/core/utils/http/data_source/impl/http_data_source_impl.dart';
import 'package:post_bookmark/post/data/data_source/impl/post_data_source_impl.dart';
import 'package:post_bookmark/post/data/data_source/post_data_source.dart';
import 'package:post_bookmark/post/data/repository/post_repository_impl.dart';
import 'package:post_bookmark/post/domain/respository/post_repository.dart';
import 'package:post_bookmark/presentation/screen/post_detail/post_detail_view_model.dart';
import 'package:post_bookmark/presentation/screen/posts/post_view_model.dart';

final getIt = GetIt.instance;

void di() {
  getIt.registerLazySingleton<HttpDataSource>(() => HttpDataSourceImpl());
  getIt.registerLazySingleton<PostDataSource>(
    () => PostDataSourceImpl(httpClient: getIt<HttpDataSource>()),
  );
  getIt.registerLazySingleton<PostRepository>(
    () => PostRepositoryImpl(dataSource: getIt<PostDataSource>()),
  );
  getIt.registerFactory<PostViewModel>(
    () => PostViewModel(repository: getIt<PostRepository>()),
  );
  getIt.registerFactory<PostDetailViewModel>(
    () => PostDetailViewModel(repository: getIt<PostRepository>()),
  );
}
