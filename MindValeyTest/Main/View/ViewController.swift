//
//  ViewController.swift
//  MindValeyTest
//
//  Created by Lazaro Neto on 09/11/2018.
//  Copyright © 2018 mindvaleyTest. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: PostViewModel = PostViewModel()
    
    var alreadyLoaded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.createRefreshControl()
        
        self.viewModel.delegate = self
//        self.viewModel.getPosts()
        self.loadPosts()
    }
    
    @objc func loadPosts() {
        self.viewModel.getPosts()
    }
    
    private func createRefreshControl() {
        
        let refresh = UIRefreshControl()
        
        refresh.addTarget(self, action: #selector(self.loadPosts), for: .valueChanged)
        refresh.tintColor = UIColor.black
        
        self.tableView.refreshControl = refresh
        //        self.tableView.addSubview(self.refreshControl)
    }
    
    private func roll() {
        let cells = self.tableView.visibleCells
        
        let tableViewHeight = self.tableView.bounds.height
        
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
        }
        
        var delayCounter = 0
        
        for cell in cells {
            UIView.animate(withDuration: 1, delay: Double(delayCounter) * 0.035, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                cell.transform = CGAffineTransform.identity
            }, completion: nil)
            delayCounter += 1
        }
    }
}

//Mark : ViewController - UITableViewDelegate and UITableViewDatasource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if alreadyLoaded && self.viewModel.getCount() == 0 {
            return 1
        }
        return self.viewModel.getCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if alreadyLoaded && self.viewModel.getCount() == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "emptyListCell", for: indexPath)
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostTableViewCell
        
        if let post = self.viewModel.getPostFor(index: indexPath.row) {
            cell.post = post
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if alreadyLoaded && self.viewModel.getCount() > 0 {
        
            self.performSegue(withIdentifier: "detailSegue2", sender: self.viewModel.getPostFor(index: indexPath.row))
                tableView.deselectRow(at: indexPath, animated: true)
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if alreadyLoaded && self.viewModel.getCount() == 0 {
            return 140
        }
        return 255
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController,
            let post = sender as? Post {
            destination.post = post
        }
    }
}

//Mark : ViewController - PostViewModelDelegate
extension ViewController: PostViewModelDelegate {
    
    func didGetPosts() {
        DispatchQueue.main.async {
            self.alreadyLoaded = true
            self.tableView.refreshControl?.endRefreshing()
            self.tableView.reloadData()
            self.roll()
        }
    }
    
    func didFaildGettingPosts(error: Error) {
        DispatchQueue.main.async {
            self.tableView.refreshControl?.endRefreshing()
            self.alreadyLoaded = true
            self.tableView.reloadData()
        }
    }
}

