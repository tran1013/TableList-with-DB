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
    
    let db: Connection
    let path: String
    
    var contentForTable = [String]()

    //init database and create table if there isn't a table ownTable exist
    init() {
        path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
            ).first!
        print("Path: \(path)")
        db = try! Connection("\(path)/ownDB.db")
        do{
            try db.run(dbIntern.create { t in
                t.column(id, primaryKey: true)
                t.column(content, unique: true)
            })} catch {
                print(error)
        }
    }
    
    //get all content from table and store in a string array
    func getAll() -> [String]
    {
        do{
            for user in try db.prepare(dbIntern) {
                
                contentForTable.append(user[content]!)
            }
        } catch {
            print("ERROR \(error)")
        }
        
        return contentForTable
    }
    
    //insert content into table
    func insert(content_:String)
    {
        do {
            let rowid = try db.run(dbIntern.insert(content <- content_))
            print("inserted id: \(rowid)")
        } catch {
            print("insertion failed: \(error)")
        }
    }
    
    //delete content from table
    func delete(content_: String)
    {
        let toDelete = dbIntern.filter(content == content_)
        do {
            try db.run(toDelete.delete())
            print("deleted: \(content_)")
        } catch {
            print("deletion failed: \(error)")
        }
    }
}
