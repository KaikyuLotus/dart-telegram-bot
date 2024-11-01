/// Call a function if the parameter is not null
T? callIfNotNull<T, R>(T Function(R) foo, parameter) {
  return parameter != null ? foo(parameter) : null;
}
