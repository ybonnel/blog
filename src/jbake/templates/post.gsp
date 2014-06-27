<%include "header.gsp"%>
	
	<%include "menu.gsp"%>
	
	<div class="page-header">
        <div class="row">
            <div class="col-xs-4 col-md-2"><img src="${content.rootpath}img/JustAnOtherDevBlog.png"></div>
            <div class="col-xs-12 col-md-8"><h1>${content.title}</h1></div>
        </div>
	</div>

    <div class="row">

        <div class="col-sm-8">

        <p><em>${content.date.format("dd MMMM yyyy")}</em></p>


        <p>Tags :
        <%
            out << content.tags.collect { post_tag ->
                """<a href="${content.rootpath}tags/${post_tag}.html">${post_tag}</a>"""
            } .join(", ")
        %>
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
                <%
                    alltags.collect { tag ->
                        [
                                tag,
                                posts.findAll { post ->
                                    post.tags.contains(tag)
                                }.size()
                        ]
                    } .sort { tag ->
                        String.format("%03d%s", 1000 - tag[1], tag[0].toLowerCase())
                    } .each { tagWithCount ->

                %>

                <li><a href="${content.rootpath}tags/${tagWithCount[0]}.html">${tagWithCount[0]}</a> (${tagWithCount[1]})</li>
                <%}%>
            </ol>
        </div>
    </div>
	
<%include "footer.gsp"%>
