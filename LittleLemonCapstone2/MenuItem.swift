import Foundation

/*struct JSONMenu: Codable {
    let menu: [MenuItem]
    
    enum CodingKeys: String, CodingKey {
        case menu = "menu"
    }
*/

struct MenuItem: Codable, Hashable, Identifiable {
    let title: String
    let price: String
    let image: String
    let id = UUID()
    let desc : String
    let category : String
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case price = "price"
        case image = "image"
        case desc = "description"
        case category = "category"
        
    }
    
}
