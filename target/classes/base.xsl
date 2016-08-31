<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:import href="element/css.xsl" />
	<xsl:import href="element/html.xsl" />
	<xsl:import href="element/javascript.xsl" />
	
	<xsl:output method="text" />
	<xsl:output method="html" indent="yes" />


	<xsl:template match="page">
		<html>
			<head>
				<meta xsl:use-attribute-sets="meta-viewport" />
				<meta xsl:use-attribute-sets="meta-telephone" />
				<title><xsl:value-of select="@id" /></title>
				
				
				
				<style>
					<xsl:attribute name="type">text/css</xsl:attribute>					
					<xsl:call-template name="body-element" />
					<xsl:apply-templates select="child::node()" mode="style" />
				</style>
				
				
				
				<script>
					<xsl:attribute name="type">text/javascript</xsl:attribute>					
					<xsl:apply-templates select="child::node()" mode="javascript" />
				</script>
			</head>
			
			
			<body>
				<xsl:apply-templates select="child::node()" mode="html" />
			</body>
		</html>
	</xsl:template>

	<!-- View Port -->
	<xsl:attribute-set name="meta-viewport">
		<xsl:attribute name="name">viewport</xsl:attribute>
		<xsl:attribute name="content">width=device-width, initial-scale=1.0, maximum-scale=1.5, minimum-scale=1.0, user-scalable=yes,target-densitydpi=device-dpi</xsl:attribute>
	</xsl:attribute-set>

	<!-- Format Telephone -->
	<xsl:attribute-set name="meta-telephone">
		<xsl:attribute name="name">format-detection</xsl:attribute>
		<xsl:attribute name="content">telephone-no</xsl:attribute>
	</xsl:attribute-set>
	
</xsl:stylesheet>