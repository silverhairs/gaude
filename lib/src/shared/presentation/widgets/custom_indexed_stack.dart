import 'package:flutter/widgets.dart';

/// {@template custom_indexed_stack}
/// A work around for [IndexedStack] to hide inactive children from widget tester.
///
/// This is a temporary solution to [this issue](https://github.com/flutter/flutter/issues/111478#issue-1371500657)
/// {@endtemplate}
class CustomIndexedStack extends IndexedStack {
  /// {@macro custom_indexed_stack}
  CustomIndexedStack({
    super.key,
    super.alignment,
    super.textDirection,
    super.sizing,
    super.index,
    super.children,
  });

  @override
  MultiChildRenderObjectElement createElement() {
    return _IndexedStackElement(this);
  }
}

class _IndexedStackElement extends MultiChildRenderObjectElement {
  _IndexedStackElement(IndexedStack super.widget);

  @override
  IndexedStack get widget => super.widget as IndexedStack;

  @override
  void debugVisitOnstageChildren(ElementVisitor visitor) {
    final int? index = widget.index;
    if (index == null) {
      return super.debugVisitOnstageChildren(visitor);
    } else {
      final Iterator<Element> onlyOnstageChild = children.skip(index).iterator;
      if (onlyOnstageChild.moveNext()) {
        visitor(onlyOnstageChild.current);
      }
    }
  }
}
