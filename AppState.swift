//
//  AppState.swift
//  PokeMaster
//
//  Created by 朱晓东 on 2020/12/29.
//  Copyright © 2020 OneV's Den. All rights reserved.
//

import Foundation

struct AppState {
    var settings = Settings()
}

extension AppState {
    struct Settings {
        enum Sorting: CaseIterable {
            case id, name, color, favorite
        }
        
        var showEnglishName = true
        var sorting = Sorting.id
        var showFavoriteOnly = false
    }
}
