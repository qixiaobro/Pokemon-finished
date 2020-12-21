//
//  SettingRootView.swift
//  PokeMaster
//
//  Created by 朱晓东 on 2020/12/21.
//  Copyright © 2020 OneV's Den. All rights reserved.
//

import SwiftUI

struct SettingRootView: View {
    var body: some View {
        NavigationView{
            SettingView().navigationBarTitle("设置")
        }
    }
}

struct SettingRootView_Previews: PreviewProvider {
    static var previews: some View {
        SettingRootView()
    }
}
