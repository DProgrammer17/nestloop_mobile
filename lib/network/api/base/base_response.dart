class BaseResponse<T> {
  final String? message;
  final int? status;
  final T? data;

  const BaseResponse({this.status, this.message, this.data});

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T? Function(Object? json) fromJsonT,
  ) {
    final rawData = json['data'];

    T? parsedData;

    try {
      if (rawData is List) {
        parsedData = fromJsonT(rawData);
      } else if (rawData is Map<String, dynamic>) {
        parsedData = fromJsonT(rawData);
      } else if (rawData == null) {
        parsedData = fromJsonT(null);
      } else {
        print('⚠️ Unexpected rawData format, throwing FormatException');
        throw FormatException(
          "Unexpected 'data' format: ${rawData.runtimeType}",
        );
      }
    } catch (e, stack) {
      // You could rethrow as a custom error type here.
      print('❌ Parsing error: $e\n$stack');
      rethrow;
    }

    return BaseResponse<T>(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: parsedData,
    );
  }
}
