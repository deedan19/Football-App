

import UIKit
import  XLPagerTabStrip

class LeagueTeamsViewController: UIViewController, IndicatorInfoProvider {
    
    fileprivate let teamCell = "teamCell"
    
   private let leagueTeamsViewModel = ViewModelLeagueTeams()
    
    fileprivate let teamCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        collectionView.backgroundColor = #colorLiteral(red: 0.9498251713, green: 0.9498251713, blue: 0.9498251713, alpha: 1)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        leagueTeamsViewModel.fetchTeamRanks()
        teamCollectionView.delegate = self
        teamCollectionView.dataSource = self
        
        teamCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        teamCollectionView.register(TeamCollectionViewCell.self, forCellWithReuseIdentifier: teamCell)
        setupCollectionView()
        leagueTeamsViewModel.closure = { [weak self] in
            DispatchQueue.main.async {
                self?.teamCollectionView.reloadData()
            }
        }
    }
    
    
    private func setupCollectionView () {
        view.addSubview(teamCollectionView)
        teamCollectionView.fillSuperview()
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Teams")
    }
}

extension LeagueTeamsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return leagueTeamsViewModel.teams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: teamCell, for: indexPath) as? TeamCollectionViewCell else { return UICollectionViewCell()}
        cell.setup(with: leagueTeamsViewModel.teams[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let multiplier: CGFloat = 0.3
        return .init(width:( collectionView.frame.size.width * multiplier) - 5, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let passData = leagueTeamsViewModel.teams[indexPath.item]
        let controller = TeamPlayersViewController()
        controller.teamPlayerViewModel.teamId = passData.team.id
        controller.title = passData.team.name
        controller.teamPlayerViewModel.teamLogo = passData.team
        controller.modalPresentationStyle = .fullScreen
        present(UINavigationController(rootViewController: controller), animated: true)
    }
}


