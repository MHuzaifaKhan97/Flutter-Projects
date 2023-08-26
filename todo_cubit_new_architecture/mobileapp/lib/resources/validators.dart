String? valdiateTitle(String? value) {
  if (value?.isEmpty ?? true) {
    return "Task title is required";
  }
  return null;
}

String? valdiateDescription(String? value) {
  if (value?.isEmpty ?? true) {
    return "Task description is required";
  }
  return null;
}
