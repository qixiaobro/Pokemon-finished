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
    
    static func reduce(state: AppState,action: AppAction) -> AppState {
        var appState = state
        
        switch action {
        case .login(let email, let password):
            if password == "password" {
                let user = User(email: email, favoritePokemonIDs: [])
                appState.settings.loginUser = user
            }
        }
        return appState
    }
    
    func dispatch(action: AppAction) {
        #if DEBUG
        print("[ACTION]: \(action)")
        #endif
        let result = Store.reduce(state: appState, action: action)
        print("[RESULT]: \(result)")
        appState = result
    }
}
