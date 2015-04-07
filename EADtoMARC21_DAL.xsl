<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:marc="http://www.loc.gov/MARC21/slim" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes="marc">
	<xsl:import href="MARC21slimUtils.xsl" />
	<xsl:output method="xml" encoding="UTF-8" indent="yes" />
	<!--<xsl:strip-space elements="*" />-->
	<xsl:template match="/ead">
		<marc:collection xmlns:marc="http://www.loc.gov/MARC21/slim" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.loc.gov/MARC21/slim http://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd">

<!-- This is the Dalhousie modification of the Marcedit stylesheet modified by Heather Wylie. The original stylesheet is in EADtoMarc21slimXML.xsl. Modifications include,

LDR: changed to n, new record; c, collection; a, archival control; p, mixed materials;
008: blanked out date added; type of date to i; language to eng;
040: Changed from $aORE to $aCaNSHD; Removed $c subfield;
1XX: Originally generated from origination tag, which we do not use.
100: Wrote code to generate from normal attribute of persname or famname embedded in unittitle tag;
110: Wrote code to generate from normal attribute of corpname embedded in unittitle tag;
245/260: included code to put these dates in 260$c; deleted code that puts dates in 245$f or 245$g;
300: Code was producing invalid subfields, so included line to generate $a properly;
351: Included line to print colon between "Arrangement" and field contents;
500: removed code that generates 500 from the "odd" tag, as we do not use this tag;
505: Removed section which included c02 and c03 info in marc record;
505: Removed the line which printed a colon in front of each of the content notes;
506: Included line to print colon between label and field contents;
520: Original had code to choose scopecontent first, and then abstract if no scopecontent; we use scopecontent only;
524: removed code that puts the preferred citation in 524, as this info is not required for the catalog record;
530: removed code that puts the altformavail info in the 530, as we don't use this tag;
540: removed code that puts the legal restrictions in 540, as this info is not required for the catalog record;
544: Included line to print colon between "Related materials" and field contents;
545: original stylesheet only looked for marc encoding, which we don't use;
545: Wrote bioghist choose code to generate 5451 if unittitle/corpname, otherwise a 5450;
561: Included line to print colon between "Custodial history" and field contents;
6XX: Seems to be generated from a template that is very complicated and I don't understand it;
600: Wrote code to generate from normal attribute of persname or famname embedded in unittitle tag;
610: Wrote code to generate from normal attribute of corpname embedded in unittitle tag;
856: changed second indicator to 2, to indicate link to related resource;
Note: When record is saved in Aleph, 008 date fields are populated by 260$c info; -->
	
	
<marc:record>
	<marc:leader>
		<xsl:text>     npcaa2200289 a 4500</xsl:text>
	</marc:leader>
	<marc:controlfield tag="008">
					<xsl:text>\\\\\\i9999\\\\nsc\\\\\\\\\\\\\\\\\eng\d</xsl:text>
				</marc:controlfield>
				<marc:datafield tag="040" ind1=" " ind2=" ">
					<marc:subfield code="a">CaNSHD</marc:subfield>
				</marc:datafield>
				<xsl:if test="//unittitle">
					<xsl:if test="//unittitle/persname">
						<marc:datafield tag="100" ind1="1" ind2=" ">
							<marc:subfield code="a">
								<xsl:value-of select="normalize-space(//persname/@normal)" />
							</marc:subfield>
						</marc:datafield>
					</xsl:if>
					<xsl:if test="//unittitle/famname">
						
						<marc:datafield tag="100" ind1="3" ind2=" ">
							<marc:subfield code="a">
								<xsl:value-of select="normalize-space(//famname/@normal)" />
							</marc:subfield>
						</marc:datafield>
					</xsl:if>
					<xsl:if test="//unittitle/corpname">
						
						<marc:datafield tag="110" ind1="2" ind2=" ">
							<marc:subfield code="a">
								<xsl:value-of select="normalize-space(//corpname)" />
							</marc:subfield>
						</marc:datafield>
					</xsl:if>
					<marc:datafield tag="245" ind1="1" ind2="0">
						<marc:subfield code="a">
							<xsl:value-of select="normalize-space(//unittitle/.)" />
						</marc:subfield>			
					</marc:datafield>
				</xsl:if>
				<xsl:if test="//unitdate">
				<marc:datafield tag="260" ind1=" " ind2=" ">
					<marc:subfield code="c">
						<xsl:value-of select="//unitdate/." />
					</marc:subfield>
				</marc:datafield>
				</xsl:if>

				<xsl:if test="archdesc/did/physdesc">
					<xsl:for-each select="archdesc/did/physdesc/extent">
						<marc:datafield tag="300" ind1=" " ind2=" ">
							<marc:subfield code="a">
								<xsl:value-of select="normalize-space(.)" />
							</marc:subfield>
						</marc:datafield>
					</xsl:for-each>
				</xsl:if>
				<xsl:if test="archdesc/arrangement">
					<marc:datafield tag="351" ind1=" " ind2=" ">
						<marc:subfield code="a">
							<xsl:text>Arrangement: </xsl:text>
							<xsl:value-of select="normalize-space(archdesc/arrangement/p/.)" />
						</marc:subfield>
					</marc:datafield>
				</xsl:if>
				<xsl:if test="archdesc/dsc">
					<xsl:for-each select="archdesc/dsc/c01">
						<marc:datafield tag="505" ind1="0" ind2="0">
							<marc:subfield code="t">
								<xsl:value-of select="normalize-space(did/unitid/.)" />
								<xsl:value-of select="normalize-space(did/unittitle/.)" />
								<xsl:text>, </xsl:text>
								<xsl:value-of select="normalize-space(did/unitdate/.)" />
							</marc:subfield>
						</marc:datafield>
					</xsl:for-each>
				</xsl:if>
				<xsl:if test="//accessrestrict">
					<marc:datafield tag="506" ind1=" " ind2=" ">
						<marc:subfield code="a">
							<xsl:text>Access restrictions: </xsl:text>
							<xsl:value-of select="normalize-space(//accessrestrict/p/.)" />
						</marc:subfield>
					</marc:datafield>
				</xsl:if>
				<xsl:if test="//scopecontent">
					<marc:datafield tag="520" ind1="2" ind2=" ">
							<marc:subfield code="a">
								<xsl:value-of select="normalize-space(//scopecontent/p/.)" />
							</marc:subfield>
					</marc:datafield>
				</xsl:if>
				<xsl:if test="archdesc/relatedmaterial">
					<marc:datafield tag="544" ind1="1" ind2=" ">
						<marc:subfield code="a">
							<xsl:text>Related materials: </xsl:text>
							<xsl:value-of select="normalize-space(archdesc/relatedmaterial/p/.)" />
						</marc:subfield>
					</marc:datafield>
				</xsl:if>
				<xsl:if test="//bioghist">
					<xsl:choose>
						<xsl:when test="//unittitle/corpname">
							<marc:datafield tag="545" ind1="1" ind2=" ">
								<marc:subfield code="a">
									<xsl:value-of select="normalize-space(//bioghist/p/.)" />
								</marc:subfield>
							</marc:datafield>
						</xsl:when>
						<xsl:otherwise>
							<marc:datafield tag="545" ind1="0" ind2=" ">
								<marc:subfield code="a">
									<xsl:value-of select="normalize-space(//bioghist/p/.)" />
								</marc:subfield>
							</marc:datafield>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:if test="//langmaterial/language">
					<marc:datafield tag="546" ind1=" " ind2=" ">
						<marc:subfield code="a">
							<xsl:value-of select="normalize-space(//language/.)" />
						</marc:subfield>
					</marc:datafield>
				</xsl:if>
				<xsl:if test="archdesc/custodhist">
					<marc:datafield tag="561" ind1=" " ind2=" ">
						<marc:subfield code="a">
							<xsl:text>Custodial history: </xsl:text>
							<xsl:value-of select="normalize-space(archdesc/custodhist/p/.)" />
						</marc:subfield>
					</marc:datafield>
				</xsl:if>
				<xsl:if test="//unittitle">
					<xsl:if test="//unittitle/persname">
						<marc:datafield tag="600" ind1="1" ind2="0">
							<marc:subfield code="a">
								<xsl:value-of select="normalize-space(//persname/@normal)" />
							</marc:subfield>
							<marc:subfield code="v">
								<xsl:text>Archives</xsl:text>
							</marc:subfield>
						</marc:datafield>
					</xsl:if>
					<xsl:if test="//unittitle/famname">
						<marc:datafield tag="600" ind1="3" ind2="0">
							<marc:subfield code="a">
								<xsl:value-of select="normalize-space(//famname/@normal)" />
							</marc:subfield>
							<marc:subfield code="v">
								<xsl:text>Archives</xsl:text>
							</marc:subfield>
						</marc:datafield>
					</xsl:if>
					<xsl:if test="//unittitle/corpname">
						<marc:datafield tag="610" ind1="2" ind2="0">
							<marc:subfield code="a">
								<xsl:value-of select="normalize-space(//corpname)" />
							</marc:subfield>
							<marc:subfield code="v">
								<xsl:text>Archives</xsl:text>
							</marc:subfield>
						</marc:datafield>
					</xsl:if>
				</xsl:if>
				<xsl:for-each select="//subject">
					<xsl:if test="@encodinganalog='600'">
						<marc:datafield tag="600" ind1="1" ind2="0">
							<marc:subfield code="a">
								<xsl:value-of select="normalize-space(.)" />
							</marc:subfield>
						</marc:datafield>
					</xsl:if>
					<xsl:if test="@encodinganalog='610'">
						<marc:datafield tag="610" ind1="2" ind2="0">
							<marc:subfield code="a">
								<xsl:value-of select="normalize-space(.)" />
							</marc:subfield>
						</marc:datafield>
					</xsl:if>
					<xsl:if test="@encodinganalog='611'">
						<marc:datafield tag="611" ind1="2" ind2="0">
							<marc:subfield code="a">
								<xsl:value-of select="normalize-space(.)" />
							</marc:subfield>
						</marc:datafield>
					</xsl:if>
					<xsl:if test="@encodinganalog='650'">
						<marc:datafield tag="650" ind1=" " ind2="0">
							<marc:subfield code="a">
								<xsl:value-of select="normalize-space(.)" />
							</marc:subfield>
						</marc:datafield>
					</xsl:if>
					<xsl:if test="@encodinganalog='651'">
						<marc:datafield tag="651" ind1=" " ind2="0">
							<marc:subfield code="a">
								<xsl:value-of select="normalize-space(.)" />
							</marc:subfield>
						</marc:datafield>
					</xsl:if>
				</xsl:for-each>
				<xsl:if test="eadheader/eadid">
					<marc:datafield tag="856" ind1="4" ind2="2">
						<marc:subfield code="u">
							<!--<xsl:text>http://</xsl:text>-->
							<xsl:value-of select="normalize-space(eadheader/eadid/@url)" />		
						</marc:subfield>
						<marc:subfield code="z">View the finding aid online.</marc:subfield>
					</marc:datafield>
				</xsl:if>
			</marc:record>
		</marc:collection>
	</xsl:template>	
</xsl:stylesheet>
