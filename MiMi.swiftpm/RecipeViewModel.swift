//
//  RecipeViewModel.swift
//  MiMi
//
//  Created by 고혜지 on 2/19/24.
//

import SwiftUI

final class RecipeViewModel: ObservableObject {
  @Published var serving: Int = 0
  @Published var riceUnit: RiceUnit = .g
  @Published var waterUnit: WaterUnit = .ml

  let rice: Rice

  var riceAmountAsString: String {
    let amount = Double(serving + 1) * riceUnit.capacity * rice.riceCapacity
    let format = amount.truncatingRemainder(dividingBy: 1) == 0 ? "%.0f" : "%.1f"
    return String(format: format, amount)
  }

  var waterAmountAsString: String {
    let amount = Double(serving + 1) * waterUnit.capacity * rice.waterCapacity
    let format = amount.truncatingRemainder(dividingBy: 1) == 0 ? "%.0f" : "%.1f"
    return String(format: format, amount)
  }

  init(rice: Rice) {
    self.rice = rice
  }
}
