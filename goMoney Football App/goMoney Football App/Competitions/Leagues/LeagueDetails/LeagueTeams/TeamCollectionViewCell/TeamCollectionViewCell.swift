

import UIKit
import  SDWebImageSVGCoder

class TeamCollectionViewCell: UICollectionViewCell {
    
    private let teamLogoImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.constrainWidth(constant: 65)
        imageView.constrainHeight(constant: 65)
        return imageView
    }()
    
    let teamName = UILabel(text: "ClubBrugges footbal", font: .systemFont(ofSize: 12), numberOfLines: 2)

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.23
        self.layer.shadowRadius = 4
        self.layer.cornerRadius = 5
        teamName.textAlignment = .center
        teamName.adjustsFontSizeToFitWidth = true
        
        
        let stackView = VerticalStackView(arrangedSubviews: [teamLogoImageView, teamName], spacing: 8)
        stackView.alignment = .center
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 20, left: 15, bottom: 10, right: 15))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setup (with model: TeamPosition) {
        teamLogoImageView.sd_setImage(with: URL(string: model.team.crestUrl))
        teamName.text = model.team.name
    }
}
