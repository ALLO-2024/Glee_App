//
//  SignUpModel.swift
//  Glee
//
//  Created by 최재혁 on 2024/02/01.
//

import Foundation

struct SignupResponse : Codable {
    var isSuccess : Bool
    var code : Int
    var message : String
    var result : SignUpResult?
}

struct SignUpResult: Codable {
    
}

struct SocialSignUpRequest : Codable {
    var nickname : String
    var isOptionAgr : Bool
    var language : String
}

struct UserSignUpRequest : Codable {
    var email : String
    var password : String
    var nickname : String
    var isOptionAgr : Bool
    var language : String
    
    init() {
        email = ""
        password = ""
        nickname = ""
        isOptionAgr = true
        language = ""
    }
}
