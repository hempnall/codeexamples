function save_category(obj) {


    JSON.stringify( )
    var postman = new XMLHttpRequest()
    var postData = JSON.stringify(obj)

    postman.open("POST", "http://diskstation:9200/scans/categories", true);
   // postman.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    postman.onreadystatechange = function() {
        if (postman.readyState == postman.DONE) {
            console.log("Your score has been uploaded.");
        }
    }
    postman.send(postData);
}
