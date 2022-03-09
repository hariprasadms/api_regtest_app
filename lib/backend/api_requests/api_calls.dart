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

class ButtercmsCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'buttercms',
      apiUrl:
          'https://api.buttercms.com/v2/pages/*/simple-page/?auth_token=3fb18053872c957d743f9ae208c676b2d1073208',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }
}

class PostAddressCall {
  static Future<ApiCallResponse> call({
    String name = '',
  }) {
    final body = '''
{
  "name": "this is ${name}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'postAddress',
      apiUrl: 'https://x8ki-letl-twmt.n7.xano.io/api:7hw-zQcz/address',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'name': name,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class GetAddressCall {
  static Future<ApiCallResponse> call({
    String name = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getAddress ',
      apiUrl: 'https://x8ki-letl-twmt.n7.xano.io/api:7hw-zQcz/address',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'name': name,
      },
      returnBody: true,
    );
  }

  static dynamic alladdress(dynamic response) => getJsonField(
        response,
        r'''$[*]''',
      );
}

class DeleteaddressCall {
  static Future<ApiCallResponse> call({
    int addressId,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'deleteaddress',
      apiUrl:
          'https://x8ki-letl-twmt.n7.xano.io/api:7hw-zQcz/address/${addressId}',
      callType: ApiCallType.DELETE,
      headers: {},
      params: {},
      returnBody: true,
    );
  }
}
