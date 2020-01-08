import ObjectMapper
import RealmSwift


class Search: Object, Mappable  {
    required init?(map: Map) {
       
    }
    
    required init() {
        
    }
    
    override class func primaryKey() -> String? {
        return "imdbID"
    }
    
@objc dynamic var title : String?
@objc dynamic var year : String?
@objc dynamic var imdbID : String?
@objc dynamic  var type : String?
@objc dynamic var poster : String?
    
  
    func mapping(map: Map) {
        title <- map["Title"]
        year <- map["Year"]
        imdbID <- map["imdbID"]
         type <- map["Type"]
         poster <- map["Poster"]
    }
}
