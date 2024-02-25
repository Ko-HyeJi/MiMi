//
//  RecipeView.swift
//  MiMi
//
//  Created by 고혜지 on 2/19/24.
//

import SwiftUI

struct RecipeView: View {
  @StateObject var viewModel: RecipeViewModel
  
  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 0) {
        ImageView(viewModel: viewModel)
        divider
        SectionTitleView(title: "Ingredients")
        IngredientView(viewModel: viewModel)
          .padding(.horizontal)
        divider
        SectionTitleView(title: "Instructions")
        InstructionView(viewModel: viewModel)
          .padding(.horizontal)
      }
      .padding(.horizontal, 30)
    }
    .navigationTitle(viewModel.rice.name)
    .navigationBarTitleDisplayMode(.large)
    .toolbar { ToolbarItemView(rice: viewModel.rice) }
  }
}

private struct ImageView: View {
  @ObservedObject var viewModel: RecipeViewModel
  
  var body: some View {
    Image(viewModel.rice.image)
      .resizable()
      .clipShape(RoundedRectangle(cornerRadius: 15.0))
      .frame(height: 200)
  }
}

private struct SectionTitleView: View {
  let title: String
  
  var body: some View {
    Text(title)
      .font(.title2)
      .bold()
  }
}

private struct IngredientView: View {
  @ObservedObject var viewModel: RecipeViewModel
  
  var body: some View {
    VStack(spacing: -5) {
      serving
      rice
      water
    }
    .font(.title3)
  }
}

private extension IngredientView {
  private var serving: some View {
    HStack {
      IngredientItemNameView(name: "serving")
      Spacer()
      Picker("", selection: $viewModel.serving) {
        ForEach(1..<11) { num in
          Text(num.description)
        }
      }
      .pickerStyle(.wheel)
      .frame(height: 80)
      .padding(.leading, 50)
    }
  }
  
  private var rice: some View {
    HStack(spacing: -8) {
      IngredientItemNameView(name: "rice")
      Spacer()
      Text(viewModel.riceAmountAsString)
      Picker("", selection: $viewModel.riceUnit) {
        ForEach(RiceUnit.allCases) { unit in
          Text(unit.description)
        }
      }
      .frame(height: 50)
    }
  }
  
  private var water: some View {
    HStack(spacing: -8) {
      IngredientItemNameView(name: "water")
      Spacer()
      Text(viewModel.waterAmountAsString)
      Picker("", selection: $viewModel.waterUnit) {
        ForEach(WaterUnit.allCases) { unit in
          Text(unit.description)
        }
      }
      .frame(height: 50)
    }
  }
}

private struct InstructionView: View {
  @ObservedObject var viewModel: RecipeViewModel
  @EnvironmentObject private var timer: CountdownTimer

  var body: some View {
    VStack(alignment: .leading) {
      let recipe = Array(viewModel.rice.recipe.enumerated())
      ForEach(recipe, id: \.offset) { index, step in
        HStack(alignment: .top) {
          Text("\(index + 1). ")
          VStack(alignment: .leading) {
            Text(step.instruction)
            if let tip = step.tip {
              Text(tip)
                .foregroundStyle(Color.secondary)
            }
          }
          
          Spacer()
          
          if let time = step.timerSetting {
            Button {
              timer.set(to: time * 60)
              timer.start()
            } label: {
              Image(systemName: "timer")
                .bold()
            }
          }
        }
        .font(.title3)
        .padding(.vertical)
      }
    }
    // MARK: Timer View Test
    .onTapGesture(count: 5) { timer.testTimer() }
  }
}

private struct ToolbarItemView: View {
  let rice: Rice
  
  var body: some View {
    NavigationLink {
      InfoView(rice: rice)
    } label: {
      Image(systemName: "info.circle")
        .foregroundStyle(Color.accentColor)
    }
  }
}

private extension RecipeView {
  private var divider: some View {
    Divider()
      .padding(.vertical)
  }
}

struct IngredientItemNameView: View {
  let name: String
  
  var body: some View {
    Text(name)
      .bold()
      .frame(width: 100, height: 30)
      .overlay {
        RoundedRectangle(cornerRadius: 7.0)
          .frame(width: 100)
          .foregroundStyle(Color.accentColor)
          .opacity(0.3)
      }
  }
}

#Preview {
  RecipeView(viewModel: RecipeViewModel(rice: dummyRice))
    .environmentObject(CountdownTimer())
}
