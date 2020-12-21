//
//  PokemonList.swift
//  PokeMaster
//
//  Created by 朱晓东 on 2020/12/20.
//  Copyright © 2020 OneV's Den. All rights reserved.
//

import SwiftUI

struct PokemonList: View {
    @State var expandingIndex: Int?
    @State private var searchTerm : String = ""
    var body: some View {
        ScrollView {
            LazyVStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Search", text: $searchTerm, onCommit:  {
                        
                    })
                }
                .padding()
                .frame(height:40)
                .background(
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .stroke(Color.gray, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                )
                .padding(.horizontal)
                ForEach(PokemonViewModel.all) { pokemon in
                    PokemonInfoRow(
                        model: pokemon,
                        expanded: self.expandingIndex == pokemon.id
                    )
                    .onTapGesture {
                        withAnimation(
                            .spring(
                                response: 0.55,
                                dampingFraction: 0.425,
                                blendDuration: 0
                            )
                        )
                        {
                            if self.expandingIndex == pokemon.id {
                                self.expandingIndex = nil
                            } else {
                                self.expandingIndex = pokemon.id
                            }
                        }
                    }
                }
            }
        }
        .overlay(
            VStack {
                Spacer()
                PokemonInfoPanel(model: PokemonViewModel.sample(id: 1))
            }.edgesIgnoringSafeArea(.bottom)
        )
    }
}

struct PokemonList_Previews: PreviewProvider {
    static var previews: some View {
        PokemonList()
    }
}
