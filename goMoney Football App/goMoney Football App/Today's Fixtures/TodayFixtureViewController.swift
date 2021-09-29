

import UIKit

class TodayFixtureViewController: UIViewController {
    
    private let fixtureCell = "fixtureCell"
    private let todayFixtureViewModel = TodayFixtureViewModel()
    
    private let todaysFixturesTableView: UITableView = {
        let tableView = UITableView ()
        return tableView
    }()    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todayFixtureViewModel.fetchFixtures()
        todaysFixturesTableView.delegate = self
        todaysFixturesTableView.dataSource = self
        
        view.backgroundColor = .brown
        setupFixturesTable()
        todaysFixturesTableView.register(MatchDetailsCell.self, forCellReuseIdentifier: fixtureCell)
        todayFixtureViewModel.closure = {[weak self] in
            DispatchQueue.main.async {
                self?.todaysFixturesTableView.reloadData()
            }
        }
    }
    
    
    
    fileprivate func setupFixturesTable () {
        view.addSubview(todaysFixturesTableView)
        todaysFixturesTableView.fillSuperview()
        todaysFixturesTableView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension TodayFixtureViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todayFixtureViewModel.match.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: fixtureCell, for: indexPath) as? MatchDetailsCell else {return UITableViewCell()}
        cell.configureTodayFiixtureCell(with: todayFixtureViewModel.match[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}
