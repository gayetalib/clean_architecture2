// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_remote_datasource_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$CommentRemoteDatasourceService
    extends CommentRemoteDatasourceService {
  _$CommentRemoteDatasourceService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = CommentRemoteDatasourceService;

  @override
  Future<Response<List<dynamic>>> getComments() {
    final Uri $url = Uri.parse('http://192.168.1.102:8081/comments');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<dynamic>, List<dynamic>>($request);
  }

  @override
  Future<Response<dynamic>> getComment(int id) {
    final Uri $url = Uri.parse('http://192.168.1.102:8081/comments/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> addComment(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('http://192.168.1.102:8081/comments');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> deleteComment(int id) {
    final Uri $url = Uri.parse('http://192.168.1.102:8081/comments/${id}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> updateComment(
    int id,
    Map<String, dynamic> body,
  ) {
    final Uri $url = Uri.parse('http://192.168.1.102:8081/comments/${id}');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
