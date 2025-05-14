import Foundation
import SwiftData




@Model
class SavedMemo: Identifiable {
    var id: UUID
    var question: String
    var answer: String
    var emoji: String
    var respondent: String
    

    init(question: String, answer: String, emoji: String, respondent: String, date: Date = Date()) {
        self.id = UUID()
        self.question = question
        self.answer = answer
        self.emoji = emoji
        self.respondent = respondent
        
    }
}
