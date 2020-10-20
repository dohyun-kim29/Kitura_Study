import Kitura
import HeliumLogger
import LoggerAPI
import FileKit
import Foundation

HeliumLogger.use()

let router = Router()

let fileUrl = URL(fileURLWithPath: #file)

router.get("/") {
    
    request, response, next in
    response.send(["hello":"Hello, Kitura!"])
    next()
}

router.get("/file/") {
    
    request, response, next in
    response.send(["file" : "\(fileUrl)"])
    next()
}

Kitura.addHTTPServer(onPort: 8080, with: router)

Kitura.run()


