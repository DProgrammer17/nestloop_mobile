abstract class ApiHeaders {
  static const contentTypeKey = "Content-Type";
  static const multiPartKey = 'multipart/form-data';
  static const contentType = "application/json";
  static const authorization = "Authorization";

  static final requestHeader = {
    contentTypeKey: contentType,
  };

  static authorizedRequestHeader(String token) => {
    contentTypeKey: contentType,
    authorization: token,
  };

  static authorizedRequestFormDataHeader(String token) => {
    contentTypeKey: multiPartKey,
    authorization: token,
  };
}