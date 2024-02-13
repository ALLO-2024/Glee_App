//
//  LoginModel.swift
//  Glee
//
//  Created by 최재혁 on 2024/02/14.
//

import Foundation

struct LoginResponse {
    var isSuccess : Bool
    var code : Int
    var message : String
    var result : LoginResult?
}

struct LoginResult {
    var accessToken : String
    var refreshToken : String
}
