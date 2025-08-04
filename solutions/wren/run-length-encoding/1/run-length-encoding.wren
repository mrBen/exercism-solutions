class RLE {
  static encode(s) {
    if (s.count == 0) {
      return ""
    }
    var encoded = ""
    var last = s[0]
    var n = 0
    for (i in 0...s.count) {
      if (s[i] == last) {
        n = n + 1
      } else {
        if (n == 1) {
          encoded = encoded + last
        } else {
          encoded = encoded + "%(n)%(last)"
        }
        last = s[i]
        n = 1
      }
    }
    if (n == 1) {
      encoded = encoded + last
    } else {
      encoded = encoded + "%(n)%(last)"
    }
    return encoded
  }
  static decode(s) {
    if (s.count == 0) {
      return ""
    }
    var decoded = ""
    var q = 0
    for (i in 0...s.count) {
      if (s.bytes[i] < 48 || s.bytes[i] > 57) {
        var n = 1
        if (q < i) {
          n = Num.fromString(s[q...i])
        }
        for (j in 0...n) {
          decoded = decoded + s[i]
        }
        q = i + 1
      }
    }
    return decoded
  }
}
