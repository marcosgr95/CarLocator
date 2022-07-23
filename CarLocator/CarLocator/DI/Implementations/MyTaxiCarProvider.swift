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

    func retrieveCars(latitudes: (Double, Double), longitudes: (Double, Double)) async throws {
        do {
            var urlComps = URLComponents(string: injectApp().API.poiListEndpoint)
            urlComps?.queryItems = URLQueryItem.hamburgCoordinatesAsURLQueryItems

            guard
                let urlComps = urlComps,
                let url = urlComps.url
            else {
                throw CarProviderError.badUrl
            }

            let (data, response) = try await URLSession.shared.data(from: url)
            guard
                let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200
            else {
                throw CarProviderError.badRequest
            }
            let carLocatorResult = try JSONDecoder().decode(CarLocatorResult<[Car]>.self, from: data)

        } catch let error as CarProviderError {
            throw error
        } catch {
            throw CarProviderError.decodingError(error)
        }
    }

}
