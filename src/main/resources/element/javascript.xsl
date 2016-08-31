<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
 
	<xsl:template match="*" mode="javascript"></xsl:template>

	<xsl:template match="*[ translate( local-name(), 'BUTTON', 'button') = 'button']" mode="javascript">
		function button<xsl:value-of select="position()" />()
		{
			<xsl:choose>
				<xsl:when test="string-length(link)!=0">window.location='<xsl:value-of select="link" />'; </xsl:when>
				<xsl:otherwise> return false;</xsl:otherwise>
			</xsl:choose>
		} 
	</xsl:template>

	<xsl:template match="*[ translate( local-name(), 'LABEL', 'label') = 'label']" mode="javascript">
		function label<xsl:value-of select="position()" />()
		{
			<xsl:choose>
				<xsl:when test="string-length(link)!=0">window.location='<xsl:value-of select="link" />'; </xsl:when>
				<xsl:otherwise> return false;</xsl:otherwise>
			</xsl:choose>
		} 
	</xsl:template>

	<xsl:template match="*[ translate( local-name(), 'IMAGE', 'image') = 'image']" mode="javascript">
		function image<xsl:value-of select="position()" />()
		{
			<xsl:choose>
				<xsl:when test="string-length(link)!=0">window.location='<xsl:value-of select="link" />'; </xsl:when>
				<xsl:otherwise> return false;</xsl:otherwise>
			</xsl:choose>
		} 
	</xsl:template>
	
</xsl:stylesheet>