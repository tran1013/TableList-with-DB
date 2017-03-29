//
//  Database.swift
//  Playtime
//
//  Created by Anh Duc Tran on 29.03.17.
//  Copyright © 2017 Anh Duc Tran. All rights reserved.
//

import Foundation
import SQLite

class database{
    
    let dbIntern = Table("ownTable")
    let id = Expression<Int64>("id")
    let content = Expression<String?>("content")
    
    let db = try! Connection("/Users/duc/Application Develop/Playtime/Playtime/ownDB.db")
    
    var contentForTable = [String]()
    
    //    func dbConn(){
    //        do{
    //            db = try Connection("/Users/duc/Application Develop/Playtime/Playtime/ownContent.db")
    //            print("===========DB CONNECTION SUCCESSFUL===========")
    //        }
    //        catch
    //        {
    //            print("===========DATABASE NOT FOUND===========")
    //        }
    //    }
    
    func getAll() -> [String]
    {
        do{
            for user in try db.prepare(dbIntern) {
                
                //print("id: \(user[id]), content: \(user[content])")
                contentForTable.append(user[content]!)
                // id: 1, name: Optional("Alice")
            }
        print(contentForTable)} catch {
                print("ERROR + \(error)")
        }
        
        return contentForTable
    }
    
    func insert(content_:String)
    {
        do {
            let rowid = try db.run(dbIntern.insert(content <- content_))
            print("inserted id: \(rowid)")
        } catch {
            print("insertion failed: \(error)")
        }
    }
    
    func delete(content_: String)
    {
        let toDelete = dbIntern.filter(content == content_)
        do {
            let rowid = try db.run(dbIntern.delete())
            print("deleted: \(rowid)")
        } catch {
            print("deletion failed: \(error)")
        }
    }
}
