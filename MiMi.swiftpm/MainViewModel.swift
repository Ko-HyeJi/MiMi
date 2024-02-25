//
//  Mainself.swift
//  MiMi
//
//  Created by 고혜지 on 2/19/24.
//

import Foundation
import Combine

final class MainViewModel: ObservableObject {
  let rices: [Rice] = [
    // MARK: Indica Rice
    Rice(name: "Indica Rice",
         image: "indica_rice",
         description: ["Indica rice is known for its pleasant aroma and the characteristic that each grain separates when cooked.",
                       "This makes it commonly used in dishes like pilaf and biryani.",
                       "Indica rice is generally grown in South Asia and Southeast Asia, and when cooked properly, it has a soft and slightly chewy texture."],
         riceCapacity: 1.0,
         waterCapacity: 2.0,
         recipe: [RecipeStep(instruction: "Rinse the rice in cold water until the rice is clean.", tip: nil, timerSetting: nil),
                  RecipeStep(instruction: "After washing the rice, remove all the water. Then, put the rice in a pot and add water.", tip: nil, timerSetting: nil),
                  RecipeStep(instruction: "Place the pot on the heat, and when the water starts to boil, reduce the heat to medium.", tip: nil, timerSetting: nil),
                  RecipeStep(instruction: "Cover with a lid and steam the rice for about 20 minutes. Do not stir the rice during this time.", tip: nil, timerSetting: 20),
                  RecipeStep(instruction: "Turn off the heat and do not open the lid for about 10 minutes.", tip: "This allows the rice grains to spread appropriately, making the rice more delicious.", timerSetting: 10),
                  RecipeStep(instruction: "Gently loosen the rice with a chopstick to finish.", tip: nil, timerSetting: nil)]),

    // MARK: Japonica Rice
    Rice(name: "Japonica Rice",
         image: "japonica_rice",
         description: ["Japonica rice has a short and wide grain shape, and when cooked, the grains tend to stick together.",
                       "This characteristic makes it ideal for dishes like sushi and bento.",
                       "Japonica rice is mainly grown in East Asia, and when cooked well, it has a sticky texture."],
         riceCapacity: 1.0,
         waterCapacity: 1.2,
         recipe: [RecipeStep(instruction: "Rinse the rice in cold water until the rice is clean.", tip: nil, timerSetting: nil),
                  RecipeStep(instruction: "After washing the rice, remove all the water. Then, put the rice in a pot and add water.", tip: nil, timerSetting: nil),
                  RecipeStep(instruction: "Place the pot on the heat, and when the water starts to boil, reduce the heat to medium.", tip: nil, timerSetting: nil),
                  RecipeStep(instruction: "Cover with a lid and steam the rice for about 15 minutes.", tip: "Do not stir the rice during this time.", timerSetting: 15),
                  RecipeStep(instruction: "Turn off the heat and do not open the lid for about 10 minutes.", tip: "This allows the rice grains to spread appropriately, making the rice more delicious.", timerSetting: 10),
                  RecipeStep(instruction: "Gently loosen the rice with a chopstick to finish.", tip: nil, timerSetting: nil)]),

    // MARK: Brown Rice
    Rice(name: "Brown Rice",
         image: "brown_rice",
         description: ["Brown rice is white rice that has not had its bran removed, and it is rich in vitamins B1, dietary fiber, and minerals.",
                       "Brown rice takes a bit more time to cook and has a firmer texture than white rice."],
         riceCapacity: 1.0,
         waterCapacity: 2.5,
         recipe: [RecipeStep(instruction: "Rinse the rice in cold water until the rice is clean.", tip: nil, timerSetting: nil),
                  RecipeStep(instruction: "After washing the rice, remove all the water. Then, put the rice in a pot and add water.", tip: nil, timerSetting: nil),
                  RecipeStep(instruction: "Place the pot on the heat, and when the water starts to boil, reduce the heat to medium.", tip: nil, timerSetting: nil),
                  RecipeStep(instruction: "Cover with a lid and steam the rice for about 35 minutes.", tip: "Do not stir the rice during this time.", timerSetting: 35),
                  RecipeStep(instruction: "Turn off the heat and do not open the lid for about 10 minutes.", tip: "This allows the rice grains to spread appropriately, making the rice more delicious.", timerSetting: 10),
                  RecipeStep(instruction: "Gently loosen the rice with a chopstick to finish.", tip: nil, timerSetting: nil)]),

    // MARK: Glutinous Rice
    Rice(name: "Glutinous Rice",
         image: "glutinous_rice",
         description: ["Glutinous rice is especially known for its sticky texture and is often used in desserts or special dishes.",
                       "Glutinous rice has a sticky texture between the grains, making it commonly used in sticky rice dishes or rice cakes."],
         riceCapacity: 1.0,
         waterCapacity: 1.0,
         recipe: [RecipeStep(instruction: "inse the rice in cold water until the rice is clean.", tip: nil, timerSetting: nil),
                  RecipeStep(instruction: "After washing the rice, soak it in water for about 2 hours.", tip: "It is important to soak glutinous rice in advance to absorb sufficient moisture.", timerSetting: 120),
                  RecipeStep(instruction: "Drain the soaked glutinous rice and remove the moisture, then put the rice in a pot and add water.", tip: nil, timerSetting: nil),
                  RecipeStep(instruction: "Place the pot on the heat, and when the water starts to boil, reduce the heat to medium.", tip: nil, timerSetting: nil),
                  RecipeStep(instruction: "Cover with a lid and steam the rice for about 20 minutes.", tip: "Do not stir the rice during this time.", timerSetting: 20),
                  RecipeStep(instruction: "Turn off the heat and do not open the lid for about 10 minutes.", tip: "This allows the glutinous rice to spread appropriately, making the rice more delicious.", timerSetting: 10),
                  RecipeStep(instruction: "Gently loosen the rice with a chopstick to finish.", tip: nil, timerSetting: nil)]),

    // MARK: Black Rice
    Rice(name: "Black Rice",
         image: "black_rice",
         description: ["Black rice is rich in antioxidants, making it good for your health.",
                       "Black rice has a deep purple color and a nutty flavor.",
                       "Black rice is used in salads and desserts, providing beneficial nutrients for your health."],
         riceCapacity: 1.0,
         waterCapacity: 2.5,
         recipe: [RecipeStep(instruction: "Rinse the rice in cold water until the rice is clean.", tip: nil, timerSetting: nil),
                  RecipeStep(instruction: "After washing the rice, soak it in water for about 2 hours.", tip: "It is important to soak black rice in advance to absorb sufficient moisture.", timerSetting: 120),
                  RecipeStep(instruction: "Drain the soaked black rice and remove the moisture, then put the rice in a pot and add water.", tip: nil, timerSetting: nil),
                  RecipeStep(instruction: "Place the pot on the heat, and when the water starts to boil, reduce the heat to medium.", tip: nil, timerSetting: nil),
                  RecipeStep(instruction: "Cover with a lid and steam the rice for about 35 minutes.", tip: "Do not stir the rice during this time.", timerSetting: 35),
                  RecipeStep(instruction: "Turn off the heat and do not open the lid for about 10 minutes.", tip: "This allows the black rice to spread appropriately, making the rice more delicious.", timerSetting: 10),
                  RecipeStep(instruction: "Gently loosen the rice with a chopstick to finish.", tip: nil, timerSetting: nil)]),
    
    // MARK: Barley Rice
    Rice(name: "Barley Rice",
         image: "barley_rice",
         description: ["As a grain, barley is rich in dietary fiber and vitamins, beneficial for heart health.",
                       "Barley has a pleasant texture and is commonly used in salads and soups, and barley rice has a soft and nutty taste."],
         riceCapacity: 1.0,
         waterCapacity: 3.0,
         recipe: [RecipeStep(instruction: "Rinse it in cold water until the barley is clean.", tip: nil, timerSetting: nil),
                  RecipeStep(instruction: "After washing the barley, soak it in water for about 1 hour.", tip: "It is important to soak barley in advance to absorb sufficient moisture.", timerSetting: 60),
                  RecipeStep(instruction: "Drain the soaked barley and remove the moisture, then put the barley in a pot and add water.", tip: nil, timerSetting: nil),
                  RecipeStep(instruction: "Place the pot on the heat, and when the water starts to boil, reduce the heat to medium.", tip: nil, timerSetting: nil),
                  RecipeStep(instruction: "Cover with a lid and steam the rice for about 35 minutes.", tip: "Do not stir the rice during this time.", timerSetting: 35),
                  RecipeStep(instruction: "Turn off the heat and do not open the lid for about 10 minutes.", tip: "This allows the barley to spread appropriately, making the rice more delicious.", timerSetting: 10),
                  RecipeStep(instruction: "Gently loosen the rice with a chopstick to finish.", tip: nil, timerSetting: nil)])
  ]
}
