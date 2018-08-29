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
    }
    
    func configScreen() {
        
        behindView.layer.cornerRadius = 14
        let imageURL = URL(string: user.image!)
        imageUser.kf.setImage(with: imageURL)
        imageUser.layer.cornerRadius = 18
        imageUser.layer.borderWidth = 1
        
        title = user.name
        lbBio.text = ("Biografia: \(String(describing: user.bio ?? "Não há biografia cadastrada para esse usuário" ))")
        lbAge.text = ("Aniversário: \(String(describing: user.birthday ?? "Não há aniversário cadastrado para esse usuário"))")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configNumberFormatter()
        
    }

    func configNumberFormatter() {
        let birthday = user.birthday
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let birth = dateFormatter.date(from: birthday!)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
