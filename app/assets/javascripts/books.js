// check current product add it watch list
function check_watchlist(id){
    $.ajax({
        alert: '11111111111',
        url: "/books/index/",
        type: 'POST',
        cache: false,
        timeout: 1000,
        data:  id,
        date: "json",
        async: false,
        error: function(){
            alert('Error Occured');
        },
        success: function(data){
             books = Books.find_by_id(5)
            if (books){
                alert('Error Occured');
            }
        }
    });
}

