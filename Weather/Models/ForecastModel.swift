import Foundation

enum ForecastPeriod {
    case hourly
    case weekly
}

enum Weather: String {
    case clear = "Clear"
    case cloudy = "Cloudy"
    case rainy = "Mid Rain"
    case stormy = "Showers"
    case sunny = "Sunny"
    case tornado = "Tornado"
    case windy = "Fast Wind"
}

struct Forecast: Identifiable {
    var id = UUID()
    var date: Date
    var weather: Weather
    var probability: Int
    var temperature: Int
    var high: Int
    var low: Int
    var location: String
    
    var icon: String {
        switch weather {
        case .clear:
            return "Moon" // You’ll need to change this to a matching asset if used.
        case .cloudy:
            return "Sun cloud mid rain" // Pick one of the available icons
        case .rainy:
            return "Moon cloud mid rain"
        case .stormy:
            return "Sun cloud angled rain"
        case .sunny:
            return "Sun cloud mid rain"
        case .tornado:
            return "Tornado"
        case .windy:
            return "Moon cloud fast wind"
        }
    }
}


extension Forecast {
    static let hour: TimeInterval = 60 * 60
    static let day: TimeInterval = 60 * 60 * 24

    static let hourly: [Forecast] = [
        Forecast(date: .init(timeIntervalSinceNow: hour * -1), weather: .cloudy, probability: 20, temperature: 32, high: 35, low: 28, location: "Delhi, India"),
        Forecast(date: .now, weather: .rainy, probability: 70, temperature: 30, high: 33, low: 26, location: "Delhi, India"),
        Forecast(date: .init(timeIntervalSinceNow: hour * 1), weather: .windy, probability: 10, temperature: 31, high: 34, low: 27, location: "Delhi, India"),
        Forecast(date: .init(timeIntervalSinceNow: hour * 2), weather: .sunny, probability: 0, temperature: 33, high: 36, low: 29, location: "Delhi, India"),
        Forecast(date: .init(timeIntervalSinceNow: hour * 3), weather: .stormy, probability: 90, temperature: 29, high: 32, low: 26, location: "Delhi, India"),
        Forecast(date: .init(timeIntervalSinceNow: hour * 4), weather: .rainy, probability: 50, temperature: 30, high: 33, low: 27, location: "Delhi, India")
    ]

    static let weekly: [Forecast] = [
        Forecast(date: .init(timeIntervalSinceNow: 0), weather: .sunny, probability: 0, temperature: 34, high: 36, low: 29, location: "Delhi, India"),
        Forecast(date: .init(timeIntervalSinceNow: day * 1), weather: .cloudy, probability: 10, temperature: 33, high: 35, low: 28, location: "Delhi, India"),
        Forecast(date: .init(timeIntervalSinceNow: day * 2), weather: .rainy, probability: 60, temperature: 31, high: 34, low: 27, location: "Delhi, India"),
        Forecast(date: .init(timeIntervalSinceNow: day * 3), weather: .stormy, probability: 85, temperature: 30, high: 32, low: 26, location: "Delhi, India"),
        Forecast(date: .init(timeIntervalSinceNow: day * 4), weather: .sunny, probability: 0, temperature: 35, high: 37, low: 30, location: "Delhi, India"),
        Forecast(date: .init(timeIntervalSinceNow: day * 5), weather: .windy, probability: 20, temperature: 33, high: 36, low: 28, location: "Delhi, India")
    ]

    static let cities: [Forecast] = {
        let cityNames = [
            "Delhi", "Mumbai", "Bangalore", "Kolkata", "Chennai",
            "Hyderabad", "Ahmedabad", "Pune", "Jaipur", "Lucknow",
            "Bhopal", "Patna", "Chandigarh", "Visakhapatnam", "Guwahati",
            "Nagpur", "Indore", "Thiruvananthapuram", "Ranchi", "Srinagar"
        ]

        let allWeathers: [Weather] = [.sunny, .cloudy, .rainy, .stormy, .clear, .windy, .tornado]

        return cityNames.map { city in
            let weather = allWeathers.randomElement()!
            let temp = Int.random(in: 25...38)
            let high = temp + Int.random(in: 2...4)
            let low = temp - Int.random(in: 2...4)
            let probability = Int.random(in: 0...100)

            return Forecast(
                date: .now,
                weather: weather,
                probability: probability,
                temperature: temp,
                high: high,
                low: low,
                location: "\(city), India"
            )
        }
    }()
}
