import Foundation


struct LoadWord : Codable {
    var isSuccess : Bool
    var code : Int
    var message : String
    var result : LoadWordResult?
}

struct LoadWordResult : Codable {
    var word : String
    var meaning : String
    var pos : String
    var trans_word : String
    var example : String
}
