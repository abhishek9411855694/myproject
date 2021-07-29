

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var todoTablview: UITableView!
    var todoVM : [Todomodel1]?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchData()
        // Do any additional setup after loading the view.
    }
    
    
    
    fileprivate func fetchData() {
        Service.shared.fetchCourses {[weak self] (todolist, err) in
            if let err = err {
                print("Failed to fetch courses:", err)
                return
            }
            self?.todoVM = todolist ?? []
            if let _ = self?.todoVM{
                self?.todoTablview.reloadData()
            }
        }
    }

    
    
    
    


}

extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.todoVM?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "democell", for: indexPath) as! DemoTableViewCell
        let currentTodoVM = self.todoVM?[indexPath.row]
        cell.todo = currentTodoVM
        return cell
    }
    

}
extension ViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150;
    }
}
