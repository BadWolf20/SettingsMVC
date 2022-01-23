//
//  ViewController.swift
//  SettingsMVC
//
//  Created by Roman on 23.01.2022.
//

import UIKit

class MainViewController: UIViewController {

    var model: SettingsModel?

    private var MainView: MainView? {
        guard isViewLoaded else { return nil }
        return view as? MainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view = SettingsMVC.MainView()
        model = SettingsModel()
        configureView()
    }

}

private extension MainViewController {
    func configureView() {
        guard let models = model?.createModel() else { return }
        MainView?.configureView(with: models)
    }
}


