import Foundation

extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.flatMap { URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}

struct PhotoInfoController {
    
    func fetchPhotoInfo(completion: @escaping (PhotoInfo?) -> Void) {
        let baseURL = URL(string: "https://api.nasa.gov/planetary/apod")!
        let query: [String: String] = ["api_key": "DEMO_KEY", "date": "2012-10-25"]
        
        let newURL = baseURL.withQueries(query)!
        print(newURL)
        let newTask = URLSession.shared.dataTask(with: newURL) { (data, response, error) in
            
            let jsonDecoder = JSONDecoder()
            
            if let data = data, let photoInfo = try? jsonDecoder.decode(PhotoInfo.self, from: data) {
                completion(photoInfo)
            } else {
                print("Either no data was returned, or data was not properly decoded")
                completion(nil)
            }
        }
        newTask.resume()
    }
    
}
