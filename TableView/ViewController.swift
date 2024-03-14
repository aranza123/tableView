//
//  ViewController.swift
//  TableView
//
//  Created by Aranza Manriquez Alonso on 10/04/23.
//

import UIKit

class ViewController: UIViewController {
  

    @IBOutlet weak var tableView: UITableView!
    
    private let countries = ["Argentina","México","España","Perú","EEUU","Colombia"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "MyCustomTableViewCell", bundle: nil), forCellReuseIdentifier: "myCustomCell")
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Celdas simples"
        }
        return "celdas customizadas"
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return countries.count
  }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 50
        }
        return UITableView.automaticDimension
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            var cell = tableView.dequeueReusableCell(withIdentifier: "mycell")
            if cell == nil {
                cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
                cell?.backgroundColor = .lightGray
                cell?.textLabel?.font = UIFont.systemFont(ofSize: 20)
            }
            cell!.textLabel?.text = countries[indexPath.row]
            return cell!
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier:"myCustomCell", for: indexPath) as? MyCustomTableViewCell
        cell!.myFirstLabel.text = String(indexPath.row + 1)
        cell!.mySecondLabel.text = countries[indexPath.row]
        
        if indexPath.row == 2 {
            cell!.mySecondLabel.text = "dssadsadfsafdasfdsagdsgfdhsagjkfsdhgfsdhgjfhgureghfdjghreigurfghsdhgfvsdghdguhfdgufdgnfdghfjdgfdgjkhfjgkhjfdjkgfdjghdsjfg"
        }
        
        return cell!
        
    }
    
}

extension ViewController: UITableViewDelegate {
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(countries[indexPath.row])
    }
}


