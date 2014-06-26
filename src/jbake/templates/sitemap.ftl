<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd">
    <url>
        <loc>${config.site_host}/index.html</loc>
        <lastmod>${published_date?string("yyyy-MM-dd")}</lastmod>
    </url>
    <url>
        <loc>${config.site_host}/archive.html</loc>
        <lastmod>${published_date?string("yyyy-MM-dd")}</lastmod>
    </url>
<#list alltags as tag>
    <url>
        <#assign lastmod=0>
        <#assign lastmod_date="0000-00-00">
        <loc>${config.site_host}/tags/${tag}.html</loc>
        <#list posts as post>
            <#list post.tags as postTag>
                <#if postTag == tag>
                    <#if lastmod < post.date?string("yyyyMMdd")?number>
                        <#assign lastmod=post.date?string("yyyyMMdd")?number>
                        <#assign lastmod_date=post.date?string("yyyy-MM-dd")>
                    </#if>
                </#if>
            </#list>
        </#list>
        <lastmod>${lastmod_date}</lastmod>
    </url>
</#list>
<#list published_content as content>
    <url>
        <loc>${config.site_host}/${content.uri}</loc>
        <lastmod>${content.date?string("yyyy-MM-dd")}</lastmod>
    </url>
</#list>
</urlset>
