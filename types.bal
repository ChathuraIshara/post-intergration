import ballerina/http;
type Post record {| 
    readonly string id; 
    *PostRequest; 
|};

type PostRequest record {| 
    string name; 
    string author; 
    int year; 
|};

type NotFoundIdError record {| 
    *http:NotFound; 
    string body; 
|};
