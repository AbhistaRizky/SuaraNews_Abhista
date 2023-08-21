//
//  HomeView.swift
//  SuaraNews
//
//  Created by laptop MCO on 20/08/23.
//

import SwiftUI

struct HomeView: View {
    @State private var firstState = "Home"
    @StateObject private var newsVM = HomeViewModel()
    var navbarState = ["Home", "Lifestyle", "Otomotif"]
    
    var body: some View {
        NavigationStack {
            if newsVM.isLoading {
                ProgressView("Load News...")
            } else {
                HStack {
                    Picker("blablabla", selection: $firstState.onChange( {tag in
                        Task {
                            if (tag == "Home") {
                                await newsVM.fetchNews()
                            }
                            else if (tag == "Lifestyle") {
                                await newsVM.fetchNewsLifestyle()
                            }
                            else if (tag == "Otomotif") {
                                await newsVM.fetchNewsOtomotif()
                            }
                        }
                    })) {
                        ForEach(navbarState, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    Text(" ")
                }
                List(newsVM.allNews) { newsItem in
                    NavigationLink(destination: NewsDetail(news: newsItem)) {
                        NewsRow(news: newsItem)
                    }
                    
                }
                .refreshable {
                    if(firstState == "Home") {
                        await newsVM.fetchNews()
                    }
                    else if (firstState == "Lifestyle"){
                        await newsVM.fetchNewsLifestyle()
                    }
                    else if (firstState == "Otomotif"){
                        await newsVM.fetchNewsOtomotif()
                    }
                }
                .listStyle(.plain)
                .navigationTitle("Suara News")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar(content: {
                    ToolbarItem(placement: .principal) {
                        AsyncImage(url: URL(string: "https://klikkaltim.com/images/suara.png")) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 200, height: 400)
                        } placeholder: {
                            Text("Suara News")
                        }
                    }
                })
            }
        }
        .task {
            if(firstState == "Home") {
                await newsVM.fetchNews()
            }
            else if (firstState == "Lifestyle") {
                await newsVM.fetchNewsLifestyle()
            }
            else if (firstState == "Otomotif") {
                await newsVM.fetchNewsOtomotif()
            }
        }
    }
}
extension Binding where Value: Equatable {
    func onChange(_ handler: @escaping (Value) -> Void) -> Self {
        return Binding(
            get: { self.wrappedValue },
            set: { newValue in
                if self.wrappedValue != newValue {
                    self.wrappedValue = newValue
                    handler(newValue)
                }
            }
        )}
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
