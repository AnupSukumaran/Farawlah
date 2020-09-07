//
//  UserModel.swift
//  Farawlah
//
//  Created by Sukumar Anup Sukumaran on 07/09/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import UIKit
import Foundation

struct UserModel: Decodable {
    var userId: Int?
    var roleName: String?
    var roleId: Int?
    var emailAddress: String?
    
    enum CodingKeys: String, CodingKey {

        case userid = "userid"
        case rolename = "role_name"
        case roleid = "roleid"
        case emailAddress = "email_address"
    }
    
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        userId = try? values.decodeIfPresent(Int.self, forKey: .userid) ?? nil
        roleName = try? values.decodeIfPresent(String.self, forKey: .rolename) ?? nil
        roleId = try? values.decodeIfPresent(Int.self, forKey: .roleid) ?? nil
        emailAddress = try? values.decodeIfPresent(String.self, forKey: .emailAddress) ?? nil
    }
    
    
}

class ModelResponse: NSObject, Decodable {
    
    var userData: UserModel?
    
    init(data: Data) throws {
        super.init()
        userData = try? JSONDecoder().decode(UserModel.self, from: data)
    }
}


