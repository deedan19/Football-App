

import UIKit

class TeamLogoHeaderCell: UITableViewHeaderFooterView {
    
    private let headerBackgroundView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let clubLogoImage: UIImageView = {
        let imageV = UIImageView()
        imageV.image = UIImage(named: "ball")
        imageV.constrainWidth(constant: 70)
        imageV.constrainHeight(constant: 70)
        return imageV
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        headerBackgroundView.addSubview(clubLogoImage)
        clubLogoImage.centerInSuperview()
        addSubview(headerBackgroundView)
        headerBackgroundView.fillSuperview()
    }
    
    func configureHeader (with model: Team) {
        clubLogoImage.sd_setImage(with: URL(string: model.crestUrl ))
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
