//
//  HomeViewModels.swift
//  SuaraNews
//
//  Created by laptop MCO on 20/08/23.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var news: [News] = []
    @Published var isLoading = false
    @Published var searchText: String = ""
    
    // Search function
    var allNews: [News] {
        return news
    }
    
    var filteredNews: [News] {
        if searchText.isEmpty {
            return news
        } else {
            return news.filter { news in
                news.title.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    func fetchNews() async {
        DispatchQueue.main.async {
            self.isLoading = true // Set isLoading to true while fetching
        }
        
        Task {
            do {
                let url = URL(string: "https://berita-indo-api-next.vercel.app/api/suara-news/")!
                let (data, _) = try await URLSession.shared.data(from: url)
                let response = try JSONDecoder().decode(NewsResponse.self, from: data)
                
                DispatchQueue.main.async {
                    self.news = response.data.map { newsData in
                        News(
                            title: newsData.title,
                            link: newsData.link,
                            contentSnippet: newsData.contentSnippet,
                            isoDate: newsData.isoDate,
                            image: newsData.image
                        )
                    }
                    self.isLoading = false
                }
            } catch {
                print("Error fetching data: \(error)")
            }
        }
    }
    
    func fetchNewsOtomotif() async {
        DispatchQueue.main.async {
            self.isLoading = true // Set isLoading to true while fetching
        }
        
        Task {
            do {
                let url = URL(string: "https://berita-indo-api-next.vercel.app/api/suara-news/otomotif")!
                let (data, _) = try await URLSession.shared.data(from: url)
                let response = try JSONDecoder().decode(NewsResponse.self, from: data)
                
                DispatchQueue.main.async {
                    self.news = response.data.map { newsData in
                        News(
                            title: newsData.title,
                            link: newsData.link,
                            contentSnippet: newsData.contentSnippet,
                            isoDate: newsData.isoDate,
                            image: newsData.image
                        )
                    }
                    self.isLoading = false
                }
            } catch {
                print("Error fetching data: \(error)")
            }
        }
    }
    
    func fetchNewsLifestyle() async {
        DispatchQueue.main.async {
            self.isLoading = true // Set isLoading to true while fetching
        }
        
        Task {
            do {
                let url = URL(string: "https://berita-indo-api-next.vercel.app/api/suara-news/lifestyle")!
                let (data, _) = try await URLSession.shared.data(from: url)
                let response = try JSONDecoder().decode(NewsResponse.self, from: data)
                
                DispatchQueue.main.async {
                    self.news = response.data.map { newsData in
                        News(
                            title: newsData.title,
                            link: newsData.link,
                            contentSnippet: newsData.contentSnippet,
                            isoDate: newsData.isoDate,
                            image: newsData.image
                        )
                    }
                    self.isLoading = false
                }
            } catch {
                print("Error fetching data: \(error)")
            }
        }
    }

}

