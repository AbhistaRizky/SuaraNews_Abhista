//
//  SearchText.swift
//  SuaraNews
//
//  Created by laptop MCO on 20/08/23.
//

import SwiftUI

struct ConditionalSearchable: ViewModifier {
    let isSearchable: Bool
    @ObservedObject var newsVM: HomeViewModel // Add viewModel parameter

    func body(content: Content) -> some View {
        if isSearchable {
            return AnyView(content.searchable(text: $newsVM.searchText))
        } else {
            return AnyView(content)
        }
    }
}

extension View {
    func conditionalSearchable(isSearchable: Bool, viewModel: HomeViewModel) -> some View {
        self.modifier(ConditionalSearchable(isSearchable: isSearchable, newsVM: viewModel))
    }
}
