class APIError {
  final String message;

  const APIError(this.message);

  @override
  String toString() => message;
}
