import Foundation
import UIKit
import SnapKit

class NameCell: UITableViewCell {
    
    lazy var titleName: UILabel = {
        let view = UILabel()
        return view
    }()
    
    override func layoutSubviews() {
        
        addSubview(titleName)
        titleName.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
