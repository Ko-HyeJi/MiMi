//
//  RiceModel.swift
//  MiMi
//
//  Created by 고혜지 on 2/19/24.
//

import Foundation

struct RecipeStep {
  let instruction: String
  let tip: String?
  let timerSetting: Int?
}

struct Rice: Identifiable {
  let id = UUID()
  let name: String
  let image: String
  let description: [String]
  let riceCapacity: Double
  let waterCapacity: Double
  let recipe: [RecipeStep]
}

let dummyRice = Rice(
  name: "Indica Rice",
  image: "indica_rice",
  description: ["Indica rice is known for its pleasant aroma and the characteristic that each grain separates when cooked.",
                "This makes it commonly used in dishes like pilaf and biryani.",
                "Indica rice is generally grown in South Asia and Southeast Asia, and when cooked properly, it has a soft and slightly chewy texture."],
  riceCapacity: 1.0,
  waterCapacity: 1.0,
  recipe: [RecipeStep(instruction: "Rinse the rice in cold water until the rice is clean.", tip: nil, timerSetting: nil),
           RecipeStep(instruction: "After washing the rice, remove all the water. Then, put the rice in a pot and add water.", tip: nil, timerSetting: nil),
           RecipeStep(instruction: "Place the pot on the heat, and when the water starts to boil, reduce the heat to medium.", tip: nil, timerSetting: nil),
           RecipeStep(instruction: "Cover with a lid and steam the rice for about 20 minutes. Do not stir the rice during this time.", tip: nil, timerSetting: 20),
           RecipeStep(instruction: "Turn off the heat and do not open the lid for about 10 minutes.", tip: "This allows the rice grains to spread appropriately, making the rice more delicious.", timerSetting: 10),
           RecipeStep(instruction: "Gently loosen the rice with a chopstick to finish.", tip: nil, timerSetting: nil)])

enum RiceUnit: CaseIterable, Identifiable, CustomStringConvertible {
  case g
  case cup
  
  var id: Self { self }
  
  var description: String {
    switch self {
    case .g:
      return "g"
    case .cup:
      return "cup"
    }
  }
  
  var capacity: Double {
    switch self {
    case .g:
      return 150
    case .cup:
      return 1
    }
  }
}

enum WaterUnit: CaseIterable, Identifiable, CustomStringConvertible {
  case ml
  case oz
  case cup
  
  var id: Self { self }
  
  var description: String {
    switch self {
    case .ml:
      return "ml"
    case .oz:
      return "oz"
    case .cup:
      return "cup"
    }
  }
  
  var capacity: Double {
    switch self {
    case .ml:
      return 180
    case .oz:
      return 6.5
    case .cup:
      return 1
    }
  }
}
