

//// ArticleDetails
//window.addEvent('domready', function() {
//    var accordion = new Accordion('h5.ArticleDetails', 'div.ArticleDetails', {
//        opacity: false
//    }, $('accordionArticleDetails'));
//    accordion.display()
//});


//// ArticleSummary
//window.addEvent('domready', function() {
//    var accordion = new Accordion('h5.ArticleSummary', 'div.ArticleSummary', {
//        opacity: false
//    }, $('accordionArticleSummary'));
//    accordion.display()
//});




// AccordionInfo
window.addEvent('domready', function() {
    var accordion = new Accordion('h5.AccordionInfo', 'div.AccordionInfo', {
        opacity: false
    }, $('accordionAccordionInfo'));


 
    
    $('imgCollapce').addEvent('click', function() {
    
    accordion.display();
});


accordion.display();
});



