class Flatten {
  static flatten(list) {
    var flat = List.new()
    for (item in list) {
      if (item is Num) {
        flat.add(item)
      } else if (item is Sequence) {
        for (i in flatten(item)) {
          flat.add(i)
        }
      }
    }
    return flat
  }
}