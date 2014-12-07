function ajaxLoad(target, url, executeAfterLoaded) {
    var loading = document.createElement('img');
    loading.style.position = 'absolute';
    loading.src = "../images/icons/loading.gif";
    loading.width = '16';
    loading.height = '16';
    loading.style.top = (getY(target) - 8 +  target.offsetHeight / 2) + 'px';
    loading.style.left = (getX(target) - 8 + target.offsetWidth/ 2) + 'px';
    target.appendChild(loading);
    //loading.style.filter = 'alpha(opacity=50)';
    
    var xmlHttp;
    if (xmlHttp == null) {
        try {
            // Firefox, Opera 8.0+, Safari
            xmlHttp = new XMLHttpRequest();
        }
        catch (e) {
            // Internet Explorer
            try {
                xmlHttp = new ActiveXObject('Msxml2.XMLHTTP');
            }
            catch (e) {
                try {
                    xmlHttp = new ActiveXObject('Microsoft.XMLHTTP');
                }
                catch (e) {
                    alert('Your browser does not support AJAX!')
                    return;
                }
            }
        }
    }
    xmlHttp.onreadystatechange = function() {
        if (xmlHttp.readyState == 4) {
            try {

                target.innerHTML = '';

                //alert(target.id + ' : ' + xmlHttp.responseText);

                document.createTextNode(xmlHttp.responseText);
                target.innerHTML = xmlHttp.responseText;
                target.style.filter = 'alpha(opacity=100)';
                if (executeAfterLoaded.toString() != 'undefined') {
                    executeAfterLoaded();
                }
                return;
            }
            catch (e) {
                //alert(e.message);
                return;
            }
        }
    }

    xmlHttp.open('GET', encodeURI(url) + "&date=" + new Date(), true);
    xmlHttp.send(null);
}


function ajaxGet(url, executeAfterLoaded) {

    var xmlHttp;
    if (xmlHttp == null) {
        try {
            // Firefox, Opera 8.0+, Safari
            xmlHttp = new XMLHttpRequest();
        }
        catch (e) {
            // Internet Explorer
            try {
                xmlHttp = new ActiveXObject('Msxml2.XMLHTTP');
            }
            catch (e) {
                try {
                    xmlHttp = new ActiveXObject('Microsoft.XMLHTTP');
                }
                catch (e) {
                    alert('Your browser does not support AJAX!')
                    return;
                }
            }
        }
    }
    xmlHttp.onreadystatechange = function() {
        if (xmlHttp.readyState == 4) {
            try {
                if (executeAfterLoaded.toString() != 'undefined') {
                    executeAfterLoaded(xmlHttp.responseText);
                }
                return;
            }
            catch (e) {
                //alert(e.message);
                return;
            }
        }
    }

    xmlHttp.open('GET', encodeURI(url) + "&date=" + new Date(), true);
    xmlHttp.send(null);
}



function getY(oElement) {
    var iReturnValue = 0;
    while (oElement != null) {
        iReturnValue += oElement.offsetTop;
        oElement = oElement.offsetParent;
    }
    return iReturnValue;
}
function getX(oElement) {
    var iReturnValue = 0;
    while (oElement != null) {
        iReturnValue += oElement.offsetLeft;
        oElement = oElement.offsetParent;
    }
    return iReturnValue;
}

