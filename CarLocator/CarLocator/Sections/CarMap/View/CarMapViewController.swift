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
        Task {
            do {
                let mapBounds = mapView.mapBounds
                try await interactor?.retrieveCars(northWestCoordinates: mapBounds.0, southEastCoordinates: mapBounds.1)
            } catch let error as CarProviderError {
                var message: String?
                switch error {
                case .badRequest:
                    message = ErrorMessages.serverError
                default:
                    message = ErrorMessages.generic
                }
                showAlert(title: "Oops!", message: message ?? "")
            } catch {
                showAlert(title: "Oops!", message: error.localizedDescription)
            }
        }
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is CarAnnotation else {
            return nil
        }

        var annotationView: MKAnnotationView?
        if let dequeuedAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: CarAnnotation.identifier) {
            annotationView = dequeuedAnnotationView
            annotationView?.annotation = annotation
        } else {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: CarAnnotation.identifier)
            annotationView?.rightCalloutAccessoryView = UIButton(type: .close)
        }

        guard let annotationView = annotationView else { return nil }

        annotationView.image = UIImage(systemName: "car")
        annotationView.canShowCallout = true
        annotationView.calloutOffset = CGPoint(x: -5, y: 5)

        return annotationView
    }

}

extension CarMapViewController: CarViewController {
    func displayCars(_ cars: [CarViewModel]) {
        DispatchQueue.main.async { [weak self] in
            self?.carMapView.removeAnnotations(self?.carMapView.annotations ?? [])
            self?.carMapView.addAnnotations(
                cars.map { CarAnnotation(
                    coordinate: CLLocationCoordinate2D(latitude: $0.location.0, longitude: $0.location.1),
                    title: String(type: $0.type, location: $0.location),
                    type: $0.type)
                }
            )
        }
    }
}
