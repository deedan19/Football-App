

import Foundation

class TeamPlayerViewModel {
    private let service = Service()
    
    var teamPlayers = [Squad]()
    var closure: (()->())?
    var teamId = 0
    var teamLogo: Team?
    
    func fetchTeamPlayers () {
        let urlString = "https://api.football-data.org/v2/teams/\(teamId)"
        let token = "8d348944cece4d89bd53923896167f29"
        let header = "X-Auth-Token"
        service.fetchTeamPlayers(head: .header, token: token, header: header, urlString: urlString) { teamPlayer, error in
            if let err = error {
                print("Error:::: \(err)")
            } else {
                self.teamPlayers = teamPlayer?.squad ?? []
                self.closure?()
            }
            
        }
    }
    
    
}
