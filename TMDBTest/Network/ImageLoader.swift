//
//  ImageLoader.swift
//  TMDBTest
//
//  Created by Bezdenezhnykh Sergey on 17.06.2021.
//

import UIKit

class ImageLoader {
    
    func load(url: URL, completion: @escaping (UIImage) -> ()) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        completion(image)
                    }
                }
            }
        }
    }
}
