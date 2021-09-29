

import Foundation

struct Match: Codable {
    let count: Int
    let matches: [Matches]
}

struct Matches: Codable {
    let id: Int
    let utcDate: String
    var status: String?
    var matchday: Int?
    var lastUpdated: String?
    var homeTeam, awayTeam: PlayingTeams
    let score: Score
}

struct PlayingTeams: Codable {
    var name: String?
}

struct Score: Codable {
    let fullTime: FullTime
}

struct FullTime: Codable {
    var homeTeam: Int?
    var awayTeam: Int?
}

