



import UIKit

class DifferentLeaguesViewController: UIViewController {
    
    private let leagueCell = "leagueCell"
    private let diffLeagueViewModel = DiffLeaguesViewModel()
    
    private let leagueTableView: UITableView = {
        let table = UITableView()
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        diffLeagueViewModel.fetchDifferentLeague()
        leagueTableView.delegate = self
        leagueTableView.dataSource = self
        leagueTableView.register(LeagueCell.self, forCellReuseIdentifier: leagueCell)
        view.addSubview(leagueTableView)
        leagueTableView.fillSuperview()
        diffLeagueViewModel.closure = {[weak self] in
            DispatchQueue.main.async {
                self?.leagueTableView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
    }
}


extension DifferentLeaguesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diffLeagueViewModel.competition.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: leagueCell, for: indexPath) as? LeagueCell else { return UITableViewCell()}
        cell.leagueLabel.text = diffLeagueViewModel.competition[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LeagueDetailsParentViewController") as? LeagueDetailsParentViewController else { return }
                navigationController?.pushViewController(controller, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    
}
