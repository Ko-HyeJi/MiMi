//
//  InfoView.swift
//  MiMi
//
//  Created by 고혜지 on 2/19/24.
//

import SwiftUI

struct InfoView: View {
  let rice: Rice
  
  var body: some View {
    ScrollView {
      VStack(spacing: 30) {
        image
        title
        text
      }
    }
  }
}

private extension InfoView {
  private var image: some View {
    Image(rice.image)
      .resizable()
      .clipShape(Circle())
      .frame(height: 200)
  }
  
  private var title: some View {
    Text(rice.name)
      .font(.title)
  }
  
  private var text: some View {
    VStack(alignment: .leading, spacing: 20) {
      ForEach(rice.description, id: \.self) { text in
        HStack(alignment: .top) {
          Text(". ")
            .fontWeight(.heavy)
          Text(text)
            .font(.title3)
        }
      }
    }
    .padding(.horizontal)
  }
}

#Preview {
  InfoView(rice: dummyRice)
}
