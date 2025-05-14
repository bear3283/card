//
//  DataManager.swift
//  SharingCard
//
//  Created by bear on 4/18/25.
//
//    var question: String
//var answer: String
//var emoji: String
//var respondent: String


import Foundation
import SwiftData

struct DataManager {
    static func saveRecord(question: String, answer:String, emoji:String, respondent:String, in context: ModelContext){
        let newRecord = SavedMemo(question: question, answer: answer, emoji: emoji, respondent: respondent)
        context.insert(newRecord)
        try? context.save()
        
    }
    
    static func deleteRecord(_ memo: SavedMemo, in context: ModelContext) {
        context.delete(memo)
        try? context.save()
        
    }
//    static func updateRecord(question: String, answer:String, emoji:String, respondent:String, in context: ModelContext){
//        let newRecord = SavedMemo(question: question, answer: answer, emoji: emoji, respondent: respondent)
//        question: question, answer: answer, emoji: emoji, respondent: respondent = new text
//        try? context.save()
//    }
}
