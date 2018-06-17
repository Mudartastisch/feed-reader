<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:nasp="http://webis.de/feedreader/model/atom">
<xsl:template match="/">
    
<html lang="en">
    
<head> 
    
    <title>RSS Feed Reader</title>
    <meta http-equiv="description" content="Dies ist ein RSS Feed Reader für die Übung Webtechnology SoSe 18."/>
    <meta name="keywords" content="feed, reader, news"/>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <link rel="stylesheet" href="css/feedreader.css"/>
    
</head>
    
<body>
<div id="container">
    <header>
        <div id="rsslogo"></div>
        <span id="rsstitle">RSS Reader</span>
    </header>
    
    <div id="description">
        <div>
            <xsl:value-of select="nasp:feed/nasp:title"/> by <xsl:value-of select="nasp:feed/nasp:author/nasp:name"/>
        </div>
        <div>
            <xsl:value-of select="nasp:feed/nasp:subtitle"/>
        </div>
    </div>
    
    <main>
        
      <xsl:for-each select="nasp:feed/nasp:entry">
              
        <article id="{nasp:id}">
            <a href="{nasp:link/@href}" target="_blank">
                <xsl:value-of select="nasp:title"/>
            </a>
            <div class="content">
                <xsl:value-of select="nasp:summary"/>
            </div>
            <div class="meta">
                published on 
                <b><!-- 

                        Formating Date Input

                    --><xsl:value-of select="substring(nasp:updated, 9, 2)"/>.<!--
                    --><xsl:value-of select="substring(nasp:updated, 6, 2)"/>.<!--
                    --><xsl:value-of select="substring(nasp:updated, 0, 5)"/> (<!--
                    --><xsl:value-of select="substring(nasp:updated, 12, 5)"/>)
                </b>
                by 
                <b><xsl:value-of select="nasp:author/nasp:name"/></b>
            </div>
        </article>
        
      </xsl:for-each>
        
    </main>
    
    <footer>
        Dieser RSS Reader wurde von der Gruppe Christian Dunkel, Jonas Haffky und Kai Lorenz erstellt.
        <a href="#">Link 2</a>
        <a href="#">Link 1</a>
    </footer>
</div>
    
</body>

</html>  

</xsl:template>
</xsl:stylesheet>