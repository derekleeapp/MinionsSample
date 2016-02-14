import UIKit

class MinionsTableViewController: UITableViewController {

    let supplier: Supplier!

    var minions: [Minion]?


    init(minionSupplier: Supplier) {

        self.supplier = minionSupplier

        super.init(style: .Plain)
    }

    required init?(coder aDecoder: NSCoder) {
        self.supplier = MinionSupplier()
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchMinions()
    }


    //MARK: - UITableViewDataSource

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return minions?.count ?? 0
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("minionsCell")! as UITableViewCell

        if let minion = self.minions?[indexPath.row] {
            cell.textLabel?.text = minion.name
        }

        return cell
    }

    //MARK: - Private Methods
    private func fetchMinions() {

        supplier.getMinionsAsynchronously { fetchedMinions in
            self.minions = fetchedMinions
        }

    }
}
