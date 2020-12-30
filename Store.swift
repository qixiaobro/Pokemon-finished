//
//  Store.swift
//  PokeMaster
//
//  Created by 朱晓东 on 2020/12/29.
//  Copyright © 2020 OneV's Den. All rights reserved.
//

import Combine

class Store: ObservableObject {
    @Published var appState = AppState()
}
