//
//  ContentView.swift
//  SuaraNews
//
//  Created by laptop MCO on 18/08/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "doc.text.image")
                    Text("Browse")
                }
                .tag(0)
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
                .tag(1)
            
            BookmarkView()
                .tabItem {
                    Image(systemName: "bookmark")
                    Text("Bookmark")
                }
                .tag(2)
            
            AboutView()
                .tabItem {
                    Image(systemName:"doc.badge.gearshape")
                    Text("About")
                }
                .tag(3)
            
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
