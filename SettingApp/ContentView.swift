//
//  ContentView.swift
//  SettingApp
//
//  Created by junsoo on 12/24/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isAirplaneModeOn: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink(destination: Text("프로필 화면입니다.")) {
                        HStack {
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.blue)
                                .padding(.trailing, 10)
                            VStack(alignment: .leading, spacing: 5) {
                                Text("사용자 이름")
                                Text("Apple Id, iCloud, 미디어 및 구입")
                            }
                        }
                    }
                }
                Section {
                    SettingRow(title: "비행기 모드", icon: "airplane", iconColor: .orange, toggle: true, toggleState: $isAirplaneModeOn)
                    SettingRow(title: "Wi-Fi", icon: "wifi", iconColor: .blue)
                    SettingRow(title: "셀룰러", icon: "antenna.radiowaves.left.and.right", iconColor: .green)
                }
                Section(header: Text("알림")) {
                    SettingRow(title: "알림", icon: "bell.badge.fill", iconColor: .red)
                    SettingRow(title: "사운드 및 햅틱", icon: "speaker.wave.3.fill", iconColor: .purple)
                }
            }
            .navigationTitle("설정")
        }
    }
}

struct SettingRow: View {
    let title: String
    let icon: String
    let iconColor: Color
    var toggle: Bool = false
    @Binding var toggleState: Bool
    
    init(title: String, icon: String, iconColor: Color, toggle: Bool = false, toggleState: Binding<Bool> = .constant(false)) {
        self.title = title
        self.icon = icon
        self.iconColor = iconColor
        self.toggle = toggle
        self._toggleState = toggleState
    }
    
    var body: some View {
        NavigationLink(destination: Text("\(title) 화면입니다.")) {
            HStack {
                Image(systemName: icon)
                    .frame(width: 32, height: 32)
                    .foregroundColor(.white)
                    .background(iconColor)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                Text(title)
                
                Spacer()
                
                if toggle {
                    Toggle("", isOn: $toggleState)
                        .labelsHidden()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
