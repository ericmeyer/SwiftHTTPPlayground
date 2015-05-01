import XCPlayground
import UIKit


func addMatch() {
    var postRequest = NSMutableURLRequest(URL: NSURL(string: "http://localhost:4567/add_match")!);
    postRequest.HTTPMethod = "POST"

    var postString = "playerOne=Foo&playerTwo=Taka"
    let requestBodyData = (postString as NSString).dataUsingEncoding(NSUTF8StringEncoding)

    postRequest.HTTPBody = requestBodyData

    NSURLConnection.sendAsynchronousRequest(postRequest, queue: NSOperationQueue.mainQueue(), completionHandler: {(response, data, error)
        in handleAddMatchResponse(data, error)
    })
}

func fetchCurrentQueue() {
    var request = NSMutableURLRequest(URL: NSURL(string: "http://localhost:4567/current_queue")!)
    request.HTTPMethod = "GET"

    NSURLConnection.sendAsynchronousRequest(
        request,
        queue: NSOperationQueue.mainQueue(),
        completionHandler: {(response, data, error)
            in logGETResults(data, error)
        }
    )
}

func handleAddMatchResponse(data: NSData?, error: NSError?) {
    fetchCurrentQueue()
}

func logGETResults(data: NSData?, error: NSError?) {
    var jsonResult: [NSDictionary] = NSJSONSerialization.JSONObjectWithData(
        data!,
        options: NSJSONReadingOptions.MutableContainers,
        error: nil
        ) as! [NSDictionary]
    jsonResult.count
    jsonResult[jsonResult.count - 1].objectForKey("id")
    jsonResult[jsonResult.count - 1].objectForKey("playerOne")
    jsonResult[jsonResult.count - 1].objectForKey("playerTwo")
}

addMatch()

XCPSetExecutionShouldContinueIndefinitely()
