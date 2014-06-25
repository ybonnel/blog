<#assign pagetitle = "JustAnOtherDevBlog - ${content.title}">
<#include "header.ftl">
	
	<#include "menu.ftl">
	
	<div class="page-header">
		<h1>${content.title}</h1>
	</div>

	<p><em>${content.date?string("dd MMMM yyyy")}</em></p>

    <p>Tags :
        <#list content.tags as tag>
            <a href="/tags/${tag}.html">${tag}</a><#if tag_has_next>, </#if>
        </#list>
    </p>
        <a href="https://twitter.com/share" class="twitter-share-button" data-url="http://www.ybonnel.fr/${content.uri}" data-via="ybonnel" data-text="${content.title}" data-lang="fr">Tweeter</a>
        <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>
        <div class="g-plusone" data-size="medium" data-href="http://www.ybonnel.fr/${content.uri}"></div>

	<p>${content.body}</p>

        <div id="disqus_thread"></div>
        <script type="text/javascript">
            var disqus_shortname = 'ybonnel';
            var disqus_identifier = '${content.id}';
            (function() {
                var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
                dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
                (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
            })();
        </script>

	<hr>
	
<#include "footer.ftl">
