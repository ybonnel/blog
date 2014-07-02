<%include "header.gsp"%>
	
	<%include "menu.gsp"%>

	<div class="page-header">
        <div class="row">
            <div class="col-xs-4 col-md-2"><img src="img/JustAnOtherDevBlog.png"></div>
            <div class="col-xs-12 col-md-8"><h1>JustAnOtherDevBlog</h1></div>
        </div>
	</div>

    <div class="row">

        <div class="col-sm-8">

            <% posts.take(5).each { post -> %>
                <%if (post.status == "published") {%>
                    <a href="${post.uri}"><h1>${post.title}</h1></a>
                    <p>${post.date.format("dd MMMM yyyy")}</p>

                    <p>Tags :
                        <%
                            out << post.tags.collect { post_tag ->
                                """<a href="tags/${post_tag}.html">${post_tag}</a>"""
                            } .join(", ")
                        %>
                    </p>

                    <a href="https://twitter.com/share" class="twitter-share-button" data-url="http://www.ybonnel.fr/${post.uri}" data-text="${post.title}" data-via="ybonnel" data-lang="fr">Tweeter</a>
                    <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>
                    <div class="g-plusone" data-size="medium" data-href="http://www.ybonnel.fr/${post.uri}"></div>

                    <p>${post.body}</p>
                    <p><a href="${post.uri}#disqus_thread">Commentaires</a></p>
                <%}%>

            <%}%>

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
                    <%
                        // alltags : list de tags (String)
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
                        <li><a href="tags/${tagWithCount[0]}.html">${tagWithCount[0]}</a> (${tagWithCount[1]})</li>
                    <%}%>
                 </ol>
            </div>
        </div>

    </div>

<%include "footer.gsp"%>