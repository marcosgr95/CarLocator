//
//  MyTaxiCarProvider.swift
//  CarLocator
//
//  Created by Marcos García Rouco on 21/7/22.
//

import Foundation

final class MyTaxiCarProvider: CarProvider {

    var carPresenter: CarPresenter

    init(carPresenter: CarPresenter) {
        self.carPresenter = carPresenter
    }

    func retrieveCars(northWestCoordinates: (Double, Double)? = nil, southEastCoordinates: (Double, Double)? = nil) async throws {
        do {
            var urlComps = URLComponents(string: injectApp().API.poiListEndpoint)
            if let northWestCoordinates = northWestCoordinates, let southEastCoordinates = southEastCoordinates {
                urlComps?.queryItems = [
                    URLQueryItem(name: QueryParams.nwLat, value: "\(northWestCoordinates.0)"),
                    URLQueryItem(name: QueryParams.nwLon, value: "\(northWestCoordinates.1)"),
                    URLQueryItem(name: QueryParams.seLat, value: "\(southEastCoordinates.0)"),
                    URLQueryItem(name: QueryParams.seLon, value: "\(southEastCoordinates.1)")
                ]
            } else {
                urlComps?.queryItems = URLQueryItem.hamburgCoordinatesAsURLQueryItems
            }

            guard
                let urlComps = urlComps,
                let url = urlComps.url
            else {
                throw CarProviderError.badUrl
            }
            print(url)
            let (data, response) = try await URLSession.shared.data(from: url)
            guard
                let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200
            else {
                throw CarProviderError.badRequest
            }
            let carLocatorResult = try JSONDecoder().decode(CarLocatorResult<[Car]>.self, from: data)
            carPresenter.presentCars(carLocatorResult)
        } catch let error as CarProviderError {
            throw error
        } catch {
            throw CarProviderError.decodingError(error)
        }
    }

}
