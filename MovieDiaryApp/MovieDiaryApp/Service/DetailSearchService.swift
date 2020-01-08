import ObjectMapper
import Alamofire
import Foundation
import UIKit
class DetailService {
    let http = HTTP();
    func getDetail(param: Parameters?,result: @escaping (FilmDetail) -> Void ) -> Void {
        http.get(url:ServiceBase.getURLBase(),param: param ){ (data) in
            let _data = Mapper<FilmDetail>().map(JSONString:  String(decoding: data, as: UTF8.self))
            print(_data?.title)
            result(_data!)
        };
    }
}
