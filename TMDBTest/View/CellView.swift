//
//  CellView.swift
//  TMDBTest
//
//  Created by Bezdenezhnykh Sergey on 17.06.2021.
//

import UIKit

class CellView: UITableViewCell {
    
    private lazy var viewBack: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        view.layer.cornerRadius = 10.0
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var imagePoster: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10.0
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var labelTitle: UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.textColor = .white
        label.text = "Title"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var labelRelise: UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.textColor = .white
        label.text = "Title"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var labelScore: UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.textColor = .white
        label.text = "Title"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.contentView.backgroundColor = .systemBackground
        self.contentView.addSubview(viewBack)
        self.contentView.addSubview(imagePoster)
        self.contentView.addSubview(labelTitle)
        self.contentView.addSubview(labelRelise)
        self.contentView.addSubview(labelScore)
        addConsrtraint()
    }
    
    var movie: Movie? {
        didSet {
            if let url = movie?.posterURL {
                ImageLoader().load(url: url) { [weak self] image in
                    self?.imagePoster.image = image
                }
            }
            labelTitle.text = movie?.originalTitle ?? ""
            labelRelise.text = "Release Date  " + (movie?.releaseDate ?? "")
            labelScore.text = String(movie?.voteAverage ?? 0)
        }
    }
    
    private func addConsrtraint() {
        viewBack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4).isActive = true
        viewBack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4).isActive = true
        viewBack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        viewBack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        
        imagePoster.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        imagePoster.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        imagePoster.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        imagePoster.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        labelTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        labelTitle.heightAnchor.constraint(equalToConstant: 45).isActive = true
        labelTitle.leadingAnchor.constraint(equalTo: imagePoster.trailingAnchor).isActive = true
        labelTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        
        labelRelise.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 20).isActive = true
        labelRelise.heightAnchor.constraint(equalToConstant: 20).isActive = true
        labelRelise.leadingAnchor.constraint(equalTo: imagePoster.trailingAnchor).isActive = true
        labelRelise.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        
        labelScore.topAnchor.constraint(equalTo: labelRelise.bottomAnchor, constant: 20).isActive = true
        labelScore.heightAnchor.constraint(equalToConstant: 25).isActive = true
        labelScore.leadingAnchor.constraint(equalTo: imagePoster.trailingAnchor).isActive = true
        labelScore.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
    }
}




