<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    Project: GAMS Projekttemplate
    Company: ZIM-ACDH (Zentrum für Informationsmodellierung - Austrian Centre for Digital Humanities)
    Author: Hans Clausen, Gerlinde Schneider, Martina Scholger, Christian Steiner, Elisabeth Steiner, Sebastian Stoff
    Last update: 2020 (Update gamsJS)
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
	xmlns:i18n="http://apache.org/cocoon/i18n/2.1"
	xmlns:s="http://www.w3.org/2001/sw/DataAccess/rf1/result" xmlns="http://www.w3.org/1999/xhtml"
	xmlns:t="http://www.tei-c.org/ns/1.0" xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/"
	xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:lido="http://www.lido-schema.org"
	xmlns:bibtex="http://bibtexml.sf.net/" exclude-result-prefixes="#all">
	<!--<xsl:output method="xml" doctype-system="about:legacy-compat" encoding="UTF-8" indent="no"/>-->
	<!-- häufig verwendete variablen... -->
	<xsl:param name="mode"/>
	<xsl:param name="search"/>
	<xsl:variable name="model"
		select="substring-after(/s:sparql/s:results/s:result/s:model/@uri, '/')"/>
		<xsl:variable name="cid">
			<!-- das ist der pid des contextes, kommt aus dem sparql (ggfs. query anpassen) - wenn keine objekte zugeordnet sind, gibt es ihn nicht! -->
			<xsl:value-of select="/s:sparql/s:results/s:result[1]/s:cid"/>
		</xsl:variable>
		<xsl:variable name="teipid">
			<xsl:value-of select="//t:idno[@type = 'PID']"/>
		</xsl:variable>
		<xsl:variable name="lidopid">
			<xsl:value-of select="//lido:lidoRecID"/>
		</xsl:variable>
		<!--variablen für Suchergebnisse-->
		<xsl:variable name="query" select="sparql/head/query"/>
		<xsl:variable name="hitTotal" select="/sparql/head/hitTotal"/>
		<xsl:variable name="hitPageStart" select="/sparql/head/hitPageStart"/>
		<xsl:variable name="hitPageSize" select="/sparql/head/hitPageSize"/>
		<xsl:variable name="hitsFrom" select="sparql/navigation/hits/from"/>
		<xsl:variable name="hitsTo" select="sparql/navigation/hits/to"/>
		<!-- GAMS global variables -->
		<xsl:variable name="zim">Zentrum für Informationsmodellierung - Austrian Centre for Digital
			Humanities</xsl:variable>
			<xsl:variable name="zim-acdh">ZIM-ACDH</xsl:variable>
			<xsl:variable name="gams">Geisteswissenschaftliches Asset Management System</xsl:variable>
			<xsl:variable name="uniGraz">Universität Graz</xsl:variable>
	<!-- ***
		*********
		project-specific variables
		*********
		*** -->
		<doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
			<desc>tpcl</desc>
		</doc>
		<xsl:variable name="gamsdev"><xsl:text>https://jozeglavic.github.io</xsl:text></xsl:variable>
		<xsl:variable name="projectAbbr">tpcl</xsl:variable>
		<xsl:variable name="projectRootPath" select="concat($gamsdev, '/',$projectAbbr)"/>
		<doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
			<desc>C:/Users/Cookie/gams-local/gams-data/apache/tpcl</desc>
		</doc>
		<xsl:variable name="gamsAssetsRootPath" select="concat($gamsdev, '/assets')"/>
		<xsl:variable name="projectTitle">
			<xsl:text>Korespondenca Jožefine in Fidelija Terpinc (1823-1875)</xsl:text>
		</xsl:variable>
		<xsl:variable name="subTitle">
			<xsl:text>Digitalna izdaja pisem Zgodovinskega arhiva Ljubljana</xsl:text>
		</xsl:variable>
		<!-- gesamtes css ist in dieser Datei zusammengefasst mit Ausnahme der Navigation -->
		<xsl:variable name="projectCss">
			<xsl:value-of select="concat($projectRootPath, '/css/', $projectAbbr, '.css')"/>
		</xsl:variable>
		<!--css für die navigation-->
		<xsl:variable name="projectNav">
			<xsl:value-of select="concat($projectRootPath, '/css/navbar.css')"/>
		</xsl:variable>
		<!--xsl für die suchansicht-->
		<xsl:variable name="searchXsl">
			<xsl:value-of select="concat($projectRootPath, '/', $projectAbbr, '-search.xsl')"
				/>
			</xsl:variable>
			<xsl:template match="/">
				<html lang="de">
					<head>
						<meta charset="utf-8"/>
						<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
						<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
						<meta name="description" content=""/>
						<!-- Projektbeschreibung eingeben -->
						<!-- evtl. noch mehr Meta Tags aus Dublin Core, schema.org oder Open Graph -->
						<meta name="publisher"
							content="Zentrum für Informationsmodellierung - Austrian Centre for Digital Humanities"/>
							<meta name="content-language" content="de"/>
							<!--Projekttitel-->
							<title>
								<xsl:value-of select="$projectTitle"/>
							</title>
							<!-- Bootstrap core CSS -->
							<link href="{$gamsAssetsRootPath}/lib/bootstrap/bootstrap-5.0.2-dist/css/bootstrap.min.css" rel="stylesheet"/>
							<!-- CSS only of fontawesome / currently on version 6 /  -->
							<link href="{$gamsAssetsRootPath}/lib/fa/all.min.css" rel="stylesheet"/>
							<!-- Custom styles for this template -->
							<link href="{$projectCss}" rel="stylesheet" type="text/css"/>
							<link href="{$projectNav}" rel="stylesheet" type="text/css"/>
							<!-- jQuery core JavaScript ================================================== -->
							<script type="text/javascript" src="{$gamsAssetsRootPath}/lib/jquery/jquery-3.6.0.min.js"><xsl:text> </xsl:text></script>
							<!-- Bootstrap core JavaScript ================================================== -->
							<script type="text/javascript" src="{$gamsAssetsRootPath}/lib/bootstrap/bootstrap-5.0.2-dist/js/bootstrap.bundle.min.js"><xsl:text> </xsl:text></script>
				<!-- 
					GamsJs inclusion  
				-->
				<script src="{$gamsAssetsRootPath}/lib/gamsJS/1.x/gams.js" type="text/javascript"><xsl:text> </xsl:text></script>
			</head>
			<body>
				<header>
					<div class="container">
						<div class="row flex">
							<div class="col-10">
								<h1>
									<xsl:value-of select="$projectTitle"/>
								</h1>
								<h2>
									<xsl:value-of select="$subTitle"/>
								</h2>
							</div>
							<div class="col-2">
								<!-- 1 statt 4 -->
							</div>
						</div>
					</div>
				</header>
				<nav class="navbar navbar-expand-md navbar-dark sticky-top">
					<div class="container">
						<a class="navbar-brand d-md-none" href="#">Navigation</a>
						<button class="navbar-toggler" type="button" data-toggle="collapse"
							data-target="#navbarCollapse" aria-controls="navbarCollapse"
							aria-expanded="false" aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"><xsl:text> </xsl:text></span>
						</button>
						<div id="navbarCollapse" class="collapse navbar-collapse">
							<ul class="navbar-nav mr-auto">
								<li class="nav-item">
									<xsl:if test="$mode = ''">
										<xsl:attribute name="class">nav-item active</xsl:attribute>
									</xsl:if>
									<a class="nav-link"
										href="/context:{$projectAbbr}"
										>Domov <span class="sr-only">(current)</span>
									</a>
								</li>
								<li class="nav-item">
									<xsl:if test="$mode = 'project'">
										<xsl:attribute name="class">nav-item active</xsl:attribute>
									</xsl:if>
									<a class="nav-link"
										href="/archive/objects/context:{$projectAbbr}/methods/sdef:Context/get?mode=project"
										>O projektu</a>
									</li>															
									<li class="nav-item">
										<xsl:if test="$mode = 'list_letters'">
											<xsl:attribute name="class">nav-item active</xsl:attribute>
										</xsl:if>
										<a class="nav-link"
											href="/archive/objects/context:{$projectAbbr}/methods/sdef:Context/get?mode=list_letters"
											>Pisma</a>
										</li>
										<li class="nav-item">	
											<xsl:if test="$mode = 'osebe'">
												<xsl:attribute name="class">nav-item active</xsl:attribute>
											</xsl:if>								
											<a class="nav-link"
												href="/o:{$projectAbbr}.persName"
												>Osebe</a>
											</li>
											<li class="nav-item">	
												<xsl:if test="$mode = 'kraji'">
													<xsl:attribute name="class">nav-item active</xsl:attribute>
												</xsl:if>
												<a class="nav-link"
													href="/o:{$projectAbbr}.placeName"
													>Lokacije</a>
												</li>
								<!--<li class="nav-item">
									<xsl:if test="$mode = (concat('context:', $projectAbbr))">
										<xsl:attribute name="class">nav-item active</xsl:attribute>
									</xsl:if>
									<a class="nav-link"
										href="/o:tpcl.1"
										>primer pisma</a>
										
										<li class="nav-item">	
												<xsl:if test="$mode = 'kraji'">
													<xsl:attribute name="class">nav-item active</xsl:attribute>
												</xsl:if>
												<a class="nav-link"
													href="/archive/objects/context:{$projectAbbr}/methods/sdef:Context/get?mode=kraji"
													>Lokacije</a>
												</li>
									</li>	-->
								</ul>						
							</div>
							<!-- /.navbar-collapse -->
						</div>
						<!-- /.container -->
					</nav>
					<main class="container">
						<xsl:choose>
						<!-- <xsl:when test="$mode = ''">
							<!-/- einstiegsseite für projektkontext -/->
							<section class="row">
								<article class="col-md-5">
									<div class="card" data-mh="group1">
										<div class="card-body">
											<blockquote class="card-blockquote">
												<h3>Lorem 222Ipsum</h3>
												<h4>Lorem Ipsum dolor sit amet</h4>
												<p> Lorem ipsum dolor sit amet, consetetur
												sadipscing elitr, sed diam nonumy eirmod tempor
												invidunt ut labore et dolore magna aliquyam erat,
												sed diam voluptua. At vero eos et accusam et justo
												duo dolores et ea rebum. Stet clita kasd
												gubergren, no sea takimata sanctus est Lorem ipsum
												dolor sit amet. </p>
												<p> Duis autem vel eum iriure dolor in hendrerit in
												vulputate velit esse molestie consequat, vel illum
												dolore eu feugiat nulla facilisis at vero eros et
												accumsan et iusto odio dignissim qui blandit
												praesent luptatum zzril delenit augue duis dolore
												te feugait nulla facilisi. Lorem ipsum dolor sit
												amet, consectetuer adipiscing elit, sed diam
												nonummy nibh euismod tincidunt ut laoreet dolore
												magna aliquam erat volutpat. </p>
											</blockquote>
										</div>
									</div>
								</article>
								<article class="col-md-4">
									<div class="card" data-mh="group1">
										<div class="card-body">
											<blockquote class="card-blockquote">
												<h3>Lorem Ipsum</h3>
												<h4>Lorem Ipsum dolor sit amet</h4>
												<p> Lorem ipsum dolor sit amet, consetetur
												sadipscing elitr, sed diam nonumy eirmod tempor
												invidunt ut labore et dolore magna aliquyam erat,
												sed diam voluptua. At vero eos et accusam et justo
												duo dolores et ea rebum. Stet clita kasd
												gubergren, no sea takimata sanctus est Lorem ipsum
												dolor sit amet. Lorem ipsum dolor sit amet,
												consetetur sadipscing elitr, sed diam nonumy
												eirmod tempor invidunt ut labore et dolore magna
												aliquyam erat, sed diam voluptua. At vero eos et
												accusam et justo duo dolores et ea rebum. Stet
												clita kasd gubergren, no sea takimata sanctus est
												Lorem ipsum dolor sit amet. Lorem ipsum dolor sit
												amet, consetetur sadipscing elitr, sed diam nonumy
												eirmod tempor invidunt ut labore et dolore magna
												aliquyam erat, sed diam voluptua. At vero eos et
												accusam et justo duo dolores et ea rebum. Stet
												clita kasd gubergren, no sea takimata sanctus est
												Lorem ipsum dolor sit amet. </p>
											</blockquote>
										</div>
									</div>
								</article>
								<article class="col-md-3">
									<!-/- card mit image verbessern -/->
									<div class="card">
										<img class="card-img-top" src="{$gamsAssetsRootPath}/img/4-esel.jpg"
											alt="Card image cap"/>
										<div class="card-body">
											<h4 class="card-title">Card title</h4>
											<p class="card-text">Some quick example text to build on
												the card title and make up the bulk of the card's
												content.</p>
											<a href="#!" class="btn btn-dark">Go somewhere</a>
										</div>
									</div>
								</article>
							</section>
							<section class="row">
								<article class="col-md-10">
									<div class="card" data-mh="group2">
										<div class="card-body">
											<blockquote class="card-blockquote">
												<p>Lorem ipsum dolor sit amet, consectetur
												adipiscing elit. Integer posuere erat a ante.</p>
											</blockquote>
										</div>
									</div>
								</article>
								<article class="col-md-2">
									<div class="card" data-mh="group2">
										<div class="card-body">
											<blockquote class="card-blockquote">
												<p>Lorem ipsum dolor sit amet, consectetur
												adipiscing elit. Integer posuere erat a ante.</p>
											</blockquote>
										</div>
									</div>
								</article>
							</section>
							<section class="row">
								<article class="col-md-6">
									<div class="card" data-mh="group3">
										<div class="card-body">
											<blockquote class="card-blockquote">
												<h3>Tester</h3>
												<h4>Testo</h4>
												<p>Testi</p>
											</blockquote>
										</div>
									</div>
								</article>
								<article class="col-md-6">
									<!-/- carousel und card einbauen -/->
									<div class="card" data-mh="group3">
										<div id="carouselExampleIndicators" class="carousel slide"
											data-ride="carousel">
											<ol class="carousel-indicators">
												<li data-target="#carouselExampleIndicators"
												data-slide-to="0" class="active"/>
												<li data-target="#carouselExampleIndicators"
												data-slide-to="1"/>
											</ol>
											<div class="carousel-inner" role="listbox">
												<div class="carousel-item active">
												<img class="d-block w-100"
												src="/assets/img/4-esel.jpg"
												data-src="holder.js/900x400?theme=social"
												alt="First slide"/>
												</div>
												<div class="carousel-item">
												<img class="d-block w-100"
												src="/assets/img/4-esel.jpg"
												data-src="holder.js/900x400?theme=industrial"
												alt="Second slide"/>
												</div>
											</div>
											<a class="carousel-control-prev"
												href="#carouselExampleIndicators" role="button"
												data-slide="prev">
												<span class="carousel-control-prev-icon"
												aria-hidden="true"/>
												<span class="sr-only">Previous</span>
											</a>
											<a class="carousel-control-next"
												href="#carouselExampleIndicators" role="button"
												data-slide="next">
												<span class="carousel-control-next-icon"
												aria-hidden="true"/>
												<span class="sr-only">Next</span>
											</a>
										</div>
										<div class="card-body">
											<h4 class="card-title">Card title</h4>
											<p class="card-text">Some quick example text to build on
												the card title and make up the bulk of the card's
												content.</p>
											<a href="#!" class="btn btn-dark">Go somewhere</a>
										</div>
									</div>
								</article>
							</section>
						</xsl:when>-->
						<xsl:when test="$mode = 'imprint'">
							<!-- impressum, liegt in einem TEI-Datenstrom auf Projektkontext, auch für andere statische datenströme wie about, einleitung, etc. -->
							<section class="row">
								<article class="col-md-12">
									<div class="card mb-3 text-center border-dark">
										<div class="card-body">
											<xsl:apply-templates
												select="document(concat('/context:', $projectAbbr, '/IMPRINT'))/t:TEI/t:text/t:body/t:div"
												/>
											</div>
										</div>
									</article>
								</section>
							</xsl:when>
							<xsl:when test="$mode = 'searchHelp'">
								<!-- Hilfe für die Suche, liegt in einem TEI-Datenstrom auf Projektkontext, auch für andere statische datenströme wie about, einleitung, etc. -->
								<section class="row">
									<article class="col-md-12">
										<div class="card">
											<div class="card-body">
												<xsl:apply-templates
													select="document(concat('/context:', $projectAbbr, '/SEARCH_HELP'))/t:TEI/t:text/t:body/t:div"
													/>
												</div>
											</div>
										</article>
									</section>
								</xsl:when>
								<xsl:when test="$mode = 'project'">
									<section class="row">
										<article class="col-md-4 area_navigator d-md-block">
											<div class="card sticky-contents">
												<div class="card-body">
													<h2>Projekt</h2>
													<ul class="toc">
														<li><a href="project">O projektu</a></li>
														<li><a href="#materials">O gradivu</a></li>														
														<li><a href="#goal">Cilji projekta</a></li>
														<li><a href="#workflow">Delovni proces</a></li>
													</ul>
												</div>
											</div>
										</article>
										<article class="col-md-8">
											<div class="card" data-mh="group1">
												<div class="card-body">
													<div id="project">	
														<h3>O projektu</h3>
														<p>Sam projekt je bil izdelan v okviru izdelave zaključne naloge magisterska študija digitalne humanistike na Karl-Franzens-Universität Graz (Avstrija). Avtor, Jože Glavič, sem poleg same teoretičnega pisnega dela magistrske naloge poskrbel tudi za praktični del - ta vsebuje idelavo xml datotek pisem, izdelavo modela za transkribiranje v orodju Transkribus, xslt pretvorbo pisem za objavo v okviru GAMS infrastrukture. Poleg tega pa tudi prilagoditev in izdelavo spletne strani na podlagi GAMS predlog. Več o postopku pod poglavjem <a href="#workflow">"Delovni proces"</a>. Naloga je bila izvedena pod mentorstvom Univ.-Prof. Dr.phil. M.A. Georg Vogelerja (Institut Zentrum für Informationsmodellierung - Austrian Centre for Digital Humanities). Trenutno je objavljeno le del pisem. Korpus pisem se bo postopoma dopolnjeval.														
													</p>
												</div>	
												<div id="materials">	
													<h3>O gradivu</h3>												
													<p> <a href="https://www.zal-lj.si/">Zgodovinski arhiv Ljubljana</a> hrani fond Graščine Fužine (SI_ZAL_LJU/0296 (1616-1925); nemško Herrschaft Fužine). Del tega fonda je korespondenca članov družine Terpinc in njihovega družabnega kroga. Zbirka 319 pisem in 2 potovalnih dnevnikov iz 19. stoletja, je bila ob drugi svetovni vojni razbita in raztresena, ponovno pa je bila po združena s strani arhiva. Pisemska zbirka je datirana med letoma 1825-1858, pisana v stari gotici in nemškem jeziku. Kot primarni zgodovinski viri zbirka pokriva lokalno zgodovino mesta Ljubljana sredi 19. stoletja. Večina pisem je korespondenca med zakoncema Fidelijem in Josephino Terpinc (rojena Češko).</p>
													<p>Korespondenca je bila že fizično objavljena v (<a href="http://www.arhivsko-drustvo.si/wp-content/uploads/2019/01/Viri-št.-41.pdf">Viri št. 41</a>). Ta zajema prvi del korespondence, večinoma gre za pisma med zakoncema Terpinc ter sorodniki in prijatelji, le nekaj malega je poslovnih pisem. Glavnina pisem je urejena v škatlah 35 in 35a v 12 ovojih.</p>
													<p>Zaradi obsežnosti je korespondenca vsebinsko razdeljena na družinsko (primarno) in ostalo (sekundarno). Primarna je pomembnejša, ker je nastala znotraj (sorodstveno) tesneje povezanega kroga ljudi, v ospredju pa so način komunikacije, teme »pogovorov« in osebnostne značilnosti ter nagnjenja posameznikov, ki so na ta način jasneje in bolj osebno predstavljeni. Sekundarna korespondenca (pisma prijateljev in znancev) je časovno bolj razpršena, saj obsega daljše obdobje (1823–1875), pogosto nima »rdeče niti« pogovorov oz. dogodkov, korespondenti pa so med seboj v različno intenzivnih stikih. Ta pisma bodo počakala na objavo v prihodnje.</p>
													<p>Transkripcije pisem v publikaciji Viri so označene z zaporednimi številkami, ki se ujemajo z digitalizati originalov na tej spletni strani. Oboji si sledijo kronološko, medtem ko je originalno gradivo v fondu Graščina Fužine urejeno glede na korespondente. Transkripcijo pisme je opravila Nataša Budna Kodrič.</p>
												</div>															
												<div id="goal">	
													<h3>Cilji projekta</h3> 
													<ol>
														<li>
															<h4>Objavljanje arhivskega gradiva</h4>
															<p>
																Zaradi obstoja delne tiskane izdaje pisem se je pojavila ideja o ustvarjanju digitalne različice zbirke pisem.
															</p>
															<p>
																Z ustvarjanjem digitalne izdaje si prizadevamo, da bi arhivsko gradivo postalo širše dostopno raziskovalcem, znanstvenikom, navdušencem in študentom prek novih digitalnih medijev. Novi digitalni mediji v pirmerjavi z tiskano digitalno iizdajo omogočajo, da besedilu  dodamo dodatne interaktivne informacije, ki pomagajo bolje razumeti besedilo v kontesktu današnjega časa (razlaga kratic, informacije o vsebini, definiranje omenjene osebe, opise in določitev krajev z različnimi imeni). Obstaja tudi "problem biti izgubljen v množici". Če arhivsko gradivo ni pravilno opisano in opremljeno z ustreznimi metapodatki, ga je mogoče enostavno spregledati pri iskanju. Lahko celo rečemo, da "ne obstaja". To je način, da pomembnemu gradivu damo več pozornosti.
															</p>
															<p>
																Cilj je uporabniku ponuditi facsimile pisma z transkripcijo opremljenega besedila. S tem ponuditi bralcu dodatne informacije za lažje razumevanje vsebine v okviru zgodovinske razdalje ter pismo predstaviti skozi prizmo časa, prostora in vpletenih ljudi.
															</p>
															<figure class="bg-white p-3 rounded" style="border-left: .25rem solid #f68e9d;">
																<blockquote class="blockquote pb-2 text-center">
																	<p>"Glavni cilj opomb je premostiti zgodovinsko razdaljo med sedanjim bralcem in avtorjem ter prejemniki pisem, da je besedilo razumljivo in berljivo. Opombe se osredotočajo na zapolnitev morebitnih vrzeli v znanju bralcev te izdaje. Pri pisanju opomb smo upoštevali, kaj so naši predhodniki storili s pisem."</p>
																</blockquote>
																<figcaption class="blockquote-footer">
																	Vir: <a href="http://vangoghletters.org/vg/about_5.html">vangoghletters.org</a>
																</figcaption>
															</figure>															
														</li>
														<li>
															<h4>Lažje upravljanje zbirke</h4>
															<p>
																Lažje upravljanje zbirke z lastnostmi, kot so napredno iskanje, opombe, iskanje po korespondenci itd., nudi številne možnosti za napredno in hitrejše obdelovanje pisem ne le za uporabnike, ampak tudi za upravljalca zbirke. To je še posebej pomembno, ko razmišljamo o organiziranju strukture fizičnih pisem. Digitalna različica nam omogoča, da pisma predstavimo bodisi skozi časovnico (od najstarejšega do najnovejšega pisma) ali po korespondentih (pošiljateljev in prejemnikov je več).
															</p>
														</li>
														<li>
															<h4>Povezovanje izdaje pisem</h4>
															<p>
																Uporaba oznake <code>&lt;correspDesc&gt;</code> v kontekstu oblikovanja Correspondence Metadata Interchange Format (CMIF) v okviru  correspSearch lahko zbirki pisem doda dodatno vrednost. Ne samo, da postavljamo pisma v kontekst, ampak jim tudi strukturno uredimo in prikazujemo odnose in povezave med posameznimi pismi. Poleg tega nam omogoča ustvarjanje formata CMIF v prihodnosti, s katerim lahko pisma ene zbirke postavimo v kontekst pisem drugih z uporabo standarda CMIF.
															</p>
														</li>
														<li>
															<h4>Ohranjanje originala</h4>
															<p>
																Če ljudje uporabljajo digitalno izdajo namesto originalnih fizičnih papirjev, se fizični originali manj uporabljajo in stem bolje ohranijo. Manjša fizična uporaba pomeni boljše stanje originala za prihodnost.
															</p>
														</li>
														<li>
															<h4>Dostopnost</h4>
															<p>
																Z digitalno izdajo je gradivo dostopno ves čas (dobesedno 24 ur na dan, 7 dni v tednu). Prav tako lahko več uporabnikov gradivo uporablja istočasno.
															</p>
														</li>
														<li>
															<h4>Dolgoročno ohranjanje</h4>
															<p>
																Z ustvarjanjem digitalne ustrezne kopije originalnega gradiva lahko razmišljamo tudi o dolgoročnem ohranjanju gradiva. Ker papir počasi razpada skozi čas, digitalna kopija tega ne počne. Vedno lahko sledimo logiki: bolje je imeti dva predmeta za ohranjanje kot le enega ali nobenega.
															</p>
														</li>
														<li>
															<h4>Ustvarjanje delovnega postopka za arhiv, vključno z osebjem arhiva</h4>
															<p>
																Ustvarjanje primerjalnega "pilotnega projekta" o tem, kako narediti digitalno izdajo z omejenimi viri v arhivu. Primer delovnega procesa tega projekta je lahko primer za izdelavo nadaljnih izdaj. Primer lahko vsebuje vključitev zaposlenih v arhivsko delovno skupino za pomoč pri prilagajanju gradiv. Na tak način se tudi gradi digitalna kultura v arhivu. Predvsem se deli in ozavešča uporaba možnih odprtokodnih, dostopnih digitalnih orodjih (Transkribus) in ostalih tehnologij (XML, XSLT, HTML ipd.).
															</p>
														</li>
													</ol>
												</div>											
												<div id="workflow">	
													<h3>Delovni postopek</h3>
													<p>Več o samem postopku si lahko preberete tudi v članku <a href="http://www.arhivsko-drustvo.si/wp-content/uploads/2022/01/Arhivi_2021-2_intrenet.pdf">Arhivsko gradivo skozi prizmo digitalnih izdaj – primer izdelave digitalne izdaje Korespondence Jožefine in Fidelija Terpinc (1825–1858)</a>, ki je bil objavljen v glasilu Arhivskega društva in arhivov Slovenije, Arhivi, letnik 44, št. 2.</p>
													<ol>
														<li>
															<h2>Digitalizacija</h2>
															<p>
																Pisma so bila digitalizirana interno v Zgodovinskem arhivu Ljubljana s skenerjem EPSON DS-50000 v formatu .tiff z 300 dpi. Digitalizati so shranjeni v TIFF-formatu, kar je tudi v skladu z aktualnim Pravilnikom o enotnih tehnoloških zahtevah za zajem in hrambo gradiva v digitalni obliki.25 Skupno je nastalo 1.142 TIFF-datotek (eno	pismo ima lahko več strani).
															</p>
														</li>
														<li>
															<h2>Transkripcija</h2>
															<p>
																Ker so pisma napisana v stari gotici (19. stoletje), so bila transkribirana s strani Nataše Budne Kodrič in objavljenja v tiskani izdaji. Transkribirana besedila pisem so bila nato uporabljena za izgradnjo modela HTR z uporabo programske opreme Transkribus (<a href="https://transkribus.eu/Transkribus/">transkribus.eu</a>). Digitalizati in besedila pisem so bila uvožena v program s pripadajočim orodjem za uvoz.
															</p>															
														</li>
														<li>
															<h2>Izvoz pisem v TEI XML</h2>
															<p>
																Transkribus ponuja prilagodljive možnosti izvoza. Glavni možnosti sta "strežniški izvoz" in "izvoz klienta". Obe možnosti ponujata izvoze .pdf, TEI, DOCX, preprosti izvozi TXT. Razlika je v izvozu TEI (kar je bilo pomembno za izvozni proces v tem projektu). "Strežniški izvoz" ne dovoljuje nobenih sprememb nastavitev za izvoz TEI, medtem ko "izvoz klienta" omogoča spremembe oznak območja (določanje, katero območje uporabiti, ali območje, vrstico, besedo ali brez območja) in tudi oznak za prelom vrstice (možnost med oznakama <code>&lt;l&gt;</code> in <code>&lt;lb&gt;</code>). Obstaja tudi možnost, da se ime slike vključi kot atribut xml:id v oznaki <code>&lt;pb&gt;</code>.
															</p>
															<p>
																Pri uporabi "strežniškega izvoza" je orodje za izvoz včasih zagotavljalo nedokončane rezultate (prazne .xml datoteke, razlog, zakaj ni bil odkrit). V projektu je bil izvoz opravljen z možnostjo "izvoz klienta", pismo po pismo s predhodno določenimi možnostmi (Območje na vrstico; Imena slik kot atribut <code>&lt;pb&gt;</code> xml:id; Prekinitve vrstic <code>&lt;lb&gt;</code>).
															</p>
														</li>
														<li>
															<h2>Prilagoditev izvoženih XML datotek</h2>
															<p>
																Izvoženi .xml je bil skladen s TEI, vendar je bilo potrebno nekaj prilagoditev za pridobitev želene oblike.
															</p>
															<p>
																Bil je ustvarjen xml_modification.xsl za uporabo transformacije XSLT. 
															</p>
															<p>
																Glavne prilagoditve xml_modification.xsl so:
															</p>
															<ul>
																<li>Vstavljanje pripravljenega zunanje glave ("header") v vsako pismo s podatki <code>&lt;fileDesc&gt;</code> in <code>&lt;profileDesc&gt;</code> (informacije, ki so enake za vsako pismo)</li>
																<li>Dodajanje oznak <code>&lt;div type=”letter”&gt;</code> in <code>&lt;p&gt;</code> za predstavitev oblike pisma</li>
																<li>Odstranjevanje ponavljajočega se <code>&lt;facsimile tag&gt;</code> in kopiranje njegovega atributa xml:id v oznako <code>&lt;surface&gt;</code> za vsako .jpg datoteko</li>
															</ul>
														</li>
														<li>
															<h2>Ročno označevanje (annotating)</h2>
															<p>
																Kot primer dobrih praks so se pregledale sledeče edicije:
																<ul>
																	<li><a href="https://ride.i-d-e.de/issues/issue-10/">ride.i-d-e.de</a></li>
																	<li><a href="https://encoding-correspondence.bbaw.de/v1/">encoding-correspondence.bbaw.de</a></li>
																	<li><a href="https://journals.openedition.org/jtei/1742">journals.openedition.org</a></li>
																	<li><a href="http://vangoghletters.org">vangoghletters.org</a></li>
																	<li><a href="https://edition-humboldt.de/">edition-humboldt.de</a></li>
																	<li><a href="https://www.jeanpaul-edition.de/">jeanpaul-edition.de</a></li>
																</ul>
															</p>
															<p>
																Bil je ustvarjen samostojen dokument (Annotation.docx) kot interne smernice. V dokumentu so opisane glavne uporabljene oznake, primeri in pravila za njihovo uporabo.
															</p>															
														</li>
														<li>
															<h2>Objava</h2>
															<p>
																Edicija je objavljena v okviru infrastrukture <a href="https://gams.uni-graz.at/">GAMS</a>. Za pomoč in usmeritvah pri XML, XSLT prilagoditvah se na tem mestu zahvaljujem Prof. Dr.phil. M.A. Georg Vogelerju in Elisabeth Raunig BA. MA. 
															</p>
														</li>
													</ol>
												</div>																																			
											</div>
										</div>
									</article>
								</section>
							</xsl:when>
							<xsl:when test="$mode = 'list_letters'">
								<section class="row">
									<article class="col-md-12 ">
										<div class="card">
											<div class="card-body">
												<div id="results">
													<ol class="result">
														<xsl:call-template name="results"/>
													</ol>
												</div>
											</div>
										</div>
									</article>													
								</section>						
							</xsl:when>
							<xsl:when test="$mode = 'osebe'">
								<section class="row">
									<article class="col-md-12 ">
										<div class="card">
											<div class="card-body">
												<p>TEST osebe</p>
											</div>
										</div>
									</article>													
								</section>						
							</xsl:when>
							<xsl:when test="$mode = 'kraji'">
								<section class="row">
									<article class="col-md-12 ">
										<div class="card">
											<div class="card-body">
												<p>TEST kraji2</p>
											</div>
										</div>
									</article>													
								</section>						
							</xsl:when>
							<xsl:when test="$mode = 'about'">
								<section class="row">
									<article class="col-md-12 ">
										<div class="card">
											<div class="card-body">
												<h3>Informacije o odgovornosti</h3>
												<div>  
													<p> Jože Glavič (<a target="_blank" href="mailto:joze.glavic@zal-lj.si">joze.glavic@zal-lj.si</a>) <br/>Zgodovinski arhiv Ljubljana</p>
													<p> Zgodovinski arhiv Ljubljana Enota za Dolenjsko in Belo krajino <br/> Skalickega ulica 1 (grad Grm)<br/> 8000 Novo mesto<br/> Slovenija<br/> Tel: +386 40 854 376<br/></p>
													<p>Digitalna izdaja objave pisem je bila izdelana v okviru zaključne naloge magisterska študija digitalne humanistike v okviru Univerze v Grazu (Avstrija). Naloga je bila izvedena pod mentorstvom Univ.-Prof. Dr.phil. M.A. Georg Vogelerja. Trenutno je objavljeno le del pisem. Korpus pisem se bo postopoma dopolnjeval.</p>
													<p> Vso odgovornost za tehnično izvedbo in spremna besedila nosi avtor te spletne strani. Originalno transkripcijo pisem s spremno študijo je opravila Nataša Budna Kodrič. Ta so bila objavljena v <a href="http://www.arhivsko-drustvo.si/wp-content/uploads/2019/01/Viri-št.-41.pdf">Viri št. 41</a>. Anotacijo in opremljanje z metapodatki je opravil Jože Glavič.</p>
												</div>        
												<div>
													<h3>Tehnična infrastruktura</h3>
													<p>
														<a target="_blank" href="https://gams.uni-graz.at/"> GAMS-Geisteswissenschaftliches Asset Management
															System </a>
															<p>
																<a target="_blank" href="http://informationsmodellierung.uni-graz.at"> Zentrum für
																	Informationsmodellierung - Austrian Centre for Digital Humanities </a>
																</p>
															</p>
														</div>
														<div>
															<h3>Identifikacija</h3>
															<p> Permalink: tbd<br/> Handle: tbd </p>
														</div>       

													</div>
												</div>
											</article>													
										</section>						
									</xsl:when>
									<xsl:when test="$mode = 'search'">
										<!-- muss auch im project-search kopiert werden, damit die felderbox auch bei den ergebnissen stehen bleibt. wenn ein projekt keine erweiterte suche hat, kann man das ignorieren -->
										<section class="row">
											<article class="col-md-5">
												<div class="card">
													<div class="card-body">
														<div class="advancedSearch">
															<h3>Erweiterte Suche</h3>
															<div id="backStart">
																<form method="get" name="g3search" role="form"
																	action="/search/gsearch">
																	<!-- ////////////////////// -->
																	<div class="input-group form-group">
																		<input type="text" class="form-control"
																			placeholder="Volltextsuche" id="query2"
																			name="query"/>
																			<div class="input-group-append">
																				<span class="input-group-text" id="basic-addon">
																					<a
																						href="/archive/objects/context:{$projectAbbr}/methods/sdef:Context/get?mode=searchHelp"
																						>?</a>
																					</span>
																				</div>
																			</div>
																			<!-- ////////////////////// -->
																			<div class="form-group">
																				<label for="exampleSelect1">Example select</label>
																				<select class="form-control" id="exampleSelect1">
																					<option>1</option>
																					<option>2</option>
																					<option>3</option>
																					<option>4</option>
																					<option>5</option>
																				</select>
																			</div>
																			<!-- ////////////////////// -->
																			<div class="form-group">
																				<label for="exampleSelect2">Mutiple select list
																					(hold shift to select more than one):</label>
																					<select multiple="multiple" class="form-control"
																						id="sel2" name="sellist2">
																						<option>1</option>
																						<option>2</option>
																						<option>3</option>
																						<option>4</option>
																						<option>5</option>
																					</select>
																				</div>
																				<!-- ////////////////////// -->
																				<div class="form-group">
																					<label for="exampleTextarea">Example
																						textarea</label>
																						<textarea class="form-control"
																							id="exampleTextarea" rows="3">
																							<xsl:text> </xsl:text>
																						</textarea>
																					</div>
																					<fieldset class="form-group">
																						<legend>Radio buttons</legend>
																						<div class="form-check">
																							<label class="form-check-label">
																								<input type="radio" class="form-check-input"
																									name="optionsRadios" id="optionsRadios1"
																									value="option1"/> 1 </label>
																								</div>
																								<div class="form-check">
																									<label class="form-check-label">
																										<input type="radio" class="form-check-input"
																											name="optionsRadios" id="optionsRadios2"
																											value="option2"/> 2 </label>
																										</div>
																										<div class="form-check disabled">
																											<label class="form-check-label">
																												<input type="radio" class="form-check-input"
																													name="optionsRadios" id="optionsRadios3"
																													value="option3"/> 3 </label>
																												</div>
																											</fieldset>
																											<div class="form-group">
																												<button type="submit" class="btn btn-default"
																													>Suche</button>
																													<xsl:text> </xsl:text>
																													<button type="reset" class="btn btn-default"
																														>Zurücksetzen</button>
																													</div>
																													<input type="hidden" name="hitPageSize"
																														id="hitPageSize" value="10"/>
																														<input type="hidden" name="hitPageStart"
																															id="hitPageStart" value="1"/>
																															<input type="hidden" id="pid" name="pid"
																																value="epsg"/>
																																<input type="hidden" id="mode" value="search"/>
																																<input type="hidden" name="search"
																																	value="advanced"/>
																																	<input type="hidden" name="x2">
																																		<xsl:attribute name="value">
																																			<xsl:value-of select="$searchXsl"/>
																																		</xsl:attribute>
																																	</input>
																																</form>
												<!--<form method="get" name="g3search" role="form" action="/search/gsearch">
												
												<div class="form-group">
												<div class="input-group">
												<input type="text" class="form-control"
												placeholder="Volltextsuche" id="query2"
												name="query"/>
												<span class="input-group-addon">
												<a
												href="/archive/objects/context:{$projectAbbr}/methods/sdef:Context/get?mode=searchHelp"
												>?</a>
												</span>
												</div>
												</div>
												<div class="form-group">
												<label for="selectbasic">Select Basic</label>
												<select id="selectbasic" name="selectbasic"
												class="form-control">
												<option value="1">Option one</option>
												<option value="2">Option two</option>
												</select>
												</div>
												<div class="form-group">
												<label for="selectbasic">Select Multiple</label>
												<select multiple="" class="form-control">
												<option>1</option>
												<option>2</option>
												<option>3</option>
												<option>4</option>
												<option>5</option>
												</select>
												</div>
													
													
												<div class="form-group">
												<label class="radio-inline">
												<input type="radio" name="inlineRadioOptions"
												id="inlineRadio1" value="option1"/> 1 </label>
												<label class="radio-inline">
												<input type="radio" name="inlineRadioOptions"
												id="inlineRadio2" value="option2"/> 2 </label>
												<label class="radio-inline">
												<input type="radio" name="inlineRadioOptions"
												id="inlineRadio3" value="option3"/> 3 </label>
												</div>
													
													
													
												<div class="form-group">
												<button type="submit" class="btn btn-default"
												>Suche</button>
												<xsl:text> </xsl:text>
												<button type="reset" class="btn btn-default"
												>Zurücksetzen</button>
												</div>
												<input type="hidden" name="hitPageSize"
												id="hitPageSize" value="10"/>
												<input type="hidden" name="hitPageStart"
												id="hitPageStart" value="1"/>
												<input type="hidden" id="pid" name="pid"
												value="epsg"/>
												<input type="hidden" id="mode" value="search"/>
												<input type="hidden" name="search"
												value="advanced"/>
												<input type="hidden" name="x2">
												<xsl:attribute name="value">
												<xsl:value-of select="$searchXsl"/>
												</xsl:attribute>
												</input>
											</form>-->
										</div>
									</div>
								</div>
							</div>
						</article>
					</section>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="content"/>
				</xsl:otherwise>
			</xsl:choose>
		</main>
		<footer class="footer">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<h6>Dodatne informacije</h6>
						<p>									
							<a
								href="/archive/objects/context:{$projectAbbr}/methods/sdef:Context/get?mode=about"
								>Informacije o odgovornosti</a>
							</p>
							<div class="icons">
								<a href="/" target="_blank">
									<img class="footer_icons"
										src="{$gamsAssetsRootPath}/img/gamslogo_weiss.gif" height="48"
										title="{$gams}" alt="{$gams}"/>
									</a>
									<a href="https://informationsmodellierung.uni-graz.at/"
										target="_blank">
										<img class="footer_icons" src="{$gamsAssetsRootPath}/img/ZIM_weiss.png"
											height="48" title="{$zim-acdh}" alt="{$zim-acdh}"/>
										</a>
										<a href="http://creativecommons.org/licenses/by-nc/4.0/"
											target="_blank">
											<img class="footer_icons" src="{$gamsAssetsRootPath}/img/by-nc.png"
												height="45" title="Lizenz" alt="Lizenz"/>
											</a>
										</div>
									</div>
									<div class="col-md-6">
										<h6>Kontakt</h6>
										<p>Zgodovinski arhiv Ljubljana <br/>Trdinova ulica 4 <br/>1001 Ljubljana 
										<br/>Slovenija
									</p>
									<p>
										<a href="mailto:zal@zal-lj.si">zal@zal-lj.si</a> <br/>
										Jože Glavič, <a href="mailto:joze.glavic@zal-lj.si">joze.glavic@zal-lj.si</a> 
									</p>
								</div>
							</div>
						</div>
					</footer>
				</body>
			</html>
		</xsl:template>
	</xsl:stylesheet>
