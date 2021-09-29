

import Foundation

class ViewModelLeagueTeams {
    private let service = Service()
    var teams = [TeamPosition]()
    var closure: (()->())?
    
    private let urlString = "https://api.football-data.org/v2/competitions/2021/standings"
    private  let token = "8d348944cece4d89bd53923896167f29"
    private let header = "X-Auth-Token"
    
    func fetchTeamRanks () {
        service.fetchTeamRank(head: .header, token: token, header: header, urlString: urlString) { teamRank, error in
            if let err = error {
                print("Error fetching TeamRanks:: \(err)")
            } else {
                self.teams = teamRank?.standings[0].table ?? []
                self.closure?()
            }
        }
    }
}
