//
//  ViewModel.swift
//  TMDBTest
//
//  Created by Bezdenezhnykh Sergey on 17.06.2021.
//

import Foundation

protocol ViewModelProtocol: AnyObject {
    var viewData: ((Movies)->())? { get set }
    func viewDidLoad()
}

final class ViewModel: ViewModelProtocol {
    weak var coordinator: Coordinator?
    private var apiService: APIServiceProtocol
    var viewData: ((Movies) -> ())?
    
    init() {
        self.apiService =  APIService()
    }
    
    func viewDidLoad() {
        apiService.fetchMovies { result in
            DispatchQueue.main.async { [weak self] in
                switch result {
                case .success(let movies):
                    self?.viewData?(movies)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
