//
//  MainAssembly.swift
//  AlamofireTest
//
//  Created by Denis Snezhko on 15.07.2022.
//

import UIKit

final class MainAssembly {
    static func assembly() -> UINavigationController {
        
        let viewController = MainCardTableViewController()
        let navigationController = UINavigationController(
            rootViewController: viewController
        )
        let view = viewController as MainCardTableViewControllerInput
        let presenter = MainCardTablePresenter(view: view)
        viewController.presenter = presenter
        return navigationController
    }
}
