//
//  SignUpModel.swift
//  Glee
//
//  Created by 최재혁 on 2024/02/01.
//

import Foundation

struct SignupResponse : Codable {
    let status: Int
    let success: Bool?
    let message : String
}
