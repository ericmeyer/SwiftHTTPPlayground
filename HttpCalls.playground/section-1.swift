import XCPlayground
import UIKit

var request = NSMutableURLRequest(URL: NSURL(string: "http://localhost:4567/current_queue")!)
request.HTTPMethod = "GET"

var response: NSURLResponse?
var data: NSData?
var error: NSError?

func logResults(data: NSData?, error: NSError?) {
    var jsonResult: [NSDictionary] = NSJSONSerialization.JSONObjectWithData(
        data!,
        options: NSJSONReadingOptions.MutableContainers,
        error: nil
        ) as [NSDictionary]
    jsonResult[0].objectForKey("id")
    jsonResult[0].objectForKey("playerOne")
    jsonResult[0].objectForKey("playerTwo")
}

NSURLConnection.sendAsynchronousRequest(
    request,
    queue: NSOperationQueue.mainQueue(),
    completionHandler: {(response, data, error)
        in logResults(data, error)
    }
)

XCPSetExecutionShouldContinueIndefinitely()
