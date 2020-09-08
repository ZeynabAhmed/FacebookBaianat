//
//  ViewController.swift
//  BaianatFacebook
//
//  Created by Karim Elhedaby on 9/7/20.
//  Copyright © 2020 Karim Elhedaby. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var FacebookTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        FacebookTable.register(FacebookViewCell.nib(), forCellReuseIdentifier: FacebookViewCell.identifier)
        FacebookTable.tableFooterView = UIView()
    }


}

