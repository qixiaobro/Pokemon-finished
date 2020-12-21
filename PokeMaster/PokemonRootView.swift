//
//  PokemonRootView.swift
//  PokeMaster
//
//  Created by 朱晓东 on 2020/12/21.
//  Copyright © 2020 OneV's Den. All rights reserved.
//

import SwiftUI

struct PokemonRootView: View {
    var body: some View {
        NavigationView{
            PokemonList().navigationBarTitle("宝可梦列表")
        }
    }
}

struct PokemonRootView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonRootView()
    }
}
