//
//  UsersDetailsViewController.swift
//  Teste Hanzo
//
//  Created by Renato Savoia Girão on 27/08/2018.
//  Copyright © 2018 Renato Savoia Girão. All rights reserved.
//

import UIKit
import Kingfisher

class UsersDetailsViewController: UIViewController {

    var user: Users!
    
    @IBOutlet weak var behindView: UIView!
    @IBOutlet weak var lbBio: UILabel!
    @IBOutlet weak var lbAge: UILabel!
    @IBOutlet weak var imageUser: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
    
        configScreen()
        configNumberFormatter()
    }
    
    // Function to configure the design screen
    func configScreen() {
        
        behindView.layer.cornerRadius = 14
        let imageURL = URL(string: user.image!)
        imageUser.kf.setImage(with: imageURL)
        imageUser.layer.cornerRadius = 18
        imageUser.layer.borderWidth = 1
        title = user.name
        lbBio.text = ("Biografia: \(String(describing: user.bio ?? "Não há biografia cadastrada para esse usuário" ))")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNumberFormatter()
    }
    
// function to convert the ISO8601 birthday format to normal date
    func configNumberFormatter() {
        var userBirthday = user.birthday
        let newArrayString = userBirthday?.components(separatedBy: "T")
        let myString = newArrayString![0]
        let arrayTimeString = myString.components(separatedBy: "-")
        let year = arrayTimeString[0]
        let month = arrayTimeString[1]
        let day = arrayTimeString[2]
        let birthdayFormatted = "\(day)/\(month)/\(year)"
        lbAge.text = ("Aniversário: \(String(describing: birthdayFormatted ?? "Não há aniversário cadastrado para esse usuário"))")
    }
}
