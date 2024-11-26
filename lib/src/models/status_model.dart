class StatusModel<T> {
  bool success;
  bool loading;
  String message;
  T? data;
  StatusModel({
    this.success = false,
    this.loading = false,
    this.message = "",
  });
}
