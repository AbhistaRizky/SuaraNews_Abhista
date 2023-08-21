//
//  AboutView.swift
//  SuaraNews
//
//  Created by laptop MCO on 20/08/23.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        NavigationStack {
            List {
                //: MARK - SECTION: HEADER
                Section {
                    HStack {
                        Spacer()
                        Text("Suara News")
                            .textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
                            .font(.system(.largeTitle, design: .rounded))
                            .fontWeight(.heavy)
                            .foregroundStyle(.blue.gradient)
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        Text("Tempat berita paling update dan bismillah terpercaya 🙏")
                            .multilineTextAlignment(.center)
                            .fontWeight(.medium)
                        Spacer()
                    }
                } //: HEADER Section
                
                //: MARK - SECTION: ABOUT
                Section(
                    header: Text("ABOUT THE APP"),
                    footer: HStack {
                        Spacer()
                        Text("Copyright 2023 ©All right reserved.")
                        Spacer()
                    }
                        .padding(.vertical, 8)
                ) {
                    CustomList(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "SuaraNews", rowTintColor: .blue)
                    
                    CustomList(rowLabel: "Compatibility", rowIcon: "info.circle", rowContent: "iOS", rowTintColor: .red)
                    
                    CustomList(rowLabel: "Technology", rowIcon: "swift", rowContent: "Swift", rowTintColor: .orange)
                    
                    CustomList(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .purple)
                    
                    CustomList(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "Abhista Rizky Pratama Wibowo", rowTintColor: .mint)
                    
                    CustomList(rowLabel: "Designer", rowIcon: "paintpalette", rowContent: "Abhista Rizky Pratama Wibowo", rowTintColor: .pink)
                    
                    CustomList(rowLabel: "Website", rowIcon: "globe", rowTintColor: .indigo, rowLinkLabel: "Abhista Rizky Pratama Wibowo", rowLinkDestination: "https://id.linkedin.com/in/abhistarizky")
                    
                } //: SECTION
                
            } //: LIST
            .navigationTitle("About")
            .navigationBarTitleDisplayMode(.inline)
        } //: NAV
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
