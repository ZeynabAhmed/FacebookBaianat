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
    @IBOutlet weak var contentView: UIView!
    
    static let identifier = "FacebookViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "FacebookViewCell", bundle: nil)
    }
    
    func setPostData(pageContent: PostsContent){
        self.userImage.image = UIImage(named: pageContent.avatar)
        self.likesNumber.text = "\(pageContent.likesCount)"
        self.commentNumber.text = "\(pageContent.commentNumber)"
        self.sharesNumber.text = "\(pageContent.sharesNumber)"
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.layer.cornerRadius = 8.0
        self.contentView.clipsToBounds = true
        likesNumber.layer.cornerRadius = 8.0
        likesNumber.clipsToBounds = true
        commentNumber.layer.cornerRadius = 8.0
        commentNumber.clipsToBounds = true
        sharesNumber.layer.cornerRadius = 8.0
        sharesNumber.clipsToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
