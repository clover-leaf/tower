extension CombinationX on List {
  List<List<T>> combination<T>() {
    final result = <List<T>>[];
    for (int i = 0; i < this.length; i++) {
      for (int j = 0; j < this.length; j++) {
        result.add(<T>[elementAt(i), elementAt(j)]);
      }
    }
    return result;
  }
}
