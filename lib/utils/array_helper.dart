// @dart=2.9

class ArrayHelper {
  ArrayHelper._();

  static List<T> toArray<T>(dynamic list) {
    if (list == null) {
      return List<T>();
    }

    return (list as List<T>);
  }
}
