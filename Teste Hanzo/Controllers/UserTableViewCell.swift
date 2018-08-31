//
//  UserTableViewCell.swift
//  Teste Hanzo
//
//  Created by Renato Savoia Girão on 27/08/2018.
//  Copyright © 2018 Renato Savoia Girão. All rights reserved.
//

import UIKit
import Kingfisher

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageUser: UIImageView!
    @IBOutlet weak var nameUser: UILabel!
    @IBOutlet weak var detailUser: UILabel!
    var idUser : String = ""
    
    @IBOutlet weak var insideView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        configDesignCell()
    }

    func configDesignCell() {
        insideView.dropShadow(color: .lightText, opacity: 1, offSet: CGSize(width: 0, height: 0), radius: 8, scale: true )
        insideView.layer.cornerRadius = 14
    }
    
    func prepare(with user: Users) {
        imageUser.layer.cornerRadius = 14
        let imageURL = URL(string: user.image!)
        imageUser.kf.setImage(with: imageURL)
        nameUser.text = user.name
        detailUser.text = user.bio ?? "Não há biografia cadastrada para esse usuário."
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension UIView {
    
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
