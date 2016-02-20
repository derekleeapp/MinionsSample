import UIKit

class MinionsTableViewController: UITableViewController {

    let supplier: Repo!

    var minions: [Minion]?

    init(minionsRepo: Repo) {
        self.supplier = minionsRepo

        super.init(style: .Plain)
    }

    required init?(coder aDecoder: NSCoder) {
        self.supplier = MinionsRepo(parser: MinionsJsonParser())
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

            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.tableView.reloadData()
            })
        }

    }
}
