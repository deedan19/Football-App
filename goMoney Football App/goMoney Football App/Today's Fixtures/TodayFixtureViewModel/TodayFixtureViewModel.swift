


import Foundation


class TodayFixtureViewModel {
    private let service = Service()
    var match = [Matches]()
    var closure: (()->())?
    
        let urlString = "https://api.football-data.org/v2/matches"
        let token = "8d348944cece4d89bd53923896167f29"
        let header = "X-Auth-Token"
        
        func fetchFixtures () {
            service.fetchMatches(head: .header, token: token, header: header, urlString: urlString) { match, error in
                if let err = error {
                    print("Fetch Match Error:: \(err)")
                } else {
                    self.match = match?.matches ?? []
                    self.closure?()
                }
            }
            
        }
    
}
