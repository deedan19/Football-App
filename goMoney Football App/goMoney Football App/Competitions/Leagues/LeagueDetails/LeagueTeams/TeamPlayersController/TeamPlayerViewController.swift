



import UIKit

class TeamPlayersViewController: UIViewController {
    let teamPlayerViewModel = TeamPlayerViewModel()
    
    fileprivate let playersCell = "playersCell"
    fileprivate  let clubLogoCell = "clubLogoCell"
    
    fileprivate let teamPlayersTableView: UITableView = {
        let table = UITableView()
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        teamPlayerViewModel.fetchTeamPlayers()
        teamPlayersTableView.delegate = self
        teamPlayersTableView.dataSource = self
        
        teamPlayersTableView.register(TeamPlayerCell.self, forCellReuseIdentifier: playersCell)
        teamPlayersTableView.register(TeamLogoHeaderCell.self, forHeaderFooterViewReuseIdentifier: clubLogoCell)
        setupPlayerTable()
        teamPlayerViewModel.closure = {[weak self] in
            DispatchQueue.main.async {
                self?.teamPlayersTableView.reloadData()
            }
        }
    }
    
    fileprivate func setupPlayerTable () {
        view.addSubview(teamPlayersTableView)
        teamPlayersTableView.fillSuperview()
    }
}

extension TeamPlayersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: clubLogoCell) as? TeamLogoHeaderCell else { return UITableViewCell()}
        header.clubLogoImage.sd_setImage(with: URL(string: self.teamPlayerViewModel.teamLogo?.crestUrl ?? ""))
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamPlayerViewModel.teamPlayers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: playersCell, for: indexPath) as? TeamPlayerCell else { return UITableViewCell() }
        cell.configureCell(with: teamPlayerViewModel.teamPlayers[indexPath.row])
        return cell
    }
    
    
}
