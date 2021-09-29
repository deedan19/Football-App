

import UIKit

class LeagueCell: UITableViewCell {
    
    let leagueLabel = UILabel(text: "Premier League", font: .systemFont(ofSize: 16))
    
    let cellImage = UIImageView(cornerRadius: 0)
    
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        cellImage.image = UIImage(systemName: "chevron.right")
        cellImage.constrainWidth(constant: 20)
        cellImage.constrainHeight(constant: 20)
        cellImage.tintColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        
        let stackView = HorizontalStackView(arrangedSubviews: [leagueLabel, UIView(), cellImage], spacing: 5)
        addSubview(stackView)
        stackView.alignment = .center
        stackView.fillSuperview(padding: .init(top: 10, left: 15, bottom: 10, right: 15))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
