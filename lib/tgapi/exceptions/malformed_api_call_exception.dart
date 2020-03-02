class MalformedAPICallException implements Exception {
  String description;

  MalformedAPICallException(this.description);

  @override
  String toString() => 'MalformedAPICallException: $description';
}
