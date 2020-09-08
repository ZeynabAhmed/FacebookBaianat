//
//  FacebookViewCell.swift
//  BaianatFacebook
//
//  Created by Karim Elhedaby on 9/7/20.
//  Copyright © 2020 Karim Elhedaby. All rights reserved.
//

import UIKit
import SDWebImage

class FacebookViewCell: UITableViewCell {
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var likesNumber: UIButton!
    @IBOutlet weak var commentNumber: UIButton!
    @IBOutlet weak var sharesNumber: UIButton!
    @IBOutlet weak var contentOfView: UIView!
  //  @IBOutlet weak var textPost: UITextView!
    @IBOutlet weak var datePost: UILabel!
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var textPost: UILabel!
    static let identifier = "FacebookViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "FacebookViewCell", bundle: nil)
    }
    
    func setPostData(pageContent: PostsContent){
        self.userImage.sd_setImage(with: URL(string: pageContent.avatar), placeholderImage: UIImage(named: "user.png"))
        self.likesNumber.setTitle("\(pageContent.likesCount)", for: .normal)
        self.commentNumber.setTitle("\(pageContent.commentsCount)", for: .normal)
        self.sharesNumber.setTitle("\(pageContent.sharesCount)", for: .normal)
        self.userName.text = "\(pageContent.fName) \(pageContent.lName)"
        self.textPost.text = " "
        let myDouble = Double(pageContent.createdAt) ?? 0
        
        self.datePost.text = "\(getDateFromTimeStamp(timeStamp : myDouble))"
//        print(" timeStamp \(getDateFromTimeStamp(timeStamp : myDouble))")
//        print(" avatar \(pageContent.avatar)")
//        print(" text \(pageContent.text)")
//        print(" avatar \(pageContent.createdAt)")
    }

    func getDateFromTimeStamp(timeStamp : Double) -> String {

        let date = NSDate(timeIntervalSince1970: timeStamp)

        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "dd MMM YY, hh:mm a"
     // UnComment below to get only time
    //  dayTimePeriodFormatter.dateFormat = "hh:mm a"

        let dateString = dayTimePeriodFormatter.string(from: date as Date)
        return dateString
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.userImage.layer.cornerRadius = 40.0
        self.userImage.clipsToBounds = true
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

extension Date {
    var hour: Int { return Calendar.autoupdatingCurrent.component(.hour, from: self) }
}
