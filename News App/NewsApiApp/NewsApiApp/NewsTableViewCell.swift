//
//  TableViewCell.swift
//  NewsApiApp
//
//  Created by Samim Hakimi on 2/17/22.
//

import UIKit

class NewTableViewCellViewModel {
    
    let title: String
    let subtitle: String
    let imageURL: URL?
    var imageData: Data? = nil
    
    init(
        title   : String,
        subtitle: String,
        imageURL: URL?) {
            self.title = title
            self.subtitle = subtitle
            self.imageURL = imageURL
        }
    
}
class NewsTableViewCell: UITableViewCell {
    
    static let identifier = "NewsTableViewCell"
    
    private let newsTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    private let newsSubtitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: .light)
        return label
    }()
    
    private let newsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .secondarySystemFill
        
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        ///add views to the subview
        contentView.addSubview(newsTitleLabel)
        contentView.addSubview(newsSubtitleLabel)
        contentView.addSubview(newsImageView)
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        newsTitleLabel.frame = CGRect(
            x: 10,
            y: 0,
            width: contentView.frame.size.width - 170,
            height: 70)
        
        newsSubtitleLabel.frame = CGRect(
            x: 10,
            y: 70,
            width: contentView.frame.size.width - 170,
            height: contentView.frame.size.height/2)
        
        newsImageView.frame = CGRect(
            x: contentView.frame.size.width - 150,
            y: 5,
            width: 140,
            height: contentView.frame.size.height - 10)
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        newsTitleLabel.text = nil
        newsSubtitleLabel.text = nil
        newsImageView.image = nil
    }
    
    //configure each of the cell with viewModel
    
    func configure(with viewModel: NewTableViewCellViewModel){
        newsTitleLabel.text = viewModel.title
        newsSubtitleLabel.text = viewModel.subtitle
        
        // image setup
        if let data = viewModel.imageData {
            newsImageView.image = UIImage(data: data)
        } else if let url = viewModel.imageURL {
            //fetch imaage data
            URLSession.shared.dataTask(with: url) {[weak self] data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                viewModel.imageData = data
                DispatchQueue.main.async {
                    
                    self?.newsImageView.image = UIImage(data: data)
                }
            }
            .resume()
        }
    }
}
