<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	 
	<!--
	Example: *[ translate( local-name(), 'BUTTON', 'button') = 'button'] == element case insensitive  
	-->
	<xsl:template match="*" mode="style"></xsl:template>
	<xsl:template match="*[ translate( local-name(), 'BUTTON', 'button') = 'button']" mode="style">
		.button-<xsl:value-of select="position()"/> {
			<xsl:call-template name="default-element" />
		}
		.button-<xsl:value-of select="position()"/> span{
			<xsl:call-template name="text-element" />
		} 
	</xsl:template>
	
	<xsl:template match="*[ translate( local-name(), 'LABEL', 'label') = 'label']" mode="style">
		.label-<xsl:value-of select="position()"/> {
			<xsl:call-template name="default-element" />
		}
		.label-<xsl:value-of select="position()"/> span{
			<xsl:call-template name="text-element" />
		}
	</xsl:template>
	
	<xsl:template match="*[ translate( local-name(), 'IMAGE', 'image') = 'image']" mode="style">
		.image-<xsl:value-of select="position()"/> {
			<xsl:call-template name="default-element" />
		}
	</xsl:template>
	
	<xsl:template match="*[ translate( local-name(), 'BACKGROUND', 'background') = 'background']" mode="style">
		.background-<xsl:value-of select="position()"/> {
			<xsl:call-template name="default-element" />
		}
	</xsl:template>
	
	<xsl:template match="*[ translate( local-name(), 'INDICATOR', 'indicator') = 'indicator']" mode="style">
		.indicator-<xsl:value-of select="position()"/> {
			<xsl:call-template name="default-element" />
		}
	</xsl:template>
	
	<xsl:template match="*[ translate( local-name(), 'INPUTBOX', 'inputbox') = 'inputbox']" mode="style">
		.inputbox-<xsl:value-of select="position()"/> {
			<xsl:call-template name="default-element" />
			<xsl:call-template name="text-element" />
		}
	</xsl:template>
	
	<xsl:template match="*[ translate( local-name(), 'TEXTAREA', 'textarea') = 'textarea']" mode="style">
		.textarea-<xsl:value-of select="position()"/> {
			<xsl:call-template name="default-element" />
			<xsl:call-template name="text-element" />
		}
	</xsl:template>
	
	<xsl:template match="*[ translate( local-name(), 'CHECKBOX', 'checkbox') = 'checkbox']" mode="style">
		.checkbox-<xsl:value-of select="position()"/>{
			<xsl:call-template name="default-element" />
		}
		.checkbox-<xsl:value-of select="position()"/>:checked{
			<xsl:if test="string-length(@on_image)!=0">background-image: url('<xsl:value-of select="@on_image" />'); </xsl:if>
		}
		.label-checkbox-<xsl:value-of select="position()"/> {
			<xsl:call-template name="default-element" />
			<xsl:call-template name="text-element" />
		}
	</xsl:template>
	
	<xsl:template match="*[ translate( local-name(), 'RADIO', 'radio') = 'radio']" mode="style">
		.radio-<xsl:value-of select="position()"/>l{
			<xsl:call-template name="default-element" />
		}
		.radio-<xsl:value-of select="position()"/>:checked{
			<xsl:if test="string-length(@on_image)!=0">background-image: url('<xsl:value-of select="@on_image" />'); </xsl:if>
		}
		.label-radio-<xsl:value-of select="position()"/> {
			<xsl:call-template name="default-element" />
			<xsl:call-template name="text-element" />
		}
	</xsl:template>
	
	<xsl:template match="*[ translate( local-name(), 'CHECKBOXS', 'checkboxs') = 'checkboxs']" mode="style">
		<xsl:apply-templates select="checkbox" mode="style" />
	</xsl:template>

	<xsl:template match="*[ translate( local-name(), 'RADIOS', 'radios') = 'radios']" mode="style">
		<xsl:apply-templates select="radio" mode="style" />
	</xsl:template>

	<xsl:template match="*[ translate( local-name(), 'LIST', 'list') = 'list']" mode="style">
		<xsl:variable name="radio">.list-<xsl:value-of select="position()" /></xsl:variable>
		<xsl:value-of select="$radio" /> {
			<xsl:call-template name="default-element" />
		}
		
		<xsl:for-each select="*[ translate( local-name(), 'ROWS', 'rows') = 'rows/row']">
			<xsl:value-of select="$radio" /> .li-<xsl:value-of select="position()"/>{
				<xsl:call-template name="text-element" />
			}
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="*[ translate( local-name(), 'TABLE', 'table') = 'table']" mode="style">
		.table-<xsl:value-of select="position()"/> {
			<xsl:call-template name="default-element" /> table-layout: fixed;
		}
	</xsl:template>
	
	
	<!-- Calling base templates -->
	
	<xsl:template name="body-element">
	
		body{
			margin: 0;  padding: 0; <xsl:if test="string-length(@width)!=0">  width: <xsl:value-of select="@width" />px;  </xsl:if>  <xsl:if test="string-length(@height)!=0">  height: <xsl:value-of select="@height" />px;  </xsl:if> position: relative;
		} 
	</xsl:template>
	
	<xsl:template name="default-element">
	 	<xsl:if test="string-length(@color)!=0"> background-color: <xsl:value-of select="@color" />; appearance: none; </xsl:if><xsl:if test="string-length(@image_path)!=0"> background-color: transparent;border:none; background-image: url('<xsl:value-of select="@image_path" />');</xsl:if>
		<xsl:if test="string-length(@image_path)!=0">appearance: none; border: none; background-color: transparent;border:none; background-image: url('<xsl:value-of select="@image_path" />'); </xsl:if>
		<xsl:if test="string-length(@width)!=0"> width : <xsl:value-of select="@width" />px; </xsl:if>
		<xsl:if test="string-length(@height)!=0"> height : <xsl:value-of select="@height" />px; </xsl:if>
		<xsl:if test="string-length(@coordinateX)!=0">left : <xsl:value-of select="@coordinateX" />px; position: absolute; </xsl:if>
		<xsl:if test="string-length(@coordinateY)!=0">top : <xsl:value-of select="@coordinateY" />px; </xsl:if> 
		<xsl:if test="string-length(@align)!=0">text-align : <xsl:value-of select="@align" />; </xsl:if> 
	</xsl:template>
	
	<xsl:template name="text-element">
		<xsl:if test="string-length(text/@font_size)!=0"> font-size: <xsl:value-of select="text/@font_size" />px; </xsl:if>
		<xsl:if test="string-length(text/@font_face)!=0"> font-family: '<xsl:value-of select="text/@font_face" />'; </xsl:if>
		<xsl:if test="string-length(text/@font_color)!=0"> color: <xsl:value-of select="text/@font_color" />; </xsl:if>
		<xsl:if test="string-length(text/@font_bold)!=0"> font-weight: <xsl:choose><xsl:when test="text/@font_bold='Y'">bold </xsl:when><xsl:otherwise> normal</xsl:otherwise></xsl:choose>; </xsl:if>
		<xsl:if test="string-length(text/@font_italic)!=0"> font-style: <xsl:choose><xsl:when test="text/@font_italic='Y'">italic </xsl:when><xsl:otherwise> normal</xsl:otherwise></xsl:choose>; </xsl:if>
		<xsl:if test="string-length(text/@font_underline)!=0"> text-decoration: <xsl:choose><xsl:when test="text/@font_underline='Y'">underline </xsl:when><xsl:otherwise> none</xsl:otherwise></xsl:choose>; </xsl:if>
		<xsl:if test="string-length(text/@font_shadow)!=0"> text-shadow: <xsl:choose> <xsl:when test="text/@font_shadow='Y'"><xsl:value-of select="text/@shadow_coordinateY" />px <xsl:value-of select="text/@shadow_coordinateX" />px <xsl:value-of select="text/@shadow_size" />px <xsl:value-of select="text/@shadow_color" />; </xsl:when> <xsl:otherwise> none</xsl:otherwise> </xsl:choose>; </xsl:if>
		<xsl:if test="string-length(@valign)!=0">display: table-cell; vertical-align : <xsl:value-of select="@valign" />; width : <xsl:value-of select="@width" />px; height: <xsl:value-of select="@height" />px; </xsl:if> 
	</xsl:template>	
	
</xsl:stylesheet>