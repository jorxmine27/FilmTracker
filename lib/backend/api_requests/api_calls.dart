import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Supabase usuarios Group Code

class SupabaseUsuariosGroup {
  static String baseUrl = 'https://hvsuuzhyftcyxhqvvjtz.supabase.co/auth/v1';
  static Map<String, String> headers = {
    'apikey':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh2c3V1emh5ZnRjeXhocXZ2anR6Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY3NTc3NTU5NSwiZXhwIjoxOTkxMzUxNTk1fQ.PJJuN-LF-cWpngJVpfUhcpOoYCAFyCQIkdIlvEkag7s',
  };
  static RegistroUsuarioCall registroUsuarioCall = RegistroUsuarioCall();
  static IniciarSesionEmailCall iniciarSesionEmailCall =
      IniciarSesionEmailCall();
}

class RegistroUsuarioCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) {
    final body = '''
{
  "email": "${email}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Registro Usuario',
      apiUrl: '${SupabaseUsuariosGroup.baseUrl}/signup',
      callType: ApiCallType.POST,
      headers: {
        ...SupabaseUsuariosGroup.headers,
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

class IniciarSesionEmailCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) {
    final body = '''
{
  "email": "${email}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Iniciar Sesion Email',
      apiUrl: '${SupabaseUsuariosGroup.baseUrl}/token?grant_type=password',
      callType: ApiCallType.POST,
      headers: {
        ...SupabaseUsuariosGroup.headers,
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

  dynamic token(dynamic response) => getJsonField(
        response,
        r'''$.access_token''',
      );
  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.user.id''',
      );
}

/// End Supabase usuarios Group Code

class PeliculasCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'PELICULAS',
      apiUrl:
          'https://hvsuuzhyftcyxhqvvjtz.supabase.co/rest/v1/PELICULA?select=*',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh2c3V1emh5ZnRjeXhocXZ2anR6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzU3NzU1OTUsImV4cCI6MTk5MTM1MTU5NX0.XXjMArJiuIrGzTmddCtWzMwXLAG4qXfCgIKe0NkB_nc',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh2c3V1emh5ZnRjeXhocXZ2anR6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzU3NzU1OTUsImV4cCI6MTk5MTM1MTU5NX0.XXjMArJiuIrGzTmddCtWzMwXLAG4qXfCgIKe0NkB_nc',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CinesCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'CINES',
      apiUrl: 'https://hvsuuzhyftcyxhqvvjtz.supabase.co/rest/v1/CINE?select=*',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh2c3V1emh5ZnRjeXhocXZ2anR6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzU3NzU1OTUsImV4cCI6MTk5MTM1MTU5NX0.XXjMArJiuIrGzTmddCtWzMwXLAG4qXfCgIKe0NkB_nc',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh2c3V1emh5ZnRjeXhocXZ2anR6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzU3NzU1OTUsImV4cCI6MTk5MTM1MTU5NX0.XXjMArJiuIrGzTmddCtWzMwXLAG4qXfCgIKe0NkB_nc',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UsersCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'users',
      apiUrl: 'https://hvsuuzhyftcyxhqvvjtz.supabase.co/rest/v1/users?select=*',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh2c3V1emh5ZnRjeXhocXZ2anR6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzU3NzU1OTUsImV4cCI6MTk5MTM1MTU5NX0.XXjMArJiuIrGzTmddCtWzMwXLAG4qXfCgIKe0NkB_nc',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh2c3V1emh5ZnRjeXhocXZ2anR6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzU3NzU1OTUsImV4cCI6MTk5MTM1MTU5NX0.XXjMArJiuIrGzTmddCtWzMwXLAG4qXfCgIKe0NkB_nc',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ProyectaCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'PROYECTA',
      apiUrl:
          'https://hvsuuzhyftcyxhqvvjtz.supabase.co/rest/v1/PROYECTA?select=*,PELICULA(*),CINE(*),FECHA(*)',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh2c3V1emh5ZnRjeXhocXZ2anR6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzU3NzU1OTUsImV4cCI6MTk5MTM1MTU5NX0.XXjMArJiuIrGzTmddCtWzMwXLAG4qXfCgIKe0NkB_nc',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh2c3V1emh5ZnRjeXhocXZ2anR6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzU3NzU1OTUsImV4cCI6MTk5MTM1MTU5NX0.XXjMArJiuIrGzTmddCtWzMwXLAG4qXfCgIKe0NkB_nc',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DondeVerCall {
  static Future<ApiCallResponse> call({
    int? idPeli,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'DONDE VER',
      apiUrl:
          'https://hvsuuzhyftcyxhqvvjtz.supabase.co/rest/v1/PELICULA?ID=eq.${idPeli}&select=*,PROYECTA(*),CINE!PROYECTA(*)',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh2c3V1emh5ZnRjeXhocXZ2anR6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzU3NzU1OTUsImV4cCI6MTk5MTM1MTU5NX0.XXjMArJiuIrGzTmddCtWzMwXLAG4qXfCgIKe0NkB_nc',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh2c3V1emh5ZnRjeXhocXZ2anR6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzU3NzU1OTUsImV4cCI6MTk5MTM1MTU5NX0.XXjMArJiuIrGzTmddCtWzMwXLAG4qXfCgIKe0NkB_nc',
      },
      params: {
        'idPeli': idPeli,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ListafavCall {
  static Future<ApiCallResponse> call({
    String? id = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'LISTAFAV',
      apiUrl:
          'https://hvsuuzhyftcyxhqvvjtz.supabase.co/rest/v1/LISTA_FAV?user_id=eq.${id}&select=ID_PELICULA,PELICULA(*)',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh2c3V1emh5ZnRjeXhocXZ2anR6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzU3NzU1OTUsImV4cCI6MTk5MTM1MTU5NX0.XXjMArJiuIrGzTmddCtWzMwXLAG4qXfCgIKe0NkB_nc',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh2c3V1emh5ZnRjeXhocXZ2anR6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzU3NzU1OTUsImV4cCI6MTk5MTM1MTU5NX0.XXjMArJiuIrGzTmddCtWzMwXLAG4qXfCgIKe0NkB_nc',
      },
      params: {
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic nombre(dynamic response) => getJsonField(
        response,
        r'''$..PELICULA.NOMBRE''',
        true,
      );
}

class CineByIdCall {
  static Future<ApiCallResponse> call({
    int? idCine,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'CINE BY ID',
      apiUrl:
          'https://hvsuuzhyftcyxhqvvjtz.supabase.co/rest/v1/CINE?ID=eq.${idCine}',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh2c3V1emh5ZnRjeXhocXZ2anR6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzU3NzU1OTUsImV4cCI6MTk5MTM1MTU5NX0.XXjMArJiuIrGzTmddCtWzMwXLAG4qXfCgIKe0NkB_nc',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh2c3V1emh5ZnRjeXhocXZ2anR6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzU3NzU1OTUsImV4cCI6MTk5MTM1MTU5NX0.XXjMArJiuIrGzTmddCtWzMwXLAG4qXfCgIKe0NkB_nc',
      },
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
