//
//  CarMapViewController.swift
//  CarLocator
//
//  Created by Marcos García Rouco on 24/7/22.
//

import UIKit
import MapKit

class CarMapViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet var carMapView: MKMapView!
    @IBOutlet var topLabel: UILabel!

    // MARK: - Variables

    var interactor: CarProvider?

    // MARK: - Life cycle methods

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        setUpMap()
    }

    // MARK: - Custom methods

    public func injectDependencies(_ deps: App) {
        interactor = deps.carProvider
        interactor?.carPresenter.setView(self)
    }

    private func setUpViews() {
        topLabel.text = "Move around to find cars!"
        topLabel.font = .muktaMedium()
        topLabel.textColor = .white
        view.backgroundColor = UIColor.bgColor
    }

    private func setUpMap() {
        carMapView.delegate = self

        let coordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: CLLocationDegrees(Coordinates.hamburgCenter.0), longitude: Coordinates.hamburgCenter.1), latitudinalMeters: Coordinates.defaultRadius, longitudinalMeters: Coordinates.defaultRadius)
        carMapView.setRegion(coordinateRegion, animated: true)
    }

}

extension CarMapViewController: MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {

    }

}

extension CarMapViewController: CarViewController {
    func displayCars(_ cars: [CarViewModel]) {

    }
}
