$( document ).ready(function() {
    $("#random-button").on("click", function(event){
      event.preventDefault();
      var getRandom = $.ajax({
        url: "/random",
        method: "GET"
        });
      getRandom.done(function(response){
        console.log(response);
        $(".text-container").html(response);
      });
    });
});
