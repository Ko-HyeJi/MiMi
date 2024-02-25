//
//  TimerViewModel.swift
//  MiMi
//
//  Created by 고혜지 on 2/20/24.
//

import SwiftUI

final class TimerViewModel: ObservableObject {
  @Published var isAnimating = false
  
  func getFormattedTime(seconds: Int) -> String {
    "\(self.minutes(seconds)):\(self.seconds(seconds))"
  }
  
  private func minutes(_ seconds: Int) -> String {
    return String(format: "%02d", seconds / 60)
  }
  
  private func seconds(_ seconds: Int) -> String {
    return String(format: "%02d", seconds % 60)
  }
  
  private var feedbackGenerator : UIImpactFeedbackGenerator? = nil
  
  func generateHapticFeedback() {
    self.feedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
    self.feedbackGenerator?.prepare()
    var timer: Timer?
    var elapsedTime = 0.0
    let duration = 60.0
    let interval = 0.1
    
    timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { _ in
      self.feedbackGenerator?.impactOccurred()
      elapsedTime += interval
      if elapsedTime >= duration {
        timer?.invalidate()
      }
    }
  }
  
  func destroyHapticFeedback() {
    self.feedbackGenerator = nil
  }
}
