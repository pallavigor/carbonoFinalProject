////
////  ChecklistViewController.swift
////  carbonoFinalProject
////
////  Created by Pallavi Gorantla on 7/1/21.
////
//
//
import UIKit

class ChecklistItem {
    let title: String
    var isChecked: Bool = false
    
    init(title: String) {
        self.title = title
    }
}

class ChecklistViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    let items: [ChecklistItem] = [
        "Worked out on a machine",
        "Drove to work/school/other locations",
        "Used the dryer",
        "Left the light on when you left a room",
        "Took the plastic bag at a grocery store",
        "Did not recycle",
        "Ate beef or dairy",
        "Flew on an airplane",
        "Plugged in unused electronics",
        "Put your thermostat too high or too low",
        "Threw away food waste",
        "Used your phone/laptop excessively",
        "Bought clothes from a fast fashion brand"
    ].compactMap({
        ChecklistItem(title: $0)
    })
    
    private let tableView: UITableView = {
    let table = UITableView()
    table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    return table
}()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Checklist"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    
    }

    override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    tableView.frame = view.bounds
    }
    
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count

}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let item = items[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = item.title
    
    cell.accessoryType = item.isChecked ? .checkmark : .none
    
    return cell
    
}
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let item = items[indexPath.row]
    item.isChecked = !item.isChecked
    tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}

