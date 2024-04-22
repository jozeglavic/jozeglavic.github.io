<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    Project: GAMS Projekttemplate
    Company: ZIM-ACDH (Zentrum für Informationsmodellierung - Austrian Centre for Digital Humanities)
 -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:i18n="http://apache.org/cocoon/i18n/2.1"
    xmlns:s="http://www.w3.org/2001/sw/DataAccess/rf1/result" xmlns="http://www.w3.org/1999/xhtml"
    xmlns:t="http://www.tei-c.org/ns/1.0" xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/"
    xmlns:dc="http://purl.org/dc/elements/1.1/" exclude-result-prefixes="#all">

    <!--<xsl:output method="xml" doctype-system="about:legacy-compat" encoding="UTF-8" indent="no"/>-->


    <xsl:include href="tpcl-static.xsl"/>

    <xsl:template name="content">

        <section class="row ">
            <article class="col-md-12">
               
                    <xsl:call-template name="contexts"/>
                
            </article>            
        </section>


    </xsl:template>

    <xsl:template name="contexts">


        <xsl:if test="$mode=''">             
                    <div class="card">
                        <div class="card-body" style="text-align: justify;">
                            <h3>Doborodšli</h3>
                            <p>Stran pred vami je digitalna reprezentacija fizičnega arhivskega gradiva - korespondence družine Terpinc. Samo arhivsko gradivo se hrani v Zgodovinskem arhivu Ljubljana (del fonda SI_ZAL_LJU/0296, Graščina Fužine, Ljubljana 1616-1925), spletna izdaja pred vami, pa je poskus predstavitve korespondence na spletu. Namen izdaje ni samo omogočiti lažji in širši dostop do vsebine pisem, ampak tudi ponuditi pisma v širšem zgodovinskem kontekstu časa in prostora zainteresirani publiki. Dodatne informacije in metapodatki so namenjene tako ključnemu mimoidočemu kot tudi raziskovalcem, njihov namen pa je pomoč pri razumevanju vsebine pisem.</p>
                        </div> 
                    </div>
                    <div class="row d-flex justify-content-center py-4">
                        <div class="col align-self-center">
                        <div class="px-0 card-body text-center"> <!-- Added text-center class -->
                    <a href="/archive/objects/context:{$projectAbbr}/methods/sdef:Context/get?mode=list_letters">
                        <img src="{$gamsdev}/{$projectAbbr}/img/pisma_thumbnail.jpg" class="img-fluid" />
                        <h3 class="card-title" style="color: white; background-color: #5B8CB2;">Pisma</h3>
                    </a>
                        </div>
                        </div>
                    </div>          
                    <div class="row d-flex justify-content-center">
                    <div class="col-6">
                        <div class="px-0 card-body py-4 text-center">
                            <a href="/o:{$projectAbbr}.persName">
                        <img src="{$projectRootPath}/img/druzina_cesko.jpg" class="img-fluid"/>
                        <h3 class="card-title" style="color: white; background-color: #5B8CB2;">Osebe</h3>
                    </a>
                        </div>
                    </div>
                    <div class="col-6">                 
                        <div class="px-0 card-body py-4 text-center">
                            <a href="/o:{$projectAbbr}.placeName">
                        <img src="{$projectRootPath}/img/lokacija_thumbnail.jpg" class="img-fluid"/>
                        <h3 class="card-title" style="color: white; background-color: #5B8CB2;">Lokacije</h3>
                    </a>
                            
                            
                            <!-- 
                            
                            <div class="col-6">
                        <div class="px-0 card-body py-4 text-center">
                    <a href="/archive/objects/context:{$projectAbbr}/methods/sdef:Context/get?mode=osebe">
                        <img src="{$projectRootPath}/img/druzina_cesko.jpg" class="img-fluid"/>
                        <h3 class="card-title" style="color: white; background-color: #5B8CB2;">Osebe</h3>
                    </a>
                        </div>
                    </div>
                            
                            
                            
                            
                            -->
    </div>
</div>

                </div>                      
        </xsl:if>
              
        
        <xsl:if test="$mode='collection'">
            <div id="MainMenu" class="card">
            <div class="card-body">
                <h3>Sammlungsbereiche</h3>
                <a href="#demo1" class="list-group-item" data-toggle="collapse" data-parent="#MainMenu"><span class="glyphicon glyphicon-chevron-down chevron-down-context"><xsl:text> </xsl:text></span><span
                        class="context-item-number">22</span>Item 1</a>
                <div id="demo1" class="sublinks collapse">
                    <a href="#SubMenu1" class="list-group-item small" data-toggle="collapse" data-parent="#SubMenu1"><span class="glyphicon glyphicon-chevron-down chevron-down-context"><xsl:text> </xsl:text></span>Subitem 1</a>
                    <div class="collapse list-group-submenu" id="SubMenu1">
                        <a href="#" class="list-group-item small" data-parent="#SubMenu1">Subitem 1 a</a>
                        <a href="#" class="list-group-item small" data-parent="#SubMenu1">Subitem 2 b</a>
                    </div>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                </div>
                <a href="#demo2" class="list-group-item" data-toggle="collapse"
                    data-parent="#MainMenu"><span class="glyphicon glyphicon-chevron-down chevron-down-context"><xsl:text> </xsl:text></span><span class="context-item-number">44</span>Item
                    2</a>
                <div id="demo2" class="sublinks collapse">
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                </div>
                <a href="#" class="list-group-item"><span class="glyphicon glyphicon-chevron-down chevron-down-context"><xsl:text> </xsl:text></span><span class="context-item-number"
                        >0</span>Item 3</a>
                <a href="#demo3" class="list-group-item" data-toggle="collapse"
                    data-parent="#MainMenu"><span class="glyphicon glyphicon-chevron-down chevron-down-context"><xsl:text> </xsl:text></span><span class="context-item-number">22</span>Item
                    4</a>
                <div id="demo3" class="sublinks collapse">
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                </div>
                <a href="#demo4" class="list-group-item" data-toggle="collapse"
                    data-parent="#MainMenu"><span class="glyphicon glyphicon-chevron-down chevron-down-context"><xsl:text> </xsl:text></span><span class="context-item-number">22</span>Item
                    5</a>
                <div id="demo4" class="sublinks collapse">
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                </div>
            </div>
        </div>
        </xsl:if>
     



        <!--<ul class="nav nav-list accordion" id="sidenav-accordion">
            <div style="width: 303px; height:500px">
                <li class="accordion-heading">
                    <a data-toggle="collapse" data-target="#content-area1">Context</a>
                    <!-\- data-target: verweist auf Aufklappbereich; = ID -\->
                    <ul style="overflow-y: scroll; min-height: 200px; max-height: 200px;"
                        class="nav nav-list collapse" id="content-area1" data-toggle="collapse">
                        <!-\- min-height & max-height: fixiert die Box mit der Scrollbar -\->
                        <li>
                            <a href="#" title="Title">Context2</a>
                        </li>
                        <li>
                            <a href="#" title="Title">Context2</a>
                        </li>
                    </ul>
                </li>
                <li class="accordion-heading">
                    <a data-toggle="collapse" data-target="#content-area2">Context</a>
                    <ul style="overflow-y:scroll; min-height: 200px; max-height: 200px;"
                        class="nav nav-list collapse" id="content-area2">
                        <li>
                            <a data-toggle="collapse" data-target="#content-area3">Context2</a>
                            <ul data-toggle="collapse" class="nav nav-list collapse"
                                id="content-area3">
                                <li>
                                    <a href="#" title="Title">Context3</a>
                                </li>
                                <li>
                                    <a href="#" title="Title">Context3</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a data-toggle="collapse" data-target="#content-area4">2.3</a>
                            <ul data-toggle="collaps.in" class="nav nav-list collapse"
                                id="content-area4">
                                <li>
                                    <a href="#" title="Title">2.3.1</a>
                                </li>
                                <li>
                                    <a href="#" title="Title">2.3.2</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a data-toggle="collapse" data-target="#content-area5">2.4</a>
                            <ul data-toggle="collapse" class="nav nav-list collapse"
                                id="content-area5">

                                <li>
                                    <a href="#" title="Title">2.4.3</a>
                                </li>
                                <li>
                                    <a href="#" title="Title">2.4.4</a>
                                </li>
                                <li>
                                    <a href="#" title="Title">2.4.5</a>
                                </li>
                                <li>
                                    <a href="#" title="Title">2.4.6</a>
                                </li>
                                <li>
                                    <a href="#" title="Title">2.4.7</a>
                                </li>
                                <li>
                                    <a href="#" title="Title">2.4.8</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>
            </div>
        </ul>-->
        <!--   </div>
        </article>-->
    </xsl:template>


    <xsl:template name="results">
        
        <!-- <h3><xsl:value-of select="/s:sparql/s:results/s:result[1]/s:container"/></h3>-->
        <h3>Seznam pisem družine Trepinc</h3>
        <p>Tu je objavljen seznam pisem s povezavam do transkripcij in digitalnih faksimilov. Seznam vsebuje vsa vključena pisma. Pisma so poimenovana glede na arhivsko signaturo, hkrati pa je priložena tudi predogledna sličica. S klikom na povezavo se odpre posamično pismo.</p>
        <p>Posamično pismo vsebuje na začetku metapodatke o pošiljatelju in prejemniku, na desni strani je v tekstovni obliki predstavljena transkripcija pisma po posamični strani. Poleg tega vsebuje tudi označbe krajev imen v posebnih barvah za lažje razpoznavanje. Označene so tudi ostale posebnosti pisma kot so pozdravna in poslovilna vrstica, datumska vrstica ter okrajšave in napake. Na desni strani je izpostavljen pregledovalnik digitalnih faksimilov pisma.</p>
        <p>Glede zbirke: V fondu SI_ZAL_LJU/0296 Graščine Fužine (1616-1925) se hrani 319 pisem in 2 potovalna dnevnik korespondence družine Terpinc. Večino korespondence je pisana v stari gotici in nemškem jeziku. Zaradi obsežnosti je korespondenca vsebinsko razdeljena na družinsko (primarno) in ostalo (sekundarno). Primarna je pomembnejša, ker je nastala znotraj (sorodstveno) tesneje povezanega kroga ljudi, v ospredju pa so način komunikacije, teme »pogovorov« in osebnostne značilnosti ter nagnjenja posameznikov, ki so na ta način jasneje in bolj osebno predstavljeni. Sekundarna korespondenca (pisma prijateljev in znancev) je časovno bolj razpršena, saj obsega daljše obdobje (1823–1875), pogosto nima »rdeče niti« pogovorov oz. dogodkov, korespondenti pa so med seboj v različno intenzivnih stikih. Ta pisma bodo počakala na objavo v prihodnje.</p>
        <p>Pisma so v fondu razdeljena v ovoje, ki so nastali na podlagi razmerja korespondentov pošiljatelj-prejemnik. Skupno je 12 ovojev označenih z rimsko številko.</p>
        <p>Zbirka se sproti dopolnjuje, trenutno je stanje objav sledeče:</p>
        
        <div>
            <table style="width: 100%; border-collapse: collapse;">
                <thead>
                    <tr>
                        <th style="border: 1px solid black; padding: 8px; background-color: #f2f2f2;">Ovoj</th>
                        <th style="border: 1px solid black; padding: 8px; background-color: #f2f2f2;">Objavljeno</th>
                        <th style="border: 1px solid black; padding: 8px; background-color: #f2f2f2;">Korespondenti</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td style="border: 1px solid black; padding: 8px;">Ovoj I</td>
                        <td style="border: 1px solid black; padding: 8px;">28/86</td>
                        <td style="border: 1px solid black; padding: 8px;">Fidelij Trepinz - Jožefina Terpinc r. Češko</td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid black; padding: 8px;">Ovoj II</td>
                        <td style="border: 1px solid black; padding: 8px;">0/71</td>
                        <td style="border: 1px solid black; padding: 8px;">Valentin Češko - Fidelij Terpinc</td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid black; padding: 8px;">Ovoj III</td>
                        <td style="border: 1px solid black; padding: 8px;">0/27</td>
                        <td style="border: 1px solid black; padding: 8px;">Franc Češko - Jožefina Terpinc r. Češko</td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid black; padding: 8px;">Ovoj IV</td>
                        <td style="border: 1px solid black; padding: 8px;">0/3</td>
                        <td style="border: 1px solid black; padding: 8px;">Janez Terpinc - zakoncem Trepinz</td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid black; padding: 8px;">Ovoj V</td>
                        <td style="border: 1px solid black; padding: 8px;">0/7</td>
                        <td style="border: 1px solid black; padding: 8px;">Blaž Terpinc - Fidelij Trepinz</td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid black; padding: 8px;">Ovoj VI</td>
                        <td style="border: 1px solid black; padding: 8px;">0/15</td>
                        <td style="border: 1px solid black; padding: 8px;">Fidelijevi prijatelji - Fidelij Trepinz</td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid black; padding: 8px;">Ovoj VII</td>
                        <td style="border: 1px solid black; padding: 8px;">0/8</td>
                        <td style="border: 1px solid black; padding: 8px;">Miha Pregel - Fidelij Trepinz</td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid black; padding: 8px;">Ovoj VIII</td>
                        <td style="border: 1px solid black; padding: 8px;">0/4</td>
                        <td style="border: 1px solid black; padding: 8px;">Alojzij Offner - Jožefina Terpinc r. Češko</td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid black; padding: 8px;">Ovoj IX</td>
                        <td style="border: 1px solid black; padding: 8px;">0/12</td>
                        <td style="border: 1px solid black; padding: 8px;">B. Fende - zakonca Trepinz</td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid black; padding: 8px;">Ovoj X</td>
                        <td style="border: 1px solid black; padding: 8px;">0/13</td>
                        <td style="border: 1px solid black; padding: 8px;">Janez N. Urbančič in njegova žena Josipina - Jožefina Terpinc r. Češko</td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid black; padding: 8px;">Ovoj XI</td>
                        <td style="border: 1px solid black; padding: 8px;">0/73</td>
                        <td style="border: 1px solid black; padding: 8px;">Jožefinini prijatelji - Jožefina Terpinc r. Češko</td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid black; padding: 8px;">Ovoj XII</td>
                        <td style="border: 1px solid black; padding: 8px;">0/9</td>
                        <td style="border: 1px solid black; padding: 8px;">Fidelij Trepinz - Tomanu</td>
                    </tr>
                </tbody>                
            </table>
        
            
            
        </div>
        <hr class="hr hr-blurry"/>
        <p>Število najdenih vnosov: <xsl:value-of select="count(s:sparql/s:results/s:result)"
            /></p>
        
        
        <xsl:for-each select="s:sparql/s:results/s:result">
           
                <li>
                    <xsl:choose>
                        <xsl:when test="position() mod 2 = 0">
                            <xsl:attribute name="class">
                                <xsl:text>results odd</xsl:text>
                            </xsl:attribute>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:attribute name="class">
                                <xsl:text>results even</xsl:text>
                            </xsl:attribute>
                        </xsl:otherwise>
                    </xsl:choose>
                    <a>
                        <xsl:attribute name="href">
                            <xsl:value-of select="concat('/', ./s:identifier)"/>
                        </xsl:attribute>
                        <img width="100" height="80" class="results">
                            <xsl:attribute name="src">
                                <xsl:value-of select="concat('/', ./s:identifier, '/THUMBNAIL')"/>
                            </xsl:attribute>
                        </img>
                    </a>
                    <span class="results">
                        <a>
                            <xsl:attribute name="href">
                                <xsl:value-of select="concat('/', ./s:identifier)"/>
                            </xsl:attribute>
                            
                            
                            <xsl:value-of select="substring-before(./s:title, ',')" />
                            <xsl:text>, </xsl:text>
                            <strong><span style="color: blue;"><xsl:value-of select="substring-before(substring-after(./s:title, ', '), ' ->')" /></span></strong>
                            <xsl:text> (</xsl:text>
                            <em><xsl:value-of select="substring-before(substring-after(./s:title, '-> '), '(')" /></em>
                            <xsl:text>) </xsl:text>
                            <em><xsl:value-of select="substring-before(substring-after(./s:title, '('), ')')" /></em>
                            
                          
                        </a>
                    </span>
                    <br/>
                    <span class="permalink">
                        <a>
                            <xsl:attribute name="href">
                                <xsl:value-of select="concat('/', ./s:identifier)"/>
                            </xsl:attribute>
                            <xsl:text>Permalink: </xsl:text><xsl:value-of select="concat('/', ./s:identifier)"/>
                        </a>
                    </span>
                    <span class="icon-span">
                        <a target="_blank">
                            <xsl:attribute name="href">
                                <xsl:value-of select="concat('/', ./s:identifier, '/TEI_SOURCE')"/>
                            </xsl:attribute>
                            <img src="{$gamsAssetsRootPath}/img/tei_icon.jpg" height="18" alt="TEI-Dokument" title="TEI-Dokument"/>
                        </a>
                    </span>
                </li>
            
        </xsl:for-each>
        
    </xsl:template>

</xsl:stylesheet>
