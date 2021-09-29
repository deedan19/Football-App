



import UIKit
import SDWebImageSVGCoder


class TeamCell: UITableViewCell {
    
    let positionLabel = UILabel(text: "1", font: .systemFont(ofSize: 16))
    
    let teamImageView = UIImageView(cornerRadius: 0)
    
    let teamNameLabel = UILabel(text: "Chelsea", font: .systemFont(ofSize: 16))
    
    let gamesPlayedLabel = UILabel(text: "35", font: .systemFont(ofSize: 16))
    
    let goalDifferenceLabel = UILabel(text: "80", font: .systemFont(ofSize: 16))
    
    let totalMatchPointLabel = UILabel(text: "106", font: .systemFont(ofSize: 16))
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        positionLabel.textAlignment = .right
        
        teamImageView.constrainWidth(constant: 22)
        teamImageView.constrainHeight(constant: 22)
        teamImageView.contentMode = .scaleAspectFit

        let teamImageAndName = HorizontalStackView(arrangedSubviews: [teamImageView, teamNameLabel], spacing: 35)
        teamImageAndName.alignment = .center
        
        let teamSV = HorizontalStackView(arrangedSubviews: [positionLabel, teamImageAndName], spacing: 10)
        teamSV.alignment = .center
        let pointsSV = HorizontalStackView(arrangedSubviews: [gamesPlayedLabel, goalDifferenceLabel, totalMatchPointLabel], spacing: 10)
        let stackView = HorizontalStackView(arrangedSubviews: [teamSV, UIView(), pointsSV], spacing: 5)
        stackView.distribution = .fill
        
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 5, left: 10, bottom: 5, right: 10))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTeams (with model:TeamPosition) {
        positionLabel.text = "\(model.position)"
        teamImageView.sd_setImage(with: URL(string: model.team.crestUrl), placeholderImage: UIImage(named:"ball"))
        teamNameLabel.text = model.team.name
        gamesPlayedLabel.text = "\(model.playedGames)"
        goalDifferenceLabel.text = "\(model.goalDifference)"
        totalMatchPointLabel.text = "\(model.points)"
        
        
    }
}

