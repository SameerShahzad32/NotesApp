import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class SendMailCall {
  static Future<ApiCallResponse> call({
    String? sender = 'default@gmail.com',
    String? reciever = 'sameershazad32@gmail.com',
  }) {
    final body = '''
{
  "personalizations": [
    {
      "to": [
        {
          "email": "${reciever}"
        }
      ],
      "subject": "Hello, World!"
    }
  ],
  "from": {
    "email": "${sender}"
  },
  "content": [
    {
      "type": "text/plain",
      "value": "Hello There"
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SendMail',
      apiUrl: 'https://rapidprod-sendgrid-v1.p.rapidapi.com/mail/send',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'X-Rapidapi-Key': '80eb30527fmsh307ca9b341ae4f6p1e165ajsn5120bf3e166e',
        'X-Rapidapi-Host': 'rapidprod-sendgrid-v1.p.rapidapi.com',
        'Host': 'rapidprod-sendgrid-v1.p.rapidapi.com',
        'Content-Length': '393',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetUsersCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'GetUsers',
      apiUrl: 'https://wsscsituet.up.railway.app/endpoints/batches/fetch',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
