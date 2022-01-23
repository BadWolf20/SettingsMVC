//
//  SettingsModel.swift
//  SettingsMVC
//
//  Created by Roman on 23.01.2022.
//

import Foundation
import UIKit

final class SettingsModel {

    func createModel() -> [Setting]{
    return [
        Setting(name: "Airplane Mode",
                style: .check,      block: .fast,    imageMain: UIImage(named: "Airplane Mode")),
        Setting(name: "Wi-Fi",
                style: .move,       block: .fast,    imageMain: UIImage(named: "Wi-Fi")),
        Setting(name: "Bluetooth",
                style: .move,       block: .fast,    imageMain: nil),
        Setting(name: "Cellular",
                style: .move,       block: .fast,    imageMain: UIImage(named: "Cellular")),
        Setting(name: "Personal Hotspot",
                style: .move,       block: .fast,    imageMain: UIImage(named: "Personal Hotspot")),
        Setting(name: "Notifications",
                style: .move,       block: .notifications,    imageMain: UIImage(named: "Notifications")),
        Setting(name: "Sounds & Haptics",
                style: .move,       block: .notifications,    imageMain: UIImage(named: "Sounds & Haptics")),
        Setting(name: "Do Not Disturb",
                style: .move,       block: .notifications,    imageMain: UIImage(named: "Do Not Disturb")),
        Setting(name: "Screen Time",
                style: .move,       block: .notifications,    imageMain: UIImage(named: "Screen Time")),
        Setting(name: "General",
                style: .move,       block: .main,    imageMain: UIImage(named: "General")),
        Setting(name: "Control Center",
                style: .move,       block: .main,    imageMain: nil),
        Setting(name: "Display & Brightness",
                style: .move,       block: .main,    imageMain: nil),
        Setting(name: "Wallpaper",
                style: .move,       block: .main,    imageMain: nil)
    ]
    }
}
