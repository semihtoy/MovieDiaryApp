//
//  RealmHelper.swift
//  MovieDiaryApp
//
//  Created by Xcode on 8.01.2020.
//  Copyright © 2020 Xcode. All rights reserved.
//

import Foundation
import RealmSwift


class RealmHelper {
    private var   database:Realm
    static let   sharedInstance = RealmHelper()
    private init() {
       database = try! Realm()
    }
  
    func getDataFromDB(filter:String) ->   Results<Search> {
        let results: Results<Search> =   database.objects(Search.self).filter(filter);
     return results
    }
    
    
     func addData(object: Search)   {
          try! database.write {
            database.add(object)
           
          }
     }
   func getDataFromDB() ->   Results<Search> {
      let object = database.objects(Search.self)
    
    return object;
    }
    
    
      func deleteAllFromDatabase()  {
           try!   database.write {
               database.deleteAll()
           }
      }
      func deleteFromDb(object: Search)   {
          try!   database.write {
             database.delete(object)
          }
      }
}

    
