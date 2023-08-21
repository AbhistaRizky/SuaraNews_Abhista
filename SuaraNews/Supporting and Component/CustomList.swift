//
//  CustomList.swift
//  SuaraNews
//
//  Created by laptop MCO on 20/08/23.
//

import SwiftUI

struct CustomList: View {
    @State var rowLabel: String
    @State var rowIcon: String
    @State var rowContent: String? = nil
    @State var rowTintColor: Color
    @State var rowLinkLabel: String? = nil
    @State var rowLinkDestination: String? = nil
    
    var body: some View {
        LabeledContent {
            if rowContent != nil {
                Text(rowContent!)
                    .foregroundStyle(.primary)
                    .fontWeight(.heavy)
            } else if (rowLinkLabel != nil && rowLinkDestination != nil) {
                Link(rowLinkLabel!, destination: URL(string: rowLinkDestination!)!)
                    .foregroundStyle(.pink)
                    .fontWeight(.heavy)
            } else {
                EmptyView()
            }
        } label: {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundStyle(rowTintColor)
                    Image(systemName: rowIcon)
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                }
                
                Text(rowLabel)
            }
        }
        
    }
}


struct CustomList_Previews: PreviewProvider {
    static var previews: some View {
            List {
                CustomList(
                    rowLabel: "Website",
                    rowIcon: "globe",
                    rowContent: nil,
                    rowTintColor: .pink,
                    rowLinkLabel: "Abhista Rizky Pratama Wibowo",
                    rowLinkDestination: "https://id.linkedin.com/in/abhistarizky"
                )
            }
        }
    }
