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
  private var subscription: AnyCancellable?
  
  private func cancelSubscription() {
    self.subscription?.cancel()
  }
  
  func set(to count: Int) {
    self.counter = count
  }
  
  func start() {
    subscription = Timer.publish(every: 1.0, on: .main, in: .common)
      .autoconnect()
      .sink { [weak self] _ in
        guard let self = self else { return }
        if self.counter > 0 {
          self.counter -= 1
        } else {
          self.terminate()
        }
      }
    self.state = .running
  }
  
  func pause() {
    self.cancelSubscription()
    self.state = .paused
  }
  
  private func terminate() {
    self.cancelSubscription()
    self.state = .terminated
  }
  
  func stop() {
    self.cancelSubscription()
    self.subscription = nil
    self.state = .stopped
  }
  
  func testTimer() {
    self.set(to: 5)
    self.start()
  }
  
  enum TimerState {
    case running
    case paused
    case terminated
    case stopped
  }
}
