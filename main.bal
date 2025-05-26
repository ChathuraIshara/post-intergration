import ballerina/http;
import ballerina/uuid;

listener http:Listener postListener = http:getDefaultListener();
table<Post> key(id) postsTable = table [];

service / on postListener {
    resource function get [string id]() returns Post|NotFoundIdError {
        // Step 1: Call a function
        Post?|error result = findPostById(id);

        // Step 2: Check result and respond
        if result is Post {
            return result;
        } else {
            return {body: "Id not found. Provided: " + id};
        }
    }

    resource function post .(PostRequest postRequest) returns string {
        string id = uuid:createType1AsString();
        Post newPost = {id, ...postRequest};

        postsTable.add(newPost);
        return "New Post added successfully";
    }

    resource function put [string id](PostRequest postRequest) returns string|NotFoundIdError {
        if postsTable.hasKey(id) {
            postsTable.put({id, ...postRequest});
            return "Post updated successfully!";
        }
        return {body: "Id not found => " + id};
    }

    resource function delete [string id]() returns string|NotFoundIdError {
        if postsTable.hasKey(id) {
            _ = postsTable.remove(id);
            return "Post deleted successfully!";
        }
        return {body: "Id not found => " + id};
    }

}
