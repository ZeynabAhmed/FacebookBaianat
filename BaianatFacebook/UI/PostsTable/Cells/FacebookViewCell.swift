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
    @IBOutlet weak var imageHight: NSLayoutConstraint!
    @IBOutlet weak var commentNumber: UIButton!
    @IBOutlet weak var sharesNumber: UIButton!
    @IBOutlet weak var contentOfView: UIView!
  //  @IBOutlet weak var textPost: UITextView!
    @IBOutlet weak var datePost: UILabel!
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var imageContent: UIImageView!
    
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
               
        let date = Double(pageContent.createdAt) ?? 0
               
        self.datePost.text = "\(getDateFromTimeStamp(timeStamp : date))"
        if (verifyUrl (urlString: pageContent.text)){
            imageView?.isHidden = false
            
//            let transformer = SDImageResizingTransformer(size: CGSize(width: 250, height: 120), scaleMode: .fill)
            
            imageHight.constant = 120
            
            imageContent?.sd_setImage(with: URL(string: pageContent.text), placeholderImage: nil)
        }else{
            imageHight.constant = 0
//            imageView?.heightAnchor.constraint(equalToConstant: CGFloat(0)).isActive = true
            self.textPost.text = "\(pageContent.text) "
        }

    }

    func verifyUrl (urlString: String?) -> Bool {
        if let urlString = urlString {
            if let url = NSURL(string: urlString) {
                return UIApplication.shared.canOpenURL(url as URL)
            }
        }
        return false
    }
    
    func getDateFromTimeStamp(timeStamp : Double) -> String {

        let date = NSDate(timeIntervalSince1970: timeStamp)
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "dd MMM YY, hh:mm a"
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
        self.imageView?.isHidden = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension UIImage{

func resizeImageWith(newSize: CGSize) -> UIImage {

    let horizontalRatio = newSize.width / size.width
    let verticalRatio = newSize.height / size.height

    let ratio = max(horizontalRatio, verticalRatio)
    let newSize = CGSize(width: size.width * ratio, height: size.height * ratio)
    UIGraphicsBeginImageContextWithOptions(newSize, true, 0)
    draw(in: CGRect(origin: CGPoint(x: 0, y: 0), size: newSize))
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return newImage!
   }
}

extension Date {
    var hour: Int { return Calendar.autoupdatingCurrent.component(.hour, from: self) }
}

