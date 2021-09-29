
import UIKit
import  XLPagerTabStrip


class LeagueTableViewController: UIViewController, IndicatorInfoProvider {
    
    private let teamRankCell = "teamRankCell"
    private let leagueTableViewModel = ViewModelLeagueTable()
    
    fileprivate let leagueTable: UITableView = {
        let table = UITableView()
        return table
    }()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        leagueTableViewModel.model.fetchTeamRanks()
        
        leagueTable.dataSource = self
        leagueTable.delegate = self
        leagueTable.register(TeamCell.self, forCellReuseIdentifier: teamRankCell)
        setupTable()
        
        leagueTableViewModel.model.closure = { [weak self] in
            DispatchQueue.main.async {
                self?.leagueTable.reloadData()
            }
        }
    }
    
    private func setupTable () {
        view.addSubview(leagueTable)
        leagueTable.fillSuperview()
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Table")
    }
}


// MARK: - UITableViewDataSource, UITableViewDelegate
extension LeagueTableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagueTableViewModel.model.teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: teamRankCell, for: indexPath) as? TeamCell else { return  UITableViewCell()}
        cell.setupTeams(with: leagueTableViewModel.model.teams[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
