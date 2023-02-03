class APIResponse<T> {
  APIResponseStatus status = APIResponseStatus.none;
  T? data;
  String? message;

  APIResponse.none() : status = APIResponseStatus.none;
  APIResponse.loading() : status = APIResponseStatus.loading;
  APIResponse.success(this.data) : status = APIResponseStatus.sucess;
  APIResponse.error(this.message) : status = APIResponseStatus.error;

  bool get isNone => status == APIResponseStatus.none;
  bool get isLoading => status == APIResponseStatus.loading;
  bool get isSuccess => status == APIResponseStatus.sucess;
  bool get isError => status == APIResponseStatus.error;
}

enum APIResponseStatus { none, loading, sucess, error }
