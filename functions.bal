// Function to retrieve post from the table
function findPostById(string id) returns Post?|error {
    return postsTable[id];
}
