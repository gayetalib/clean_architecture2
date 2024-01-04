// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_remote_datasource.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$PostRemoteDataSource extends PostRemoteDataSource {
  _$PostRemoteDataSource([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = PostRemoteDataSource;

  @override
  Future<Response<List<dynamic>>> getPosts() {
    final Uri $url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<dynamic>, List<dynamic>>($request);
  }

  @override
  Future<Response<dynamic>> getPost(int id) {
    final Uri $url =
        Uri.parse('https://jsonplaceholder.typicode.com/posts/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
