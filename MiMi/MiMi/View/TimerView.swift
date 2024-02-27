//
//  TimerView.swift
//  MiMi.swiftpm
//
//  Created by 고혜지 on 2/20/24.
//

import SwiftUI

struct TimerView: View {
  @EnvironmentObject private var timer: CountdownTimer
  @StateObject private var viewModel = TimerViewModel()
  
  var body: some View {
    Group {
      if timer.state != .terminated {
        RunningTimerView(viewModel: viewModel)
      } else {
        TerminatedTimerView(viewModel: viewModel)
      }
    }
  }
}

private struct RunningTimerView: View {
  @EnvironmentObject private var timer: CountdownTimer
  @ObservedObject var viewModel: TimerViewModel
  
  var body: some View {
    VStack {
      Spacer()
      HStack {
        if timer.state == .paused {
          TimerButtonView(icon: "play.fill") {
            timer.start()
          }
        } else {
          TimerButtonView(icon: "pause") {
            timer.pause()
          }
        }
        
        TimerButtonView(icon: "multiply") {
          timer.stop()
        }
        
        Spacer()
        
        Text(viewModel.getFormattedTime(seconds: timer.counter))
          .monospacedDigit()
          .font(.system(size: 45))
          .foregroundStyle(Color.accentColor)
      }
      .padding(.vertical, 10)
      .padding(.horizontal, 30)
      .background { RoundedRectangle(cornerRadius: 25.0) }
      .frame(maxWidth: 600)
      .padding()
    }
  }
}

private struct TerminatedTimerView: View {
  @EnvironmentObject private var timer: CountdownTimer
  @ObservedObject var viewModel: TimerViewModel
  
  var body: some View {
    ZStack {
      Color.primary
        .ignoresSafeArea()
        .opacity(0.8)
      VStack {
        Spacer()
        Image(systemName: "alarm.waves.left.and.right")
          .foregroundStyle(Color.red)
          .offset(x: viewModel.isAnimating ? -5 : 5)
          .animation(.easeInOut(duration: 0.1).repeatForever(), value: viewModel.isAnimating)
        Spacer()
        Button {
          timer.stop()
          viewModel.destroyHapticFeedback()
        } label: {
          Image(systemName: "multiply.circle.fill")
            .padding()
        }
      }
      .font(.system(size: 50))
    }
    .onAppear {
      viewModel.isAnimating.toggle()
      viewModel.generateHapticFeedback()
    }
  }
}

private struct TimerButtonView: View {
  let icon: String
  let action: () -> ()
  
  var body: some View {
    Button {
      action()
    } label: {
      Circle()
        .opacity(0.5)
        .frame(width: 50)
        .overlay {
          Image(systemName: icon)
            .font(.title.bold())
        }
    }
  }
}

#Preview {
  TimerView()
    .environmentObject(CountdownTimer())
}
