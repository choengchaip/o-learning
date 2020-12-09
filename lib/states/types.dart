class IStatus<T, L> {
  bool isLoading;
  bool isLoaded;
  bool isSuccess;
  bool isError;
  T data;
  List<L> items = [];

  IStatus({
    this.isLoading,
    this.isLoaded,
    this.isSuccess,
    this.isError,
    this.data,
    this.items
  });
}