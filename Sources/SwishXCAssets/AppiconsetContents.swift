import Foundation
struct AppiconsetContents: Encodable {
  let images: [Image]
  let info: Info = Info()
  
  struct Info: Encodable {
    let author: String = "xcode"
    let version: Int = 1
  }
}
