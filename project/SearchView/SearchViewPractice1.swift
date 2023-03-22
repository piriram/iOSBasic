struct SearchViewPractice1: View {
    @State private var searchText: String = ""
    @State private var isSearching: Bool = false

    var body: some View {
        VStack {
            HStack {
                TextField("Search", text: $searchText)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .onTapGesture {
                        isSearching = true
                    }

                if isSearching {
                    //isSearching이 true이면 cancel버튼이 눌리며 검색창 초기화
                    Button(action: {
                        searchText = ""
                        isSearching = false
                    }, label: {
                        Text("Cancel")
                    })
                    .padding(.trailing, 10)
                    .transition(.move(edge: .trailing))
                    .animation(.default)
                }
            }
            .padding(.horizontal)

            Text("You entered: \(searchText)")
        }
    }
}

struct SearchViewPractice1_Previews: PreviewProvider {
    static var previews: some View {
        SearchViewPractice1()
    }
}
