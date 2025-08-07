import 'package:get_it/get_it.dart';
import 'package:post_bookmark/bookmark/data_source/bookmark_data_source.dart';
import 'package:post_bookmark/bookmark/data_source/impl/bookmark_data_source_impl.dart';
import 'package:post_bookmark/core/usecase/toggle_bookmark_usecase.dart';
import 'package:post_bookmark/core/utils/local/data_source/impl/shrdpref_data_source.dart';
import 'package:post_bookmark/core/utils/local/data_source/local_data_source.dart';
import 'package:post_bookmark/core/utils/http/data_source/http_data_source.dart';
import 'package:post_bookmark/core/utils/http/data_source/impl/http_data_source_impl.dart';
import 'package:post_bookmark/post/data/data_source/impl/post_data_source_impl.dart';
import 'package:post_bookmark/post/data/data_source/post_data_source.dart';
import 'package:post_bookmark/post/data/repository/post_repository_impl.dart';
import 'package:post_bookmark/post/domain/respository/post_repository.dart';
import 'package:post_bookmark/presentation/screen/post_detail/post_detail_view_model.dart';
import 'package:post_bookmark/presentation/screen/posts/post_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

void di() {
  // 패키지 추상화
  getIt.registerLazySingleton<HttpDataSource>(() => HttpDataSourceImpl());
  getIt.registerLazySingleton<LocalDataSource>(
    () => ShrdprefDataSource(preferences: getIt<SharedPreferences>()),
  );

  getIt.registerLazySingleton<BookmarkDataSource>(
    () => BookmarkDataSourceImpl(dataSource: getIt<LocalDataSource>()),
  );
  getIt.registerLazySingleton(
    () => ToggleBookmarkUsecase(dataSource: getIt<BookmarkDataSource>()),
  );
  getIt.registerLazySingleton<PostDataSource>(
    () => PostDataSourceImpl(httpClient: getIt<HttpDataSource>()),
  );
  getIt.registerLazySingleton<PostRepository>(
    () => PostRepositoryImpl(dataSource: getIt<PostDataSource>()),
  );
  getIt.registerFactory<PostViewModel>(
    () => PostViewModel(
      repository: getIt<PostRepository>(),
      usecase: getIt<ToggleBookmarkUsecase>(),
      datasource: getIt<BookmarkDataSource>(),
    ),
  );
  getIt.registerFactory<PostDetailViewModel>(
    () => PostDetailViewModel(
      repository: getIt<PostRepository>(),
      bookmarkDataSource: getIt<BookmarkDataSource>(),
    ),
  );
}
