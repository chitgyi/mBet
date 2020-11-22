bool isNullOrEmpty(Object object) {
  if (object == null)
    return true;
  else if (object is List)
    return object.isEmpty;
  else
    return false;
}
