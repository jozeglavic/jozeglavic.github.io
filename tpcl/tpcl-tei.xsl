<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    Project: GAMS Projekttemplate
    Company: ZIM-ACDH (Zentrum für Informationsmodellierung - Austrian Centre for Digital Humanities)
 -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:s="http://www.w3.org/2001/sw/DataAccess/rf1/result" xmlns="http://www.w3.org/1999/xhtml"
    xmlns:t="http://www.tei-c.org/ns/1.0" xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/"
    xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:lido="http://www.lido-schema.org" 
    xmlns:teix="http://www.tei-c.org/ns/Examples"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:oai="http://www.openarchives.org/OAI/2.0/" exclude-result-prefixes="#all">
    
    
    <xsl:include href="tpcl-static.xsl"/>
    
    
    <!--///////////////////////////////////////////////////////////////////-->
    <!--Stylesheet for presenting the trasncribed letters of family Terpinc-->
    <!--///////////////////////////////////////////////////////////////////--> 
    
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    
    
    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"/>
            </head>
            <body>
                <xsl:call-template name="content"/>
            </body>
        </html>
    </xsl:template>
    
    
    
    
    <xsl:template name="content">
        <xsl:if test="//tei:correspDesc">
        <section class="row">       
            
            <!--////////////Letter sender and reciever - correspDesc//////--> 
            
            <article class="col-md-12">
                <div class="card-body"> 
                    <div class="p-3">   
                        
                        <xsl:text>Od: </xsl:text>           
                        <xsl:apply-templates select="//tei:correspAction[@type='sent']/tei:persName"/> 
                        <xsl:text> Poslano: </xsl:text> 
                        <xsl:apply-templates select="//tei:correspAction[@type='sent']/tei:placeName"/>
                        <xsl:text>, </xsl:text> <xsl:apply-templates select="//tei:correspAction[@type='sent']/tei:date/@when"/>
                    </div>  
                    
                    <div class="p-3"><xsl:text>Za: </xsl:text>               
                        <xsl:apply-templates select="//tei:correspAction[@type='received']/tei:persName"/> 
                        <xsl:text> Prejeto: </xsl:text> 
                        <xsl:apply-templates select="//tei:correspAction[@type='received']/tei:placeName"/>
                        <xsl:text>, </xsl:text>  <xsl:apply-templates select="//tei:correspAction[@type='received']/tei:date/@when"/>
                    </div>
                    
                    
                </div>
            </article>         
        </section>
        </xsl:if>
        
        <xsl:if test="not(//tei:listPlace) and ($mode = 'view:editionobject' or $mode = '')">
            <section class="row">
                <!-- First Column -->
                <article class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <xsl:apply-templates select="//t:body"/>
                        </div>
                    </div>
                </article>
                
                <!-- Second Column -->
                <article class="col-md-6" style="margin-top:30px;">
                    <div class="sticky-top" style="top:67px; z-index:100;">
                        <div id="vwr-content" class="toc" style="background-color: #E8E8E8; height:700px;">
                            <xsl:text> </xsl:text>
                        </div>                       
                        <xsl:call-template name="gamsOsd">
                            <xsl:with-param name="pid" select="concat('/', $teipid)"/>
                        </xsl:call-template>
                    </div>
                    
                    <!-- JavaScript Libraries -->
               
                    
                    <!-- JavaScript Initialization -->
                   
                    <!-- ATTENTION: Watch out for line breaks in the last line. -->
                </article>
            </section>
        </xsl:if>
        
        <xsl:if test="//tei:listPlace">
            <section class="row">
                <!-- First Column -->
                <article class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <xsl:apply-templates select="//t:body"/>
                        </div>
                    </div>
                </article>               
                
            </section>
        </xsl:if>
        
    </xsl:template> 
    
    <xsl:template name="gamsOsd">
        <xsl:param name="pid"/>
        <script type="text/javascript" src="{$gamsAssetsRootPath}/lib/editionviewer/openseadragon.js">
            <xsl:text> </xsl:text>
        </script>
        <script type="text/javascript" src="{$gamsAssetsRootPath}/lib/editionviewer/bs-scroll-the-edition.js">
            <xsl:text> </xsl:text>
        </script>
        <script type="text/javascript" src="{$gamsAssetsRootPath}/lib/editionviewer/gamsEdition.js">
            <xsl:text> </xsl:text>
        </script>  
        <script type="text/javascript">
            gamsOsd({
            id: "vwr-content",
            prefixUrl: "/osdviewer/images/",
            showNavigator: true,
            sequenceMode: true,
            showReferenceStrip: true,
            showRotationControl: true,
            showIiifLabels: false,
            referenceStripScroll: "horizontal",
            pid: "<xsl:value-of select="concat('/', $teipid)"/>",
            });
        </script>
    </xsl:template> 
    
    
    
    <!--after content-->
    <!--tooltip-->

    
    
    
    <xsl:template match="tei:date/@when">
        <!-- Format the date with full month name -->        
            
            <xsl:text> </xsl:text><!-- Calendar glyph -->
            <xsl:value-of select="format-date(., '[D01] [MN] [Y]')"/>
    </xsl:template>
    
    
    <!--Page number of a letter-->
    <xsl:template match="//tei:pb">
        <xsl:for-each select=".">
            <br/>
            <br/>
            <h2 class="mb-2" id="{@xml:id}">
                <xsl:value-of select="@n"/>
            </h2>
        </xsl:for-each>
    </xsl:template>
    
     
    <!--letter styling based on the tei encoding-->
    
    <xsl:template match="tei:opener">
        <div class="opener-{@rend}" >            
            <xsl:apply-templates/>
        </div> 
        <br/> 
    </xsl:template> 
    
    <xsl:template match="tei:closer"> 
        <br/>         
        <div class="closer-{@rend}" >            
            <xsl:apply-templates/>
        </div> 
    </xsl:template> 
    
    
    <xsl:template match="tei:placeName">         
        <span class="placename" id="{@ref}">
            <xsl:apply-templates/>
        </span> 
    </xsl:template> 
    
    <xsl:template match="tei:persName">         
        <span class="persname" id="{@ref}">
            <xsl:apply-templates/>
        </span> 
    </xsl:template>    
    
    <xsl:template match="tei:lb"> 
        <xsl:for-each select=".">                            
            <span><xsl:apply-templates/></span><br/> 
        </xsl:for-each>
    </xsl:template>   
    
    <xsl:template match="tei:listPlace/tei:place">        
            <div class="place" id="{@xml:id}">                
                <h2># <xsl:value-of select="@xml:id"/></h2>
                
                
                <xsl:for-each select="tei:placeName">
                    
                    <xsl:choose>
                        <!-- Check if language is "sl" -->
                        <xsl:when test="@xml:lang = 'sl'">
                            <xsl:text>Slovensko ime: </xsl:text>
                        </xsl:when>
                        <!-- Check if language is "de" -->
                        <xsl:when test="@xml:lang = 'de'">
                            <xsl:text>Nemško ime: </xsl:text>
                        </xsl:when>
                        <!-- Default case -->
                        <xsl:otherwise>
                            <xsl:text>Unknown: </xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>
                    <!-- Output placeName value -->
                    <xsl:value-of select="."/>
                    <br/>
                    
                </xsl:for-each>
                
                
                <xsl:for-each select="tei:settlement">
                    <xsl:text>Naselje: </xsl:text>
                    <xsl:apply-templates/>
                    <br/>                    
                </xsl:for-each>
                
                
                <xsl:for-each select="tei:country">
                    <xsl:text>Država: </xsl:text>
                    <xsl:apply-templates/>
                    <br/>
                </xsl:for-each>
                
                
                <xsl:for-each select="tei:idno">
                    <xsl:text>GeoNames povezava: </xsl:text>
                    <a>
                        <xsl:attribute name="href">
                            <xsl:apply-templates/>
                        </xsl:attribute>
                        <xsl:apply-templates/>
                        
                    </a>
                   
                </xsl:for-each>
                    
                    
                    
                    
            </div>
            <hr class="hr hr-blurry" />     
    </xsl:template>



</xsl:stylesheet>
