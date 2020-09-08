//
//  FacebookViewCell.swift
//  BaianatFacebook
//
//  Created by Karim Elhedaby on 9/7/20.
//  Copyright © 2020 Karim Elhedaby. All rights reserved.
//

import UIKit

class FacebookViewCell: UITableViewCell {
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var likesNumber: UIButton!
    @IBOutlet weak var commentNumber: UIButton!
    @IBOutlet weak var sharesNumber: UIButton!
    @IBOutlet weak var contentOfView: UIView!
  //  @IBOutlet weak var textPost: UITextView!
    @IBOutlet weak var datePost: UILabel!
    @IBOutlet weak var userName: UILabel!
    
    static let identifier = "FacebookViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "FacebookViewCell", bundle: nil)
    }
    
    func setPostData(pageContent: PostsContent){
        self.userImage.image = UIImage(named: pageContent.avatar)
        self.likesNumber.setTitle("\(pageContent.likesCount)", for: .normal)
        self.commentNumber.setTitle("\(pageContent.commentsCount)", for: .normal)
        self.sharesNumber.setTitle("\(pageContent.sharesCount)", for: .normal)
        self.userName.text = "\(pageContent.fName) \(pageContent.lName)"
        self.datePost.text = "\(pageContent.createdAt)"
       // self.textPost.text = "\(pageContent.text)"
        print(" avatar \(pageContent.avatar)")
        print(" text \(pageContent.text)")
        print(" avatar \(pageContent.createdAt)")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentOfView.layer.cornerRadius = 10.0
        self.contentOfView.clipsToBounds = true
        likesNumber.layer.cornerRadius = 10.0
        likesNumber.clipsToBounds = true
        commentNumber.layer.cornerRadius = 10.0
        commentNumber.clipsToBounds = true
        sharesNumber.layer.cornerRadius = 10.0
        sharesNumber.clipsToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
