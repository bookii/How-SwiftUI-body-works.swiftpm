import SwiftUI

struct ContentView: View {
    @State var isScaled: Bool = false

    var body: some View {
        VStack(spacing: 32) {
            TransitionHelloText(isScaled: isScaled)
                .onTapGesture {
                    print(type(of: TransitionHelloText.Body.self))
                }
            AnimationHelloText(isScaled: isScaled)
                .onTapGesture {
                    print(type(of: AnimationHelloText.Body.self))
                }
            Toggle("", isOn: $isScaled)
                .labelsHidden()
        }
        .animation(.default, value: isScaled)
    }
}

struct TransitionHelloText: View {
    let isScaled: Bool
    
    var body: some View {
        if isScaled {
            Text("Hello, world!")
                .scaleEffect(2)
        } else {
            Text("Hello, world!")
                .scaleEffect(1)
        }
    }
}

struct AnimationHelloText: View {
    let isScaled: Bool
    
    var body: some View {
        Text("Hello, world!")
            .scaleEffect(isScaled ? 2 : 1)
    }
}
