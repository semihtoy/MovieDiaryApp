import ObjectMapper
class Ratings : Mappable {
    var source : String?
    var value : String?
    required init?(map: Map) {}
    func mapping(map: Map) {
        source <- map["source"]
        value <- map["value"]
    }
}
