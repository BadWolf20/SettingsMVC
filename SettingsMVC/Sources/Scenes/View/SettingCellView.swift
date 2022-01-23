//
//  SettingCellView.swift
//  SettingsMVC
//
//  Created by Roman on 23.01.2022.
//

import Foundation
import UIKit


final class SettingsTableViewCell: UITableViewCell {

    static let identifier = "SettingsTableViewCell"
    
    // MARK: - Views
    lazy var switchObj: UISwitch = {
        let switchObj = UISwitch(frame: CGRect(x: 1, y: 1, width: 20, height: 20))
        switchObj.isOn = false
        switchObj.addTarget(self, action: #selector(tog(_:)), for: .valueChanged)

        return switchObj
    }()

    // MARK: - Configuration
    func configureView(with data: Setting) {
        var content = defaultContentConfiguration()
        content.text = data.name
        content.image = data.imageMain
        content.imageProperties.maximumSize = CGSize(width: 30, height: 30)
        contentConfiguration = content
        setStyle(data: data)
    }

    // При повторном использовании
    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
    }

}

    // MARK: - Actions
extension SettingsTableViewCell {
    // Срабатывание при переключении переключателя
    @objc private func tog(_ toggle: UISwitch) {
        print("Airplane mode is \(toggle.isOn ? "on" : "off")")
    }
}

    // MARK: - Functions
extension SettingsTableViewCell {
    // Определение стиля
    func setStyle(data: Setting) {
        switch data.style {
        case .check:
            accessoryView = switchObj
        case .move:
            accessoryType = .disclosureIndicator
        }
    }
}
