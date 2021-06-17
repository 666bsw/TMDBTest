//
//  MainCoordinator.swift
//  TMDBTest
//
//  Created by Bezdenezhnykh Sergey on 17.06.2021.
//

import UIKit

class MainCoordinator: Coordinator {
    private let window: UIWindow
    var navigationController: UINavigationController
    //private(set) var children: [Coordinator]? = nil
    
    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
    }
    
    func start() {
        let viewModel = ViewModel()
        let vc: UIViewController & Coordinating = ViewController()
        viewModel.coordinator = self
        vc.viewModel = viewModel
        navigationController.setViewControllers([vc], animated: false)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
