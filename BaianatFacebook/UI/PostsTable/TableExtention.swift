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
        print("number Of Rows \(postsContent.count)")
        return postsContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = FacebookTable.dequeueReusableCell(withIdentifier: FacebookViewCell.identifier, for: indexPath) as! FacebookViewCell
        cell.setPostData(pageContent: postsContent[indexPath.row])
        print("cell For Row")
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == postsContent.count - 6{
            if pageInfo.page < pageInfo.totalPages{
                let oldPostContent = postsContent
                let oldPageNumber = pageInfo.page
                presenter?.getPosts()
                let newPostContent = postsContent.self
                pageInfo.page += oldPageNumber
                postsContent.removeAll()
                postsContent.append(contentsOf: oldPostContent)
                postsContent.append(contentsOf: newPostContent)
                self.perform(#selector(refreshTableData), with: nil, afterDelay: 1.0)
            }
        }
    }
    
    @objc
    func refreshTableData(){
        self.FacebookTable.reloadData()
    }
    
}
