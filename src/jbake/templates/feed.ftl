<?xml version='1.0' encoding='UTF-8'?>
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">
  <channel>
    <title>JustAnOtherDevBlog</title>
    <subtitle type='html'>Les sujets qui m&#39;intéressent : Android, Java, Git.</subtitle>
    <link>${config.site_host}</link>
    <atom:link href="${config.site_host}/feed.xml" rel="self" type="application/rss+xml" />
    <description>JustAnOtherDevBlog</description>
    <language>en-gb</language>
    <pubDate>${published_date?string("EEE, d MMM yyyy HH:mm:ss Z")}</pubDate>
    <lastBuildDate>${published_date?string("EEE, d MMM yyyy HH:mm:ss Z")}</lastBuildDate>
    <author>
      <name>Yan Bonnel</name>
      <email>ybonnel@gmail.com</email>
    </author>

    <#list published_posts as post>
    <item>
      <title><#escape x as x?xml>${post.title}</#escape></title>
      <link>${config.site_host}/${post.uri}</link>
      <pubDate>${post.date?string("EEE, d MMM yyyy HH:mm:ss Z")}</pubDate>
      <guid isPermaLink="false">${config.site_host}/${post.uri}</guid>
      	<description>
	<#escape x as x?xml>	
	${post.body}
	</#escape>
	</description>
    </item>
    </#list>

  </channel> 
</rss>
