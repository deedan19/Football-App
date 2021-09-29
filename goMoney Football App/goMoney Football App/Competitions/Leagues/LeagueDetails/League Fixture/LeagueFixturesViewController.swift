

import UIKit

import  XLPagerTabStrip


class LeagueFixturesViewController: UIViewController, IndicatorInfoProvider {
    
    private let fixturesIcon: UIImageView = {
       let imageView = UIImageView(image: UIImage(named: "ball"))
        imageView.constrainWidth(constant: 80)
        imageView.constrainHeight(constant: 80)
        imageView.tintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return imageView
    }()
    
    private let fixturesLabel: UILabel = {
        let fixtureLabel = UILabel(text: "No Fixtures", font: .systemFont(ofSize: 16))
        return fixtureLabel
    }()
    
    private let retryButton: UIButton = {
       let btn = UIButton()
        btn.setTitle("Retry", for: .normal)
        btn.setTitleColor(.gray, for: .normal)
        btn.constrainWidth(constant: 120)
        btn.constrainHeight(constant: 50)
        btn.backgroundColor = #colorLiteral(red: 0.9533305313, green: 0.9533305313, blue: 0.9533305313, alpha: 1)
        return btn
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews () {
        let stackView = VerticalStackView(arrangedSubviews: [fixturesIcon, fixturesLabel, retryButton], spacing: 10)
        stackView.alignment = .center
        view.addSubview(stackView)
        stackView.centerInSuperview()
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Fixtures")
    }
}
