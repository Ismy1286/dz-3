import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private lazy var deleteName: UITextField = {
        let view = UITextField()
        view.placeholder = "Delete Name: "
        view.layer.borderWidth = 1
        return view
    }()
    
    private lazy var deleteButton: CustonButton = {
        let view = CustonButton()
        view.setTitle("Delete", for: .normal)
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.dataSource = self
        view.delegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubView()
        setupViews()
    }
    
    private var names = ["Eldar", "Akylzat", "Meder", "Ruslan", "Azamat", "Beksultan", "Azis", "Doolot", "Adilet", "Bahtiyar"]
    
    private func setupSubView() {
        
        view.addSubview(deleteName)
        deleteName.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(28)
            make.left.equalToSuperview().offset(15)
            make.height.equalTo(40)
            make.width.equalToSuperview().multipliedBy(0.65)
        }
        
        view.addSubview(deleteButton)
        deleteButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-10)
            make.top.equalToSuperview().offset(32)
            make.left.equalTo(deleteName.snp.right).offset(10)
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(deleteName.snp.bottom).offset(10)
        }
    }
    
    private func setupViews() {
       
        deleteButton.setOnClickListener { view in
            
            for _ in self.names {
                for (i, str) in self.names.enumerated().reversed() {
                    if str == self.deleteName.text {
                        self.names.remove(at: i)
                    }
                }
            }
//            self.names.remove(at: 0)
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let index = indexPath.row
        let cell = NameCell()
        
        cell.titleName.text = names[index]
        cell.backgroundColor = UIColor(
            red: CGFloat(Double.random(in: 0...1)),
            green: CGFloat(Double.random(in: 0...1)),
            blue: CGFloat(Double.random(in: 0...1)),
            alpha: 1)
        return cell
    }
}
