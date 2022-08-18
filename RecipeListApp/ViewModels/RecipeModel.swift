//
//  RecipeModel.swift
//  RecipeListApp
//
//  Created by Valentino Masetti on 13/08/22.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        // Parsed the local json file (services)
        self.recipes = DataService.getLocalData() // Con DataService() faccio un'instanza on-the-fly
        
        // Set the recipes property
    }
    
}
