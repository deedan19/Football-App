

import UIKit

class MatchDetailsCell: UITableViewCell {
    
    let timedLabel = UILabel(text: "TIMED", font: .systemFont(ofSize: 12))
    
    let matchTimeLabel = UILabel(text: "13:00", font: .systemFont(ofSize: 16))
    
    let matchDayLabel = UILabel(text: "MD:  ", font: .systemFont(ofSize: 10))
    
    let homeTeamLabel = UILabel(text: "Chelsea trashed Man UTD", font: .systemFont(ofSize: 14))
    let homeScoreLabel = UILabel(text: "?", font: .systemFont(ofSize: 16))
    
    let awayTeamLabel = UILabel(text: "Man UTD lost to Chelsea", font: .systemFont(ofSize: 14))
    let awayScoreLabel = UILabel(text: "?", font: .systemFont(ofSize: 16))
    
    let statusLabel = UILabel(text: "90'", font: .systemFont(ofSize: 10))
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        homeScoreLabel.textAlignment = .right
        awayScoreLabel.textAlignment = .right
        matchDayLabel.layer.opacity = 0.5
        
        let timeStack = VerticalStackView(arrangedSubviews: [timedLabel, matchTimeLabel, matchDayLabel], spacing: 5)
        timeStack.distribution = .fillEqually
        timeStack.alignment = .leading
        let teamStack = VerticalStackView(arrangedSubviews: [UIView(), homeTeamLabel, awayTeamLabel, UIView()], spacing: 10)
        teamStack.distribution = .fillEqually
        let scoreStack = VerticalStackView(arrangedSubviews: [UIView(), homeScoreLabel, awayScoreLabel, UIView()], spacing: 10)
        let matchStack = HorizontalStackView(arrangedSubviews: [timeStack, teamStack,UIView(), statusLabel, scoreStack], spacing: 15)
        matchStack.alignment = .center
        
        addSubview(matchStack)
        matchStack.fillSuperview(padding: .init(top: 5, left: 10, bottom: 5, right: 10))
    }
    
    
    func dateTimeChangeFormat(str stringWithDate: String, inDateFormat: String, outDateFormat: String) -> String {
        let inFormatter = DateFormatter()
        inFormatter.locale = Locale(identifier: "en_US_POSIX")
        inFormatter.dateFormat = inDateFormat

        let outFormatter = DateFormatter()
        outFormatter.locale = Locale(identifier: "en_US_POSIX")
        outFormatter.dateFormat = outDateFormat

        let inStr = stringWithDate
        let date = inFormatter.date(from: inStr)!
        return outFormatter.string(from: date)
    }
    
    func configureTodayFiixtureCell (with model: Matches)  {
        if let homeScore = model.score.fullTime.homeTeam, let awayScore = model.score.fullTime.awayTeam {
            matchDayLabel.text = "MD: \((model.matchday) ?? 0)"
            homeScoreLabel.text = "\(homeScore)"
            awayScoreLabel.text = "\(awayScore)"
        }
        homeTeamLabel.text = model.homeTeam.name
        awayTeamLabel.text = model.awayTeam.name
        statusLabel.text = model.status
        
        let timeForMatch = dateTimeChangeFormat(str: model.utcDate, inDateFormat: "yyyy-MM-dd'T'HH:mm:ssZZZZZ", outDateFormat: "HH:mm")
        matchTimeLabel.text = timeForMatch
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
