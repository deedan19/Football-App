

import UIKit


class TeamPlayerCell: UITableViewCell {
    
    let playerNameLabel = UILabel(text: "Didier Drogba", font: .systemFont(ofSize: 16))
    
    let playerPosition = UILabel(text: "Striker", font: .systemFont(ofSize: 16))
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        playerPosition.textAlignment = .right
        
        let stackView = HorizontalStackView(arrangedSubviews: [playerNameLabel,playerPosition], spacing: 5)
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 10, left: 24, bottom: 10, right: 24))
    }
    
    func configureCell (with model: Squad) {
        playerNameLabel.text = model.name
        playerPosition.text = model.position
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
