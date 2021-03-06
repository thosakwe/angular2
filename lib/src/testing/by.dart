import "package:angular2/src/platform/dom/dom_adapter.dart" show DOM;
import "package:angular2/src/testing/debug_node.dart"
    show DebugElement, Predicate;

/// Predicates for use with [DebugElement]'s query functions.
class By {
  /// Match all elements.
  static Predicate<DebugElement> all() => (debugElement) => true;

  /// Match elements by the given CSS selector.
  static Predicate<DebugElement> css(String selector) {
    return (debugElement) {
      return debugElement.nativeElement != null
          ? DOM.elementMatches(debugElement.nativeElement, selector)
          : false;
    };
  }

  /// Match elements that have the given directive present.
  static Predicate<DebugElement> directive(Type type) {
    return (debugElement) {
      return !identical(debugElement.providerTokens.indexOf(type), -1);
    };
  }
}
