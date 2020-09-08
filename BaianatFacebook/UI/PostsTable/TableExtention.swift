//
//  TableExtention.swift
//  BaianatFacebook
//
//  Created by Karim Elhedaby on 9/7/20.
//  Copyright © 2020 Karim Elhedaby. All rights reserved.
//

import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = FacebookTable.dequeueReusableCell(withIdentifier: FacebookViewCell.identifier, for: indexPath) as! FacebookViewCell
        cell.setPostData(pageContent: postsContent[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == postsContent.count - 6{
            if pageInfo.page < pageInfo.totalPages{
                let oldPostContent = PostsContent
                let oldPageNumber = pageInfo.page
                presenter?.getPosts()
                let newPostContent = PostsContent
                pageInfo.page += oldPageNumber
                PostsContent.removeAll()
                PostsContent.append(contentsOf: oldPostContent)
                PostsContent.append(contentsOf: newPostContent)
                self.perform(#selector(refreshTableData), with: nil, afterDelay: 1.0)
            }
        }
    }
    
    @objc
    func refreshTableData(){
        self.FacebookTable.reloadData()
    }
    
}
