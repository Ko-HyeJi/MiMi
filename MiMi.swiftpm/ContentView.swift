import SwiftUI

struct ContentView: View {
  @StateObject var timer = CountdownTimer()
  
  var body: some View {
    ZStack {
      NavigationStack {
        MainView()
      }
      if timer.state != .stopped {
        TimerView()
      }
    }
    .environmentObject(timer)
  }
}
