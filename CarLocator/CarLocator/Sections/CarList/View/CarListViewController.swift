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

    var carList = [CarViewModel]() {
        didSet {
            carTableView.reloadData()
        }
    }

    // MARK: - Life cycle methods

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpTableView()
        fetchData()
    }

    // MARK: - Methods

    public func injectDependencies(_ deps: App) {
        interactor = deps.carProvider
        interactor?.carPresenter.setView(self)
    }

    private func fetchData() {
        Task {
            do {
                try await interactor?.retrieveCars(northWestCoordinates: nil, southEastCoordinates: nil)
            } catch let error as CarProviderError {
                // TODO show alert with a message
                print(error)
            } catch {
                // TODO show alert telling user something went wrong
                print(error)
            }
        }
    }

    private func setUpTableView() {
        carTableView.register(UINib(nibName: CustomCells.CarListTableViewCell, bundle: nil), forCellReuseIdentifier: CustomCells.CarListTableViewCell)
        carTableView.delegate = self
        carTableView.dataSource = self
        carTableView.separatorStyle = .none
    }

}

extension CarListViewController: CarViewController {
    func displayCars(_ cars: [CarViewModel]) {
        DispatchQueue.main.async { [weak self] in
            self?.carList = cars
        }
    }
}

extension CarListViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCells.CarListTableViewCell, for: indexPath) as? CarListTableViewCell else {
            return UITableViewCell()
        }
        cell.setUp(carList[indexPath.row])
        return cell
    }

}

