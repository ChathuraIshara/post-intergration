import ballerina/http;
import ballerina/io;

listener http:Listener httpDefaultListener = http:getDefaultListener();

service / on httpDefaultListener {
    resource function get greeting() returns error|json|http:InternalServerError {
        do {
            io:print("test posts");
        } on fail error err {
            // handle error
            return error("unhandled error", err);
        }
    }

    resource function post post(string name) returns error|json {
        do {
            string var1 = "hello";
            io:println(var1);
        } on fail error err {
            // handle error
            return error("unhandled error", err);
        }
    }
}
