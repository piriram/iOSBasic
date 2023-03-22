//
//  SearchViewPractice2.swift
//  SeeJang
//
//  Created by ram on 2023/03/23.
//

import SwiftUI

struct SearchViewPractice2: View {
    @State private var searchText: String = ""

    var body: some View {
        VStack {
            SearchBar(text: $searchText)
            Text("You entered: \(searchText)")
        }
    }
}

struct SearchBar: UIViewRepresentable {
    @Binding var text: String

    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String

        init(text: Binding<String>) {
            _text = text
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }
    // Coordinator
  makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(text: $text)
    }
    
    }
    // UISearchBar를생성하여 반환
    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        return searchBar
    }
    // 텍스트값을설정
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }
}
