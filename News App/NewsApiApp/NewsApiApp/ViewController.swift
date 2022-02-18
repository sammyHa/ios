//
//  ViewController.swift
//  NewsApiApp
//
//  Created by Samim Hakimi on 2/14/22.
//

import UIKit
import SafariServices

class ViewController: UIViewController, UITabBarDelegate, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    static let API_KEY  = "064b8b7c6e8b4be9a0f85453d2d4a119"
    private var articles = [Article]()
    private var viewModels = [NewTableViewCellViewModel]()
    
    private let tableView : UITableView = {
        let table = UITableView()
        table.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.identifier)
        return table
    }()
    
    private let searchVC = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        fetchTopStories()
        createSearchBar()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    
    func createSearchBar(){
        navigationItem.searchController = searchVC
        searchVC.searchBar.delegate = self
    }
    func fetchTopStories(){
        
        APICaller.shared.getTopStories {[weak self] reuslt in
            switch reuslt {
                case .success(let articles):
                    self?.articles = articles
                    self?.viewModels = articles.compactMap({
                        NewTableViewCellViewModel(
                            title: $0.title,
                            
                            subtitle: $0.description ?? "No Description" ,
                            imageURL: URL(string: $0.urlToImage ?? "")
                        )
                        
                    })
                    
                    // refresh the data on the table
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                    
                    
                case . failure(let error):
                    print(error)
            }
        }
    }
    //table
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        print("viewModel count: \(viewModels.count)")
        return viewModels.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier, for: indexPath) as? NewsTableViewCell else {
            fatalError()
        }
        cell.configure(with: viewModels[indexPath.row])
        //print("viewModel count: \(viewModels[indexPath.row])")
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let article = articles[indexPath.row]
        
        guard let url = URL(string: article.url ?? "") else {
            return
        }
        
        let vc =  SFSafariViewController(url: url)
        present(vc, animated: true)
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    //search
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text, !text.isEmpty else {
            return
        }
        
        APICaller.shared.searchNews(with: text) {[weak self] reuslt in
            switch reuslt {
                case .success(let articles):
                    self?.articles = articles
                    self?.viewModels = articles.compactMap({
                        NewTableViewCellViewModel(
                            title: $0.title,
                            
                            subtitle: $0.description ?? "No Description" ,
                            imageURL: URL(string: $0.urlToImage ?? "")
                        )
                        
                    })
                    
                    // refresh the data on the table
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                        self?.searchVC.dismiss(animated: true, completion: nil)
                        
                    }
                    
                case . failure(let error):
                    print(error)
            }
        }
    }
    
}
