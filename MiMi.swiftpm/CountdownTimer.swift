//
//  CountdownTimer.swift
//  MiMi
//
//  Created by 고혜지 on 2/20/24.
//

import Foundation
import Combine

final class CountdownTimer: ObservableObject {
  @Published var state: TimerState = .stopped
  @Published var counter = 0
  
  private var timerSubscription: AnyCancellable?
  
  func setTimer(to minutes: Int) {
    self.counter = minutes * 60
  }
  
  func startTimer() {
    timerSubscription = Timer.publish(every: 1.0, on: .main, in: .common)
      .autoconnect()
      .sink { [weak self] _ in
        if let self = self {
          if self.counter > 0 {
            self.counter -= 1
          } else {
            self.timerSubscription?.cancel()
            self.state = .terminated
          }
        }
      }
    self.state = .running
  }
  
  func pauseTimer() {
    self.timerSubscription?.cancel()
    self.state = .paused
  }
  
  func stopTimer() {
    self.timerSubscription?.cancel()
    self.timerSubscription = nil
    self.state = .stopped
  }
  
  func testTimer() {
    counter = 5
    startTimer()
  }
    
  enum TimerState {
    case running
    case paused
    case terminated
    case stopped
  }
}
