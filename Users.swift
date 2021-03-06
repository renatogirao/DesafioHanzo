//
//  Users.swift
//  Teste Hanzo
//
//  Created by Renato Savoia Girão on 27/08/2018.
//  Copyright © 2018 Renato Savoia Girão. All rights reserved.
//

import Foundation
import Foundation

struct Users: Codable, Hashable, Equatable {
    var hashValue: Int { get { return id!.hashValue } }
    let id : String?
    let name : String?
    let image : String?
    let birthday : String?
    let bio : String?
    
    func ==(left:Users, right:Users) -> Bool {
        return left.id == right.id
    }
    
}
