import SwiftUI

struct ContentView: View {
  @State var isHoveredBad = false
  @State var isHoveredGood = false

  var body: some View {
    Text("Hover good")
      .padding()
      .onHover { over in self.isHoveredGood = over }
      .modifier(TestStyleGood(isHovered: self.isHoveredGood))
      .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
  }
}

struct TestStyleBad: ViewModifier {
  private let isHovered: Bool

  init(isHovered: Bool) {
    self.isHovered = isHovered
    print("TestStyleBad:", isHovered)
  }

  func body(content: Content) -> some View {
    if self.isHovered {
      content.foregroundColor(.red)
    } else if 1 == 2 {
      EmptyView()
    } else if 1 == 3 {
      EmptyView()
    } else if 1 == 4 {
      EmptyView()
    } else if 1 == 5 {
      EmptyView()
    } else {
      content
    }
  }
}

struct TestStyleGood: ViewModifier {
  private let isHovered: Bool

  init(isHovered: Bool) {
    self.isHovered = isHovered
    print("TestStyleGood:", isHovered)
  }

  func body(content: Content) -> some View {
    realBody(content: content)
  }

  func realBody(content: Content) -> some View {
    if self.isHovered {
      return AnyView(content.foregroundColor(.red))
    } else if 1 == 2 {
      return AnyView(EmptyView())
    } else if 1 == 3 {
      return AnyView(EmptyView())
    } else if 1 == 4 {
      return AnyView(EmptyView())
    } else if 1 == 5 {
      return AnyView(EmptyView())
    } else {
      return AnyView(content)
    }
  }
}
