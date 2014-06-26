<#assign pagetitle = "JustAnOtherDevBlog">
<#include "header.ftl">
	
	<#include "menu.ftl">

	<div class="page-header">
            <div class="row">
                <div class="col-xs-4 col-md-2"><img src="img/JustAnOtherDevBlog.png"></div>
                <div class="col-xs-12 col-md-8"><h1>JustAnOtherDevBlog</h1></div>
            </div>
	</div>

    <div class="row">

    <div class="col-sm-8">

        <#assign count=0>
        <#list posts as post>
            <#if (post.status == "published")>
                <a href="${post.uri}"><h1>${post.title}</h1></a>
                <p>${post.date?string("dd MMMM yyyy")}</p>

                <p>Tags :
                    <#list post.tags as post_tag>
                        <a href="tags/${post_tag}.html">${post_tag}</a><#if post_tag_has_next>, </#if>
                    </#list>
                </p>

                            <a href="https://twitter.com/share" class="twitter-share-button" data-url="http://www.ybonnel.fr/${post.uri}" data-text="${post.title}" data-via="ybonnel" data-lang="fr">Tweeter</a>
                            <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>
                            <div class="g-plusone" data-size="medium" data-href="http://www.ybonnel.fr/${post.uri}"></div>

                <p>${post.body}</p>
                            <p><a href="${post.uri}#disqus_thread">Commentaires</a></p>
                <#assign count= count + 1 >
            </#if>

            <#if (count >= 5)>
                <#break >
            </#if>

        </#list>

        <hr />

        <p>Billets plus anciens disponibles sur la page <a href="${config.archive_file}">archive</a>.</p>

    </div>

    <div class="col-sm-3 col-sm-offset-1 blog-sidebar">
        <div class="sidebar-module sidebar-module-inset">
            <h4>Yan Bonnel</h4>
            <p>Geek. Technos de prédilections : Java, Android, Git.</p>
        </div>

        <div class="sidebar-module">
            <a class="twitter-timeline"  href="https://twitter.com/ybonnel"  data-widget-id="482174196248608769">Tweets de @ybonnel</a>
            <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
        </div>

        <div class="sidebar-module">
            <h4>Tags</h4>
            <ol class="list-unstyled" style="margin-left: 0px">
                <#list "freemarker.core.CollectionAndSequence"?new(alltags)?sort as tag>
                    <#assign count = 0>
                    <#list posts as post>
                        <#list post.tags as postTag>
                            <#if postTag == tag>
                                <#assign count = count + 1>
                            </#if>
                        </#list>
                    </#list>

                    <li><a href="tags/${tag}.html">${tag}</a> (${count})</li>
                </#list>
                </ol>
        </div>
    </div>

    </div>

<#include "footer.ftl">
