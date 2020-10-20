import Kitura
import HeliumLogger
import LoggerAPI

HeliumLogger.use()

let router = Router()

router.get("/") {
    
    request, response, next in
    response.send(["hello":"Hello, Kitura!"])
    next()
}

Kitura.addHTTPServer(onPort: 8080, with: router)

Kitura.run()


