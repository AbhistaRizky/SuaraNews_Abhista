//
//  NewsDetail.swift
//  SuaraNews
//
//  Created by laptop MCO on 20/08/23.
//

import SwiftUI

struct NewsDetail: View {
    let news: News
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    AsyncImage(url: URL(string: news.image.large)) { phase in
                        phase.resizable().scaledToFill()
                            .overlay {
                                Color.black
                                    .opacity(0.5)
                            }
                    } placeholder: {
                        ProgressView()
                            .frame(width: 80, height: 80)
                    }
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 220)
                    .clipped()
                    
                    VStack(alignment: .leading, spacing: 16) {
                        
                        Text(news.title)
                            .font(.system(.headline, design: .rounded))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .lineLimit(nil)
                       
                        Text(news.contentSnippet)
                            .font(.system(.body, design: .rounded))
                            .lineLimit(nil)
                        
                        Text("Published at: \(news.isoDate.formattedDate())")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                        
                        if(URL(string: news.link) != nil){
                            Link(destination: URL(string: news.link)!) {
                                HStack {
                                    Text("Selengkapnya")
                                    Image(systemName: "link")
                                }
                                .frame(width: 156, height: 32)
                                .background(Color.primary)
                                .mask(RoundedRectangle(cornerRadius: 6))
                                .foregroundStyle(.primary)
                            }
                            .offset(x: 200, y: 40)
                        }else {
                            Link(destination: URL(string: "www.google.com")!) {
                                Text(news.link)
                                HStack {
                                    Text("Selengkapnya")
                                    Image(systemName: "link")
                                }
                                .frame(width: 156, height: 32)
                                .background(Color.primary)
                                .mask(RoundedRectangle(cornerRadius: 6))
                                .foregroundStyle(.primary)
                            }
                            .offset(x: 200, y: 40)
                        }
                    }
                    .padding()
                }
            }
        }
        .toolbar{
            ToolbarItem {
                HStack {
                    Button {
                    } label: {
                     Image(systemName: "bookmark")
                    }
                }
            }
        }
    }
}

struct NewsDetail_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetail(news: News(
            title: "This is sample title",
            link: "www.google.com",
            contentSnippet: "this is author",
            isoDate: "2023-08-13T02:44:58.000Z",
            image: NewsImage(small: "https://media.suara.com/pictures/970x544/2023/08/19/80025-politikus-pdi-perjuangan-budiman-sudjatmiko.jpg", large: "https://media.suara.com/pictures/970x544/2023/08/19/80025-politikus-pdi-perjuangan-budiman-sudjatmiko.jpg?q=100")
            )
        )
    }
}
