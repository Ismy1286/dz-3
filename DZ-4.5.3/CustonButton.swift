import Foundation
import UIKit

class CustonButton: UIButton {
    
    private var onClick: (CustonButton) -> Void = { _ in }
    
    func setOnClickListener(onClick: @escaping (CustonButton) -> Void) {
        self.onClick = onClick
        
        addTarget(nil, action: #selector(clickButton(view:)), for: .touchUpInside)
    }
    
    @objc func clickButton(view: UIButton) {
        onClick(self)
    }
}
