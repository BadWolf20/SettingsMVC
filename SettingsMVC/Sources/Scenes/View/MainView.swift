//
//  MainView.swift
//  SettingsMVC
//
//  Created by Roman on 23.01.2022.
//

import Foundation
import UIKit


class MainView: UIView {

    // MARK: - Configuration
    func configureView(with settings: [Setting]) {
        self.settingsList = settings

    }

    // MARK: - Private properties
    private var settingsList = [Setting]()
    private var set = [Setting]()

    // MARK: - Views
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(SettingsTableViewCell.self,
                           forCellReuseIdentifier: SettingsTableViewCell.identifier)
        tableView.frame = CGRect.init(origin: .zero, size: frame.size)
        tableView.rowHeight = 50
        tableView.translatesAutoresizingMaskIntoConstraints = false

        tableView.dataSource = self
        tableView.delegate = self

        return tableView
    }()

    // MARK: - Initial

    init() {
        super.init(frame: .zero)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        backgroundColor = .white
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Settings

    private func setupHierarchy() {
        addSubview(tableView)
    }

    private func setupLayout() {
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
    }
}


//  Добавление таблицы
extension MainView: UITableViewDataSource, UITableViewDelegate {

    // При выборе строки
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //sendNotification(title: "You push '\(settingsList[getSelectedRowNumber()].name)' button")
        print("You push '\(settingsList[getSelectedRowNumber()].name)' button")

        moveToSetttingView(settingsList[getSelectedRowNumber()].name)

        // Внутриние функции
        func getSelectedRowNumber() -> Int {
            var selectedRowNumber = Int()
            switch indexPath.section {
            case 0:
                selectedRowNumber = indexPath.row
            case 1...:
                selectedRowNumber = getRowsNumber(indexPath.section) + indexPath.row
            default:
                selectedRowNumber = 666
            }
            return selectedRowNumber
        }

        func getRowsNumber(_ sectionNum: Int) -> Int {
            var c = Int()
            var out = Int()
            for i in Setting.Block.allValues {
                out += Setting.getSettingsSectionLenght(list: settingsList, block: i)
                if c == sectionNum - 1 {
                    break
                }
                c += 1
            }
            return out
        }

    }

    // При момент до выбора строки (собираемся выбрать)
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if indexPath.row == 0 && indexPath.section == 0 {
            return nil
        }
        return indexPath
    }

    // Количество секций
    func numberOfSections(in tableView: UITableView) -> Int {
        return Setting.getSectionsCount(list: settingsList)
    }

    // Количество ячеек в каждой секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return Setting.getSettingsSectionLenght(list: settingsList, block: .fast)
        case 1:
            return Setting.getSettingsSectionLenght(list: settingsList, block: .notifications)
        case 2:
            return Setting.getSettingsSectionLenght(list: settingsList, block: .main)
        default:
            return 0
        }
    }

    // Определение содержимого ячейки
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier, for: indexPath) as! SettingsTableViewCell

        switch indexPath.section {
        case 0:
            set = Setting.getSettingsList(list: settingsList, block: .fast)
        case 1:
            set = Setting.getSettingsList(list: settingsList, block: .notifications)
        case 2:
            set = Setting.getSettingsList(list: settingsList, block: .main)
        default:
            set = Setting.getSettingsList(list: settingsList, block: .fast)
        }

        cell.configureView(with: set[indexPath.row])

        return cell
    }

    // Переход на нужное View
    func moveToSetttingView(_ pageName: String) {
        switch pageName{
       // case "Wi-Fi":
            //navigationController?.pushViewController(WiFiViewController(), animated: true)
        default:
            print("No page")
        }
    }


}
