


import Foundation

class DiffLeaguesViewModel {
    
    private let service = Service()
    var competition = [Competition]()
    var closure: (() -> ())?
        
        let urlString = "https://api.football-data.org/v2/competitions"
        let token = " caf8859feafc4069a9b605230ac60504"
       let header = "X-Auth-Token"
    func fetchDifferentLeague () {
        service.fetchLeagueCompetitions(head: .header, token: token, header: header, urlString: urlString) { leagueData, error in
            if let err = error {
                print("Error::::: \(err)")
            } else {
                self.competition = leagueData?.competitions ?? []
                self.closure?()
            }
        }
    }
  
}
