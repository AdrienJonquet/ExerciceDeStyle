
function generate_gallery () {
    var settings = {
	thumbListId: "thumbs",
	imgViewerId: "viewer",
	activeClass: "active",
	activeTitle: "Photo en cours de visualisation",
	loaderTitle: "Chargement en cours",
	loaderImage: "img/loader.gif"
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
    
    var message = firstThumbLink.children("div").clone();
    message.css({"display": ""});

    $("#"+settings.thumbListId).after(
	$(document.createElement("div"))
	    .attr("id", settings.imgViewerId)
	    .append(
		$(document.createElement("img")).attr({
		    alt: "",
		    src: firstThumbLink.attr("href")
		}))
	    .append(
		$(document.createElement("div"))
		    .attr("style", "float:right; margin-left:30px")
		    .html(message)));
    
    var imgViewer = $("#"+settings.imgViewerId);
    var bigPic = imgViewer.children("img");
    var textPic = imgViewer.children("div");
    
    thumbLinks
	.click(function(e){
	    e.preventDefault();
	    var $this = $(this),
	    target = $this.attr("href");
	    var text = $this.children("div").clone();
	    text.css({"display": ""});
	    if (bigPic.attr("src") == target) 
	    	return;
	    highlight($this);
	    imgViewer.html(loader);
	    bigPic.load(function(){
	    	imgViewer.html($(this).fadeIn(250)).append(textPic.html(text));
	    }).attr("src", target);
	    textPic.html(text);
	});
}


