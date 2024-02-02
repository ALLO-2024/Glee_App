//
//  SignUpModel.swift
//  Glee
//
//  Created by 최재혁 on 2024/02/01.
//

import Foundation

struct SignupResponse : Codable {
    let isSucces : Bool
    let code : Int
    let message : String
    let result : SignUpResult
}

struct SignUpResult: Codable {
    
}

struct UserSignUpRequest {
    let email : String
    let password : String
    let nickname : String
    let isOptionAgr : Bool
    let language : String
}
