
function generate_gallery () {
    var settings = {
	thumbListId: "thumbs",
	imgViewerId: "viewer",
	activeClass: "active",
	activeTitle: "Photo en cours de visualisation",
    loaderTitle: "Chargement en cours",
	loaderImage: "static/img/loader.gif"
    };
    
    var thumbLinks = $("#"+settings.thumbListId).find("a"),
    firstThumbLink = thumbLinks.eq(0),
    highlight = function(elt){
	thumbLinks.removeClass(settings.activeClass).removeAttr("title");
	elt.addClass(settings.activeClass).attr("title",settings.activeTitle);
    },
    loader = $(document.createElement("img")).attr({
	alt: settings.loaderTitle,
	title: settings.loaderTitle,
	src: settings.loaderImage
    });
    
    highlight(firstThumbLink);
    
    $("#"+settings.thumbListId).after(
	$(document.createElement("div"))
	    .attr("id",settings.imgViewerId)
	    .append(
		$(document.createElement("img")).attr({
		    alt: "",
		    src: firstThumbLink.attr("href")
		})
	    )
  );
    
  var imgViewer = $("#"+settings.imgViewerId),
    bigPic = imgViewer.children("img");
    
    thumbLinks
	.click(function(e){
	    e.preventDefault();
	    var $this = $(this),
            target = $this.attr("href");
	    if (bigPic.attr("src") == target) return;
	    highlight($this);
	    imgViewer.html(loader);
	    bigPic
		.load(function(){
		    imgViewer.html($(this).fadeIn(250));
		})
		.attr("src",target);
	});
}


