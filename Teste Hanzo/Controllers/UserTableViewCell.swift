//
//  UserTableViewCell.swift
//  Teste Hanzo
//
//  Created by Renato Savoia Girão on 27/08/2018.
//  Copyright © 2018 Renato Savoia Girão. All rights reserved.
//

import UIKit
import Kingfisher
import NVActivityIndicatorView

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageUser: UIImageView!
    @IBOutlet weak var nameUser: UILabel!
    @IBOutlet weak var detailUser: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        
    }

    func prepare(with user: Users) {
        
        
        
        imageUser.layer.borderWidth = 1
        imageUser.layer.cornerRadius = 30
        let imageURL = URL(string: user.image!)
        imageUser.kf.setImage(with: imageURL)
        nameUser.text = user.name
        detailUser.text = user.bio
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
