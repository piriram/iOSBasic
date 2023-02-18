//
//  PlayButton.swift
//  DataFlow-SwiftUI
//
//  Created by ram on 2023/02/19.
//

import SwiftUI

struct PlayButton: View {
    @Binding var isPlaying: Bool //데이터를 받는건 바인딩

    var body: some View {
        Button {
            self.isPlaying.toggle()//토글은 정보를 바꿔주는 역할
        } label: {
            Image(systemName: isPlaying ? "pause.circle": "play.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 80)
                .foregroundColor(.primary)
        }
    }
}
