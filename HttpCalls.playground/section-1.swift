import UIKit

var request = NSMutableURLRequest(URL: NSURL(string: "http://localhost:4567/current_queue")!)
request.HTTPMethod = "GET"

var response: NSURLResponse?
var data: NSData?
var error: NSError?

var dataVal: NSData = NSURLConnection.sendSynchronousRequest(
    request,
    returningResponse: &response,
    error: &error
)!

var jsonResult: [NSDictionary] = NSJSONSerialization.JSONObjectWithData(
    dataVal,
    options: NSJSONReadingOptions.MutableContainers,
    error: nil
) as [NSDictionary]


jsonResult[0].objectForKey("id")
jsonResult[0].objectForKey("playerOne")
jsonResult[0].objectForKey("playerTwo")
