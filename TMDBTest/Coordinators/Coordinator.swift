//
//  Coordinator.swift
//  TMDBTest
//
//  Created by Bezdenezhnykh Sergey on 17.06.2021.
//

import Foundation

protocol Coordinator: AnyObject {
    //var children: [Coordinator]? { get }
    func start()
}

protocol Coordinating: AnyObject  {
    var viewModel: ViewModelProtocol? { get set }
    var viewData: Movies?  { get set }
}
