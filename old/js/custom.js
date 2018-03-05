$(function () {
    $('pre code').each(function (i, block) {
        hljs.highlightBlock(block);
    });
    var highlightInline = function (cssClass, language) {
        $("." + cssClass).each(function (i, block) {
            var jqBlock = $(block);
            var result = hljs.highlight(language, jqBlock.text());
            if (result.r) {
                jqBlock.html(result.value);
            }
        });
    };
    highlightInline("code-java", "java");
    highlightInline("code-html", "html");
});
