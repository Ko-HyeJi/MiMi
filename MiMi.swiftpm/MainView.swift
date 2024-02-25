//
//  MainView.swift
//  MiMi
//
//  Created by 고혜지 on 2/19/24.
//

import SwiftUI

struct MainView: View {
  var body: some View {
    Group {
      TitleView()
      ScrollView{
        RiceGridView()
      }
    }
    .padding()
  }
}

private struct TitleView: View {
  var body: some View {
    Text("MiMi")
      .foregroundStyle(Color.accentColor)
      .font(.largeTitle.bold())
  }
}

private struct RiceGridView: View {
  @StateObject private var viewModel = MainViewModel()
  private var columns = [GridItem](repeating: .init(.flexible(maximum: 300)), count: 2)
  
  var body: some View {
    LazyVGrid(columns: columns) {
      ForEach(viewModel.rices) { rice in
        NavigationLink {
          RecipeView(viewModel: RecipeViewModel(rice: rice))
        } label: {
          GridItemView(image: rice.image, name: rice.name)
            .padding(5)
        }
      }
    }
  }
}

private struct GridItemView: View {
  let image: String
  let name: String
  
  var body: some View {
    VStack {
      Image(image)
        .resizable()
        .scaledToFit()
        .clipShape(RoundedRectangle(cornerRadius: 25.0))
      Text(name)
        .bold()
    }
  }
}

#Preview {
  MainView()
}
