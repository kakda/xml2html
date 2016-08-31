<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	 
	<xsl:template match="*" mode="html"></xsl:template>
	<xsl:template match="*[ translate( local-name(), 'BUTTON', 'button') = 'button']" mode="html">
		<button class="button-{position()}">
		
			<xsl:attribute name="onclick">button<xsl:value-of select="position()" />()</xsl:attribute>
			<span><xsl:value-of select="text" /></span>
		</button>
	</xsl:template>
	
	<xsl:template match="*[ translate( local-name(), 'LABEL', 'label') = 'label']" mode="html">
		<div class="label-{position()}">
		
			<xsl:attribute name="onclick">label<xsl:value-of select="position()" />()</xsl:attribute>
			<span><xsl:value-of select="text" /></span>
		</div>
	</xsl:template>
	
	<xsl:template match="*[ translate( local-name(), 'IMAGE', 'image') = 'image']" mode="html">
		<img class="image-{position()}">
		
			<xsl:attribute name="onclick">image<xsl:value-of select="position()" />()</xsl:attribute>
			<xsl:attribute name="src"><xsl:if test="string-length(@image_path)!=0"><xsl:value-of select="@image_path" /></xsl:if></xsl:attribute>
		</img>
	</xsl:template>
	
	<xsl:template match="*[ translate( local-name(), 'BACKGROUND', 'background') = 'background']" mode="html">
		<div class="background-{position()}"></div>
	</xsl:template>
	
	<xsl:template match="*[ translate( local-name(), 'INDICATOR', 'indicator') = 'indicator']" mode="html">
		<div class="indicator-{position()}"></div>
	</xsl:template>
	
	<xsl:template match="*[ translate( local-name(), 'INPUTBOX', 'inputbox') = 'inputbox']" mode="html">
		<input class="inputbox-{position()}">
			<xsl:attribute name="type"><xsl:value-of select="@type" /></xsl:attribute>
			<xsl:attribute name="value"><xsl:value-of select="text" /></xsl:attribute>
		</input>
	</xsl:template>
	
	<xsl:template match="*[ translate( local-name(), 'TEXTAREA', 'textarea') = 'textarea']" mode="html">
		<textarea class="textarea-{position()}">
			<xsl:value-of select="text" />
		</textarea>
	</xsl:template>
	
	<xsl:template match="*[ translate( local-name(), 'CHECKBOX', 'checkbox') = 'checkbox']" mode="html">
		<input class="checkbox-{position()}">
			<xsl:attribute name="type">checkbox</xsl:attribute>
			<xsl:attribute name="name"><xsl:value-of select="../@name" /></xsl:attribute>
			<xsl:attribute name="id">checkbox-<xsl:value-of select="position()" /></xsl:attribute>
			<xsl:attribute name="value"><xsl:value-of select="text" /></xsl:attribute>
		</input>
		<label class="label-checkbox-{position()}">
			<xsl:attribute name="for">checkbox-<xsl:value-of select="position()" /></xsl:attribute>
			<xsl:value-of select="text" />
		</label>
	</xsl:template>
	
	<xsl:template match="*[ translate( local-name(), 'RADIO', 'radio') = 'radio']" mode="html">
		<input class="radio-{position()}">
			<xsl:attribute name="type">radio</xsl:attribute>
			<xsl:attribute name="name"><xsl:value-of select="../@name" /></xsl:attribute>
			<xsl:attribute name="id">radio-<xsl:value-of select="position()" /></xsl:attribute>
			<xsl:attribute name="value"><xsl:value-of select="text" /></xsl:attribute>
		</input>
		<label for="label-radio-{position()}">
			<xsl:attribute name="for">radio-<xsl:value-of select="position()" /></xsl:attribute> 
			<xsl:value-of select="text" />
		</label>
	</xsl:template>
	
	<xsl:template match="*[ translate( local-name(), 'CHECKBOXS', 'checkboxs') = 'checkboxs']" mode="html">
		<xsl:apply-templates select="checkbox" mode="html" />
	</xsl:template>
	
	<xsl:template match="*[ translate( local-name(), 'LIST', 'list') = 'list']" mode="html">
		<ul class="list-{position()}">
			<xsl:for-each select="*[ translate( local-name(), 'ROWS/ROW', 'rows/row') = 'rows/row']">
				<li class="li-{position()}">
					<xsl:value-of select="text" />
				</li>
			</xsl:for-each>
		</ul>
	</xsl:template>
	
	<xsl:template match="*[ translate( local-name(), 'TABLE', 'table') = 'table']" mode="html">
		<table class="table-{position()}">			
		    <xsl:call-template name="tr">
		    	<xsl:with-param name="r" select="0"/>
		    	<xsl:with-param name="row" select="row"/>
		    	<xsl:with-param name="col" select="col"/>
		    </xsl:call-template>
		</table>
	</xsl:template>
	
	<!-- Foreach TR -->
	<xsl:template name="tr">
		<xsl:param name="r" />
		<xsl:param name="row" />
		<xsl:param name="col" />
        <xsl:if test="$row > $r">
			<tr>
				<xsl:call-template name="td">
			    	<xsl:with-param name="c" select="0"/>
			    	<xsl:with-param name="col" select="$col"/>
			    </xsl:call-template>
			</tr>
	        <xsl:call-template name="tr">
	            <xsl:with-param name="r" select="$r + 1"/>
				<xsl:with-param name="row" select="$row"/>
				<xsl:with-param name="col" select="$col"/>
	        </xsl:call-template>
       </xsl:if> 
    </xsl:template>
    
	<!-- Foreach TD -->
	<xsl:template name="td">
		<xsl:param name="c" />
		<xsl:param name="col" />
        <xsl:if test="$col > $c">
			<td></td>
	        <xsl:call-template name="td">
	            <xsl:with-param name="c" select="$c + 1"/>
				<xsl:with-param name="col" select="$col"/>
	        </xsl:call-template>
       </xsl:if> 
    </xsl:template>
</xsl:stylesheet>