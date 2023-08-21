//
//  NewsRow.swift
//  SuaraNews
//
//  Created by laptop MCO on 20/08/23.
//

import SwiftUI

struct NewsRow: View {
    let news: News
    
    var body: some View {
        HStack(spacing: 14) {
            AsyncImage(url: URL(string: news.image.small)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            } placeholder: {
                ProgressView()
                    .frame(width: 80, height: 80)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text(news.title)
                    .font(.system(size: 16, design: .rounded))
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .truncationMode(.tail)
                
                HStack {
//                    Text(news.content)
//                        .lineLimit(1)
                    Text("-")
                    Text(news.isoDate.formattedDate())
                        .lineLimit(1)
                }
                .font(.footnote)
                .foregroundStyle(.gray)
            }
        }
    }
}

struct NewsRow_Previews: PreviewProvider {
    static var previews: some View {
        NewsRow(news: News(
            title: "This is sample title",
            link: "www.google.com",
            contentSnippet: "This is author",
            isoDate: "2023-08-13T02:44:58.000Z",
            image: NewsImage(small: "https://media.suara.com/pictures/970x544/2023/08/19/80025-politikus-pdi-perjuangan-budiman-sudjatmiko.jpg", large: "https://media.suara.com/pictures/970x544/2023/08/04/1-whatsapp-image-2023-08-04-at-020343.jpeg?q=100")
            )
        )
    }
}
