function fetch_data_into_model(listmodel,model, host,index,type,max_records)
 {
     //create a request and tell it where the json that I want is
     var req = new XMLHttpRequest();
     var location = get_url(host,index,type);
    console.log(location);
     //tell the request to go ahead and get the json
     req.open("GET", location + "/_search?size=" + max_records, true);
     req.send(null);

     //wait until the readyState is 4, which means the json is ready
     req.onreadystatechange = function()
     {
         if (req.readyState == 4)
         {
             //turn the text in a javascript object while setting the ListView's model to it
             var result = JSON.parse(req.responseText)
             for ( var hits1 in result.hits.hits) {
                 var cat = result.hits.hits[hits1]._source;
                 listmodel.append(cat);
             }

             var rowCount = listmodel.count;
             model.items.remove(0,rowCount);
             for (var i=0;i<rowCount;++i) {
                 var obj = listmodel.get(i);
                 model.items.insert(obj);
             }
            model.finished_loading( listmodel.get(0).cat );

         }
     };
 }

function get_url(host,index,type) {
    var url_arr =  [ host , index , type ];
    return url_arr.join("/");
}

function save_object(host,index,type,obj) {

    var postman = new XMLHttpRequest();
    var postData = JSON.stringify(obj)

    postman.open("POST", get_url(host,index,type), true);


    postman.onreadystatechange = function() {
        if (postman.readyState == postman.DONE) {

            console.log("Your score has been uploaded." , postman.status , postman.statusText);
            console.log(postman.responseText);
        }
    }
    postman.send(postData);
}


function check_for_duplicates( items, obj ) {
     for ( var i=0; i < items.count ; ++i ) {
         var current_item = items.get(i).model;
        if (    current_item.cat == obj.cat
            &&  current_item.subcat == obj.subcat )
        {
            return true;
        }
    }
    return false;
}

function insert_item( items , obj ) {
    console.log("insert_item");
    if ( ! check_for_duplicates( items, obj ) ) {
       items.insert( obj, [ obj.cat , "created" ] );
    }
}

function filter_selected_category(  model, category ) {

    for( var i = 0;i < model.items.count;i++ ) {
        var entry = model.items.get(i);
        entry.inCurrentcategory= false;
        if (  entry.model.cat == category) {
            entry.inCurrentcategory= true;
        }
    }

    model.filterOnGroup = "currentcategory";
}

function select_first_item_in_model( model , listview ) {
    listview.current_category = model.get(0).cat;
}
