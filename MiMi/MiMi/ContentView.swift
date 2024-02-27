//
//  ContentView.swift
//  MiMi
//
//  Created by 고혜지 on 2/28/24.
//

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
