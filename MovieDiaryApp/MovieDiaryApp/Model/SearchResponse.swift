import ObjectMapper
class SearchResponse: Mappable {
    var search : [Search]?
    var totalResults : String?
    var response : String?
    required init?(map: Map){}
     func mapping(map: Map) {
         search <- map["Search"]
         totalResults <- map["TotalResults"]
         response <- map["Response"]
     }
}
