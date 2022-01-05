import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class AllPostsCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'All Posts',
      apiUrl: 'https://jsonplaceholder.typicode.com/posts',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }

  static dynamic getAllPosts(dynamic response) => getJsonField(
        response,
        r'''$[*]''',
      );
}

class CreateAPostCall {
  static Future<ApiCallResponse> call({
    String title = 'just a title',
    String bod = 'just a bodu',
  }) {
    final body = '''
{
  "title": "${title}",
  "body": "${bod}",
  "userId": 1
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createAPost',
      apiUrl: 'https://jsonplaceholder.typicode.com/posts',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'title': title,
        'bod': bod,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }

  static dynamic aNewPost(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}
