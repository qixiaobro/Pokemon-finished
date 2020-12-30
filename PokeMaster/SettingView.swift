//
//  SettingView.swift
//  PokeMaster
//
//  Created by 朱晓东 on 2020/12/21.
//  Copyright © 2020 OneV's Den. All rights reserved.
//

import SwiftUI

extension AppState.Settings.AccountBehavior {
    var text: String {
        switch self {
        case .register: return "注册"
        case .login: return "登录"
        }
    }
}

extension AppState.Settings.Sorting {
    var text: String {
        switch self {
        case .id: return "ID"
        case .name: return "名字"
        case .color: return "颜色"
        case .favorite: return "最爱"
        }
    }
}



struct SettingView: View {
    @EnvironmentObject var store: Store
    var settingsBinding: Binding<AppState.Settings> {
        $store.appState.settings
    }
    
    var settings:AppState.Settings {
        store.appState.settings
    }
    
    var body: some View {
        Form {
            accountSection
            optionSection
            actionSection
        }
    }
    var accountSection: some View {
        Section(header: Text("账号")) {
            if settings.loginUser == nil {
                Picker(selection: settingsBinding.accountBehavior, label: Text(""))
                {
                    ForEach(AppState.Settings.AccountBehavior.allCases, id:\.self) {
                        Text($0.text)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                TextField("电子邮箱", text: settingsBinding.email)
                SecureField("密码", text: settingsBinding.password)
                
                if settings.accountBehavior == .register {
                    SecureField("确认密码", text: settingsBinding.verifyPassword)
                }
                
                Button(settings.accountBehavior.text){
                    self.store.dispatch(
                        action: .login(
                            email: self.settings.email,
                            password: self.settings.password
                        )
                    )
                }
            } else {
                Text(settings.loginUser!.email)
                Button("注销") {
                    print("注销")
                }
            }
            
        }
    }
    
    var optionSection: some View {
        Section(header: Text("选项")){
            Toggle("显示英文名", isOn: settingsBinding.showEnglishName)
            Picker("排序方式", selection: settingsBinding.sorting) {
                ForEach(AppState.Settings.Sorting.allCases, id: \.self) {
                    Text($0.text)
                }
            }
            Toggle("只显示收藏", isOn: settingsBinding.showFavoriteOnly)
        }
    }
    
    var actionSection: some View {
        Section(){
            Button("清空缓存") {
                print("清空缓存")
            }
            .foregroundColor(.red)
        }
    }
}


struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        let store = Store()
        store.appState.settings.sorting = .color
        return SettingView().environmentObject(store)
    }
}
