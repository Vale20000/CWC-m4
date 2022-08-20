//
//  RecipeTabView.swift
//  RecipeListApp
//
//  Created by Valentino Masetti on 18/08/22.
//

import SwiftUI

struct RecipeTabView: View {
    var body: some View {
        
        TabView {
            
            // SubViews
            RecipeFeaturedView()
                .tabItem {
                    VStack {
                        Image(systemName: "star")
                        Text("Featured")
                    }
                }
            
            RecipeListView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                }
            
        }.environmentObject(RecipeModel())
        
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
