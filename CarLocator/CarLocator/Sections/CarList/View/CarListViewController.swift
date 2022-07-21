//
//  CarListViewController.swift
//  CarLocator
//
//  Created by Marcos García Rouco on 21/7/22.
//

import UIKit

class CarListViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet var carTableView: UITableView!

    // MARK: - Variables

    var interactor: CarProvider?

    // MARK: - Life cycle methods

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpTableView()
    }

    // MARK: - Methods

    public func injectDependencies(_ deps: App) {
        interactor = deps.carProvider
        interactor?.carPresenter.setView(self)
    }

    private func setUpTableView() {
        // TODO
    }

}

extension CarListViewController: CarViewController {}

extension CarListViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

}

