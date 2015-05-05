$('input[type="submit"]').mousedown(function(){
    $(this).css('background', 'rgb(3, 2, 0)');
});
$('input[type="submit"]').mouseup(function(){
    $(this).css('background', 'rgb(3, 2, 0)');
});

$('#loginform').click(function(){
  $('.login').fadeToggle('slow');
  $(this).toggleClass('green');
});


$('#referToFrnd').click(function () {
    $('.login2').fadeToggle('slow');
    $(this).toggleClass('green2');
});


$(document).mouseup(function (e)
{
    var container = $(".login");

    if (!container.is(e.target) // if the target of the click isn't the container...
        && container.has(e.target).length === 0) // ... nor a descendant of the container
    {
        container.hide();
        $('#loginform').removeClass('green');
    }
});



$(document).mouseup(function (e) {
    var container = $(".login2");

    if (!container.is(e.target) // if the target of the click isn't the container...
        && container.has(e.target).length === 0) // ... nor a descendant of the container
    {
        container.hide();
        $('#referToFrnd').removeClass('green2');
    }
});