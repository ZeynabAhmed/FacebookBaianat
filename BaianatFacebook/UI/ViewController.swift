//
//  ViewController.swift
//  BaianatFacebook
//
//  Created by Karim Elhedaby on 9/7/20.
//  Copyright © 2020 Karim Elhedaby. All rights reserved.
//

import UIKit

class ViewController: UIViewController, PostsViewProtocol {

    @IBOutlet weak var FacebookTable: UITableView!
    
    var presenter: PostsPresenterProtocol?
    
    var pageInfo: PageInfoModel = PageInfoModel(page: 1, totalPages: 1, limit: 1)
    var postsContent: [PostsContent] = [PostsContent]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FacebookTable.register(FacebookViewCell.nib(), forCellReuseIdentifier: FacebookViewCell.identifier)
        FacebookTable.tableFooterView = UIView()
        
        presenter = PostsPresenterProtocol()
        presenter?.attachView(viewProtocol: self)
        presenter?.getPosts()
        
        FacebookTable.reloadData()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.attachView(viewProtocol: self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter?.detachView()
    }

}

extension ViewController {
    func didLoadPosts(posts: [PostsContent], pageInfo: PageInfoModel){
        self.pageInfo = pageInfo
        self.postsContent = posts
        FacebookTable.reloadData()
    }
    func displayError(message: String){
        print(" Error \(message)")
    }
}

