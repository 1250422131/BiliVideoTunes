

extension AlsoExtension<T> on T {
  T also(void Function(T) block) {
    block(this);
    return this;
  }
}

extension LetExtension<T> on T {
  R let<R>(R Function(T) block) {
    return block(this);
  }
}

