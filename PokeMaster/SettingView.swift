//
//  SettingView.swift
//  PokeMaster
//
//  Created by 朱晓东 on 2020/12/21.
//  Copyright © 2020 OneV's Den. All rights reserved.
//

import SwiftUI

class Settings: ObservableObject {
    enum AccountBehavior: CaseIterable {
        case register, login
    }
    
    enum Sorting: CaseIterable {
        case id, name, color, favorite
    }
    
    @Published var accountBehavior = AccountBehavior.login
    @Published var email = ""
    @Published var password = ""
    @Published var verifyPassword = ""
    
    @Published var showEnglishName = true
    @Published var sorting = Sorting.id
    @Published var showFavoriteOnly = false
}

extension Settings.Sorting {
    var text: String{
        switch self {
        case .id: return "ID"
        case .name: return "名字"
        case .color: return "颜色"
        case .favorite: return "最爱"
        }
    }
}

extension Settings.AccountBehavior {
    var text: String {
        switch self {
        case .register: return "注册"
        case .login: return "登录"
        }
    }
}



struct SettingView: View {
    @ObservedObject var settings = Settings()
    var body: some View {
        Form {
            accountSection
            optionSection
            actionSection
        }
    }
    var accountSection: some View {
        Section(header: Text("账号")) {
            Picker(selection: $settings.accountBehavior, label: Text(""))
            {
                ForEach(Settings.AccountBehavior.allCases, id:\.self) {
                    Text($0.text)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            TextField("电子邮箱", text: $settings.email)
            SecureField("密码", text: $settings.password)
            
            if settings.accountBehavior == .register {
                SecureField("确认密码", text: $settings.verifyPassword)
            }
            
            Button(settings.accountBehavior.text){
                print("登录/注册")
            }
        }
    }
    
    var optionSection: some View {
        Section(header: Text("选项")){
            Toggle("显示英文名", isOn: $settings.showEnglishName)
            Picker("排序方式", selection: $settings.sorting) {
                ForEach(Settings.Sorting.allCases, id: \.self) {
                    Text($0.text)
                }
            }
            Toggle("只显示收藏", isOn: $settings.showFavoriteOnly)
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
        SettingView()
    }
}
