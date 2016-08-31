<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="text" />
	<xsl:output method="html" indent="yes" />
	
	<xsl:variable name="smallcase" select="'abcdefghijklmnopqrstuvwxyz'" />
	<xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />
	
	<xsl:template match="page">
		<html>
			<head>
				<meta>
					<xsl:attribute name="name">viewport</xsl:attribute>
					<xsl:attribute name="content">width=device-width, initial-scale=1.0, maximum-scale=1.5, minimum-scale=1.0, user-scalable=yes,target-densitydpi=device-dpi</xsl:attribute>
				</meta>
				<meta>
					<xsl:attribute name="name">format-detection</xsl:attribute>
					<xsl:attribute name="content">telephone-no</xsl:attribute>
				</meta>
				<title><xsl:value-of select="@id" /></title>
			</head>
			<body>
				<xsl:attribute name="style">margin: 0; padding: 0;<xsl:if test="string-length(@width)!=0"> width: <xsl:value-of select="@width" />px; </xsl:if> <xsl:if test="string-length(@height)!=0"> height: <xsl:value-of select="@height" />px; </xsl:if> position: relative; </xsl:attribute>
				<xsl:for-each select="*">
					<xsl:if test="translate(name(.), $uppercase, $smallcase)='label'">
						<div>
							<xsl:attribute name="style">
							  <xsl:if test="string-length(@width)!=0"> width: <xsl:value-of select="@width" />px; </xsl:if>
							  <xsl:if test="string-length(@height)!=0"> height: <xsl:value-of select="@height" />px; </xsl:if>
							  <xsl:if test="string-length(@coordinateX)!=0"> left: <xsl:value-of select="@coordinateX" />px; position: absolute;</xsl:if> 
							  <xsl:if test="string-length(@coordinateY)!=0"> top: <xsl:value-of select="@coordinateY" />px; </xsl:if>
							  <xsl:if test="string-length(@image_path)!=0">background-color: transparent; background-image: url('<xsl:value-of select="@image_path" />'); </xsl:if>
							  <xsl:if test="string-length(text/@font_size)!=0">font-size: <xsl:value-of select="text/@font-size" />px; </xsl:if>
							  <xsl:if test="string-length(text/@font_face)!=0">font-family: '<xsl:value-of select="text/@font_face" />'; </xsl:if>
							  <xsl:if test="string-length(text/@font_color)!=0">color: <xsl:value-of select="text/@font_color" />; </xsl:if>
							  <xsl:if test="string-length(text/@font_bold)!=0">font-weight: <xsl:choose><xsl:when test="text/@font_bold='Y'">bold </xsl:when><xsl:otherwise> normal</xsl:otherwise></xsl:choose>; </xsl:if>
							  <xsl:if test="string-length(text/@font_italic)!=0">font-style: <xsl:choose><xsl:when test="text/@font_italic='Y'">italic </xsl:when><xsl:otherwise> normal</xsl:otherwise></xsl:choose>; </xsl:if>
							  <xsl:if test="string-length(text/@font_underline)!=0">text-decoration: <xsl:choose><xsl:when test="text/@font_underline='Y'">underline </xsl:when><xsl:otherwise> none</xsl:otherwise></xsl:choose>; </xsl:if>
							  <xsl:if test="string-length(text/@font_shadow)!=0">text-shadow: <xsl:choose><xsl:when test="text/@font_shadow='Y'">0px 0px 1px #000000; </xsl:when><xsl:otherwise> none</xsl:otherwise></xsl:choose>; </xsl:if>
							</xsl:attribute>
							<xsl:value-of select="text" />
						</div>
					</xsl:if>
					<xsl:if test="translate(name(.), $uppercase, $smallcase)='image'">
						<img>
							<xsl:attribute name="src">
								<xsl:if test="string-length(@image_path)!=0"><xsl:value-of select="@image_path" /></xsl:if>
							</xsl:attribute>
							<xsl:attribute name="style">
							  <xsl:if test="string-length(@width)!=0"> width: <xsl:value-of select="@width" />px; </xsl:if>
							  <xsl:if test="string-length(@height)!=0"> height: <xsl:value-of select="@height" />px; </xsl:if>
							  <xsl:if test="string-length(@coordinateX)!=0"> left: <xsl:value-of select="@coordinateX" />px; position: absolute;</xsl:if> 
							  <xsl:if test="string-length(@coordinateY)!=0"> top: <xsl:value-of select="@coordinateY" />px; </xsl:if>
							</xsl:attribute>
						</img>
					</xsl:if>
					<xsl:if test="translate(name(.), $uppercase, $smallcase)='background'">
						<div>
							<xsl:attribute name="style">
							  <xsl:if test="string-length(@width)!=0"> width: <xsl:value-of select="@width" />px; </xsl:if>
							  <xsl:if test="string-length(@height)!=0"> height: <xsl:value-of select="@height" />px; </xsl:if>
							  <xsl:if test="string-length(@coordinateX)!=0"> left: <xsl:value-of select="@coordinateX" />px; position: absolute;</xsl:if> 
							  <xsl:if test="string-length(@coordinateY)!=0"> top: <xsl:value-of select="@coordinateY" />px; </xsl:if>
							  <xsl:if test="string-length(@color)!=0"> background-color: <xsl:value-of select="@color" />; </xsl:if>
							</xsl:attribute>
						</div>
					</xsl:if>
					<xsl:if test="translate(name(.), $uppercase, $smallcase)='indicator'">
						<div>
							<xsl:attribute name="style">
							  <xsl:if test="string-length(@width)!=0"> width: <xsl:value-of select="@width" />px; </xsl:if>
							  <xsl:if test="string-length(@height)!=0"> height: <xsl:value-of select="@height" />px; </xsl:if>
							  <xsl:if test="string-length(@coordinateX)!=0"> left: <xsl:value-of select="@coordinateX" />px; position: absolute;</xsl:if> 
							  <xsl:if test="string-length(@coordinateY)!=0"> top: <xsl:value-of select="@coordinateY" />px; </xsl:if>
							  <xsl:if test="string-length(@image_path)!=0">background-color: transparent;background-image: url('<xsl:value-of select="@image_path" />'); </xsl:if>
							</xsl:attribute>
						</div>
					</xsl:if>
					<xsl:if test="translate(name(.), $uppercase, $smallcase)='button'">
						<button>
							<xsl:attribute name="onclick">
								<xsl:if test="string-length(link)!=0">javascript:location='<xsl:value-of select="link" />';</xsl:if>
							</xsl:attribute>
							<xsl:attribute name="style">
							  <xsl:if test="string-length(@width)!=0"> width: <xsl:value-of select="@width" />px; </xsl:if>
							  <xsl:if test="string-length(@height)!=0"> height: <xsl:value-of select="@height" />px; </xsl:if>
							  <xsl:if test="string-length(@coordinateX)!=0"> left: <xsl:value-of select="@coordinateX" />px; position: absolute;</xsl:if> 
							  <xsl:if test="string-length(@coordinateY)!=0"> top: <xsl:value-of select="@coordinateY" />px; </xsl:if>
							  <xsl:if test="string-length(@color)!=0">background-color: <xsl:value-of select="@color" />; appearance: none;</xsl:if>
							  <xsl:if test="string-length(@image_path)!=0">background-color: transparent;border:none; background-image: url('<xsl:value-of select="@image_path" />'); </xsl:if>
							  <xsl:if test="string-length(text/@font_size)!=0">font-size: <xsl:value-of select="text/@font-size" />px; </xsl:if>
							  <xsl:if test="string-length(text/@font_face)!=0">font-family: '<xsl:value-of select="text/@font_face" />'; </xsl:if>
							  <xsl:if test="string-length(text/@font_color)!=0">color: <xsl:value-of select="text/@font_color" />; </xsl:if>
							  <xsl:if test="string-length(text/@font_bold)!=0">font-weight: <xsl:choose><xsl:when test="text/@font_bold='Y'">bold </xsl:when><xsl:otherwise> normal</xsl:otherwise></xsl:choose>; </xsl:if>
							  <xsl:if test="string-length(text/@font_italic)!=0">font-style: <xsl:choose><xsl:when test="text/@font_italic='Y'">italic </xsl:when><xsl:otherwise> normal</xsl:otherwise></xsl:choose>; </xsl:if>
							  <xsl:if test="string-length(text/@font_underline)!=0">text-decoration: <xsl:choose><xsl:when test="text/@font_underline='Y'">underline </xsl:when><xsl:otherwise> none</xsl:otherwise></xsl:choose>; </xsl:if>
							  <xsl:if test="string-length(text/@font_shadow)!=0">text-shadow: <xsl:choose><xsl:when test="text/@font_shadow='Y'">0px 0px 1px #000000; </xsl:when><xsl:otherwise> none</xsl:otherwise></xsl:choose>; </xsl:if>
							</xsl:attribute>
							<xsl:value-of select="text" />
						</button>
					</xsl:if>
					<xsl:if test="translate(name(.), $uppercase, $smallcase)='inputbox'">
						<input>
							<xsl:attribute name="type">
								<xsl:value-of select="@type" />
							</xsl:attribute>
							<xsl:attribute name="style">
							  <xsl:if test="string-length(@width)!=0"> width: <xsl:value-of select="@width" />px; </xsl:if>
							  <xsl:if test="string-length(@height)!=0"> height: <xsl:value-of select="@height" />px; </xsl:if>
							  <xsl:if test="string-length(@coordinateX)!=0"> left: <xsl:value-of select="@coordinateX" />px; position: absolute;</xsl:if> 
							  <xsl:if test="string-length(@coordinateY)!=0"> top: <xsl:value-of select="@coordinateY" />px; </xsl:if>
							  <xsl:if test="string-length(@image_path)!=0">background-color: transparent;border:none; background-image: url('<xsl:value-of select="@image_path" />'); </xsl:if>
							  <xsl:if test="string-length(text/@font_size)!=0">font-size: <xsl:value-of select="text/@font-size" />px; </xsl:if>
							  <xsl:if test="string-length(text/@font_face)!=0">font-family: '<xsl:value-of select="text/@font_face" />'; </xsl:if>
							  <xsl:if test="string-length(text/@font_color)!=0">color: <xsl:value-of select="text/@font_color" />; </xsl:if>
							  <xsl:if test="string-length(text/@font_bold)!=0">font-weight: <xsl:choose><xsl:when test="text/@font_bold='Y'">bold </xsl:when><xsl:otherwise> normal</xsl:otherwise></xsl:choose>; </xsl:if>
							  <xsl:if test="string-length(text/@font_italic)!=0">font-style: <xsl:choose><xsl:when test="text/@font_italic='Y'">italic </xsl:when><xsl:otherwise> normal</xsl:otherwise></xsl:choose>; </xsl:if>
							  <xsl:if test="string-length(text/@font_underline)!=0">text-decoration: <xsl:choose><xsl:when test="text/@font_underline='Y'">underline </xsl:when><xsl:otherwise> none</xsl:otherwise></xsl:choose>; </xsl:if>
							  <xsl:if test="string-length(text/@font_shadow)!=0">text-shadow: <xsl:choose><xsl:when test="text/@font_shadow='Y'">0px 0px 1px #000000; </xsl:when><xsl:otherwise> none</xsl:otherwise></xsl:choose>; </xsl:if>
							</xsl:attribute>
							<xsl:attribute name="value">
							  <xsl:value-of select="text" />
							</xsl:attribute>
						</input>
					</xsl:if>
					<xsl:if test="translate(name(.), $uppercase, $smallcase)='textarea'">
						<textarea>
							<xsl:attribute name="style">
							  <xsl:if test="string-length(@width)!=0"> width: <xsl:value-of select="@width" />px; </xsl:if>
							  <xsl:if test="string-length(@height)!=0"> height: <xsl:value-of select="@height" />px; </xsl:if>
							  <xsl:if test="string-length(@coordinateX)!=0"> left: <xsl:value-of select="@coordinateX" />px; position: absolute;</xsl:if> 
							  <xsl:if test="string-length(@coordinateY)!=0"> top: <xsl:value-of select="@coordinateY" />px; </xsl:if>
							  <xsl:if test="string-length(@image_path)!=0">background-color: transparent;border:none; background-image: url('<xsl:value-of select="@image_path" />'); </xsl:if>
							  <xsl:if test="string-length(text/@font_size)!=0">font-size: <xsl:value-of select="text/@font-size" />px; </xsl:if>
							  <xsl:if test="string-length(text/@font_face)!=0">font-family: '<xsl:value-of select="text/@font_face" />'; </xsl:if>
							  <xsl:if test="string-length(text/@font_color)!=0">color: <xsl:value-of select="text/@font_color" />; </xsl:if>
							  <xsl:if test="string-length(text/@font_bold)!=0">font-weight: <xsl:choose><xsl:when test="text/@font_bold='Y'">bold </xsl:when><xsl:otherwise> normal</xsl:otherwise></xsl:choose>; </xsl:if>
							  <xsl:if test="string-length(text/@font_italic)!=0">font-style: <xsl:choose><xsl:when test="text/@font_italic='Y'">italic </xsl:when><xsl:otherwise> normal</xsl:otherwise></xsl:choose>; </xsl:if>
							  <xsl:if test="string-length(text/@font_underline)!=0">text-decoration: <xsl:choose><xsl:when test="text/@font_underline='Y'">underline </xsl:when><xsl:otherwise> none</xsl:otherwise></xsl:choose>; </xsl:if>
							  <xsl:if test="string-length(text/@font_shadow)!=0">text-shadow: <xsl:choose><xsl:when test="text/@font_shadow='Y'">0px 0px 1px #000000; </xsl:when><xsl:otherwise> none</xsl:otherwise></xsl:choose>; </xsl:if>
							</xsl:attribute>
							<xsl:value-of select="text" />
						</textarea>
					</xsl:if>
					<xsl:if test="translate(name(.), $uppercase, $smallcase)='checkbox'">
					
						<xsl:variable name="checkbox">checkbox<xsl:value-of select="position()" />[]</xsl:variable>
						<div>
							<xsl:attribute name="style">
							  <xsl:if test="string-length(@width)!=0"> width: <xsl:value-of select="@width" />px; </xsl:if>
							  <xsl:if test="string-length(@height)!=0"> height: <xsl:value-of select="@height" />px; </xsl:if>
							  <xsl:if test="string-length(@coordinateX)!=0"> left: <xsl:value-of select="@coordinateX" />px; position: absolute;</xsl:if> 
							  <xsl:if test="string-length(@coordinateY)!=0"> top: <xsl:value-of select="@coordinateY" />px; </xsl:if>
							</xsl:attribute>
							<input>
								<xsl:attribute name="type">checkbox</xsl:attribute>
								<xsl:attribute name="name"><xsl:value-of select="$checkbox" /></xsl:attribute>
								<xsl:attribute name="id"><xsl:value-of select="$checkbox" /></xsl:attribute>
								<xsl:attribute name="value"><xsl:value-of select="text" /></xsl:attribute>
								<!-- <xsl:attribute name="style">
									<xsl:if test="string-length(@image_path)!=0">appearance: none; background-color: transparent;border:none; background-image: url('<xsl:value-of select="@image_path" />'); </xsl:if>
								</xsl:attribute> -->
							</input>
							<label>
								<xsl:attribute name="for"><xsl:value-of select="$checkbox" /></xsl:attribute>
								<xsl:attribute name="style">
									<xsl:if test="string-length(text/@font_size)!=0">font-size: <xsl:value-of select="text/@font-size" />px; </xsl:if>
									<xsl:if test="string-length(text/@font_face)!=0">font-family: '<xsl:value-of select="text/@font_face" />'; </xsl:if>
									<xsl:if test="string-length(text/@font_color)!=0">color: <xsl:value-of select="text/@font_color" />; </xsl:if>
									<xsl:if test="string-length(text/@font_bold)!=0">font-weight: <xsl:choose><xsl:when test="text/@font_bold='Y'">bold </xsl:when><xsl:otherwise> normal</xsl:otherwise></xsl:choose>; </xsl:if>
								 	<xsl:if test="string-length(text/@font_italic)!=0">font-style: <xsl:choose><xsl:when test="text/@font_italic='Y'">italic </xsl:when><xsl:otherwise> normal</xsl:otherwise></xsl:choose>; </xsl:if>
									<xsl:if test="string-length(text/@font_underline)!=0">text-decoration: <xsl:choose><xsl:when test="text/@font_underline='Y'">underline </xsl:when><xsl:otherwise> none</xsl:otherwise></xsl:choose>; </xsl:if>
									<xsl:if test="string-length(text/@font_shadow)!=0">text-shadow: <xsl:choose><xsl:when test="text/@font_shadow='Y'">0px 0px 1px #000000; </xsl:when><xsl:otherwise> none</xsl:otherwise></xsl:choose>; </xsl:if>
								</xsl:attribute>
								<xsl:value-of select="text" />
							</label>
						</div>
					</xsl:if>
					<xsl:if test="translate(name(.), $uppercase, $smallcase)='radio'">
					
						<xsl:variable name="radio">radio<xsl:value-of select="position()" />[]</xsl:variable>
						<div>
							<xsl:attribute name="style">
							  <xsl:if test="string-length(@width)!=0"> width: <xsl:value-of select="@width" />px; </xsl:if>
							  <xsl:if test="string-length(@height)!=0"> height: <xsl:value-of select="@height" />px; </xsl:if>
							  <xsl:if test="string-length(@coordinateX)!=0"> left: <xsl:value-of select="@coordinateX" />px; position: absolute;</xsl:if> 
							  <xsl:if test="string-length(@coordinateY)!=0"> top: <xsl:value-of select="@coordinateY" />px; </xsl:if>
							</xsl:attribute>
							<input>
								<xsl:attribute name="type">radio</xsl:attribute>
								<xsl:attribute name="name"><xsl:value-of select="$radio" /></xsl:attribute>
								<xsl:attribute name="id"><xsl:value-of select="$radio" /></xsl:attribute>
								<xsl:attribute name="value"><xsl:value-of select="text" /></xsl:attribute>
								<!-- <xsl:attribute name="style">
									<xsl:if test="string-length(@image_path)!=0">appearance: none; background-color: transparent;border:none; background-image: url('<xsl:value-of select="@image_path" />'); </xsl:if>
								</xsl:attribute> -->
							</input>
							<label>
								<xsl:attribute name="for"><xsl:value-of select="$radio" /></xsl:attribute>
								<xsl:attribute name="style">
									<xsl:if test="string-length(text/@font_size)!=0">font-size: <xsl:value-of select="text/@font-size" />px; </xsl:if>
									<xsl:if test="string-length(text/@font_face)!=0">font-family: '<xsl:value-of select="text/@font_face" />'; </xsl:if>
									<xsl:if test="string-length(text/@font_color)!=0">color: <xsl:value-of select="text/@font_color" />; </xsl:if>
									<xsl:if test="string-length(text/@font_bold)!=0">font-weight: <xsl:choose><xsl:when test="text/@font_bold='Y'">bold </xsl:when><xsl:otherwise> normal</xsl:otherwise></xsl:choose>; </xsl:if>
									<xsl:if test="string-length(text/@font_italic)!=0">font-style: <xsl:choose><xsl:when test="text/@font_italic='Y'">italic </xsl:when><xsl:otherwise> normal</xsl:otherwise></xsl:choose>; </xsl:if>
									<xsl:if test="string-length(text/@font_underline)!=0">text-decoration: <xsl:choose><xsl:when test="text/@font_underline='Y'">underline </xsl:when><xsl:otherwise> none</xsl:otherwise></xsl:choose>; </xsl:if>
									<xsl:if test="string-length(text/@font_shadow)!=0">text-shadow: <xsl:choose><xsl:when test="text/@font_shadow='Y'">0px 0px 1px #000000; </xsl:when><xsl:otherwise> none</xsl:otherwise></xsl:choose>; </xsl:if>
								</xsl:attribute>
								<xsl:value-of select="text" />
							</label>
						</div>
					</xsl:if>
					<xsl:if test="translate(name(.), $uppercase, $smallcase)='checkboxs'">
						<xsl:variable name="checkbox">checkbox<xsl:value-of select="position()" />[]</xsl:variable>
						<xsl:for-each select="*">
							<xsl:if test="translate(name(.), $uppercase, $smallcase)='checkbox'">
								<label>
									<xsl:attribute name="for"><xsl:value-of select="$checkbox" /></xsl:attribute>
									<xsl:attribute name="style">
									  <xsl:if test="string-length(@width)!=0"> width: <xsl:value-of select="@width" />px; </xsl:if>
									  <xsl:if test="string-length(@height)!=0"> height: <xsl:value-of select="@height" />px; </xsl:if>
									  <xsl:if test="string-length(@coordinateX)!=0"> left: <xsl:value-of select="@coordinateX" />px; position: absolute;</xsl:if> 
									  <xsl:if test="string-length(@coordinateY)!=0"> top: <xsl:value-of select="@coordinateY" />px; </xsl:if>
									  <xsl:if test="string-length(@image_path)!=0">appearance: none; background-color: transparent;border:none; background-image: url('<xsl:value-of select="@image_path" />'); </xsl:if>
									  <xsl:if test="string-length(text/@font_size)!=0">font-size: <xsl:value-of select="text/@font-size" />px; </xsl:if>
									  <xsl:if test="string-length(text/@font_face)!=0">font-family: '<xsl:value-of select="text/@font_face" />'; </xsl:if>
									  <xsl:if test="string-length(text/@font_color)!=0">color: <xsl:value-of select="text/@font_color" />; </xsl:if>
									  <xsl:if test="string-length(text/@font_bold)!=0">font-weight: <xsl:choose><xsl:when test="text/@font_bold='Y'">bold </xsl:when><xsl:otherwise> normal</xsl:otherwise></xsl:choose>; </xsl:if>
									  <xsl:if test="string-length(text/@font_italic)!=0">font-style: <xsl:choose><xsl:when test="text/@font_italic='Y'">italic </xsl:when><xsl:otherwise> normal</xsl:otherwise></xsl:choose>; </xsl:if>
									  <xsl:if test="string-length(text/@font_underline)!=0">text-decoration: <xsl:choose><xsl:when test="text/@font_underline='Y'">underline </xsl:when><xsl:otherwise> none</xsl:otherwise></xsl:choose>; </xsl:if>
									  <xsl:if test="string-length(text/@font_shadow)!=0">text-shadow: <xsl:choose><xsl:when test="text/@font_shadow='Y'">0px 0px 1px #000000; </xsl:when><xsl:otherwise> none</xsl:otherwise></xsl:choose>; </xsl:if>
									</xsl:attribute>
									<input>
										<xsl:attribute name="type">checkbox</xsl:attribute>
										<xsl:attribute name="name"><xsl:value-of select="$checkbox" /></xsl:attribute>
										<xsl:attribute name="id"><xsl:value-of select="$checkbox" /></xsl:attribute>
										<xsl:attribute name="value"><xsl:value-of select="text" /></xsl:attribute>
									</input>
									<xsl:value-of select="text" />
								</label>
							</xsl:if>
						</xsl:for-each>
					</xsl:if>
					<xsl:if test="translate(name(.), $uppercase, $smallcase)='radios'">
						<xsl:variable name="radio">radio<xsl:value-of select="position()" /></xsl:variable>
						<xsl:for-each select="*">
							<xsl:if test="translate(name(.), $uppercase, $smallcase)='radio'">
								<label>
									<xsl:attribute name="for"><xsl:value-of select="$radio" /></xsl:attribute>
									<xsl:attribute name="style">
									  <xsl:if test="string-length(@width)!=0"> width: <xsl:value-of select="@width" />px; </xsl:if>
									  <xsl:if test="string-length(@height)!=0"> height: <xsl:value-of select="@height" />px; </xsl:if>
									  <xsl:if test="string-length(@coordinateX)!=0"> left: <xsl:value-of select="@coordinateX" />px; position: absolute;</xsl:if> 
									  <xsl:if test="string-length(@coordinateY)!=0"> top: <xsl:value-of select="@coordinateY" />px; </xsl:if>
									  <xsl:if test="string-length(@image_path)!=0">appearance: none; background-color: transparent;border:none; background-image: url('<xsl:value-of select="@image_path" />'); </xsl:if>
									  <xsl:if test="string-length(text/@font_size)!=0">font-size: <xsl:value-of select="text/@font-size" />px; </xsl:if>
									  <xsl:if test="string-length(text/@font_face)!=0">font-family: '<xsl:value-of select="text/@font_face" />'; </xsl:if>
									  <xsl:if test="string-length(text/@font_color)!=0">color: <xsl:value-of select="text/@font_color" />; </xsl:if>
									  <xsl:if test="string-length(text/@font_bold)!=0">font-weight: <xsl:choose><xsl:when test="text/@font_bold='Y'">bold </xsl:when><xsl:otherwise> normal</xsl:otherwise></xsl:choose>; </xsl:if>
									  <xsl:if test="string-length(text/@font_italic)!=0">font-style: <xsl:choose><xsl:when test="text/@font_italic='Y'">italic </xsl:when><xsl:otherwise> normal</xsl:otherwise></xsl:choose>; </xsl:if>
									  <xsl:if test="string-length(text/@font_underline)!=0">text-decoration: <xsl:choose><xsl:when test="text/@font_underline='Y'">underline </xsl:when><xsl:otherwise> none</xsl:otherwise></xsl:choose>; </xsl:if>
									  <xsl:if test="string-length(text/@font_shadow)!=0">text-shadow: <xsl:choose><xsl:when test="text/@font_shadow='Y'">0px 0px 1px #000000; </xsl:when><xsl:otherwise> none</xsl:otherwise></xsl:choose>; </xsl:if>
									</xsl:attribute>
									<input>
										<xsl:attribute name="type">radio</xsl:attribute>
										<xsl:attribute name="name"><xsl:value-of select="$radio" /></xsl:attribute>
										<xsl:attribute name="id"><xsl:value-of select="$radio" /></xsl:attribute>
										<xsl:attribute name="value"><xsl:value-of select="text" /></xsl:attribute>
									</input>
									<xsl:value-of select="text" />
								</label>
							</xsl:if>
						</xsl:for-each>
					</xsl:if>
					<xsl:if test="translate(name(.), $uppercase, $smallcase)='list'">
						<ul>
							<xsl:attribute name="style">
							  <xsl:if test="string-length(@width)!=0"> width: <xsl:value-of select="@width" />px; </xsl:if>
							  <xsl:if test="string-length(@height)!=0"> height: <xsl:value-of select="@height" />px; </xsl:if>
							  <xsl:if test="string-length(@coordinateX)!=0"> left: <xsl:value-of select="@coordinateX" />px; position: absolute;</xsl:if> 
							  <xsl:if test="string-length(@coordinateY)!=0"> top: <xsl:value-of select="@coordinateY" />px; </xsl:if>
							  <xsl:if test="string-length(@image_path)!=0">background-color: transparent;border:none; background-image: url('<xsl:value-of select="@image_path" />'); </xsl:if>
							</xsl:attribute>
							<xsl:for-each select="rows/row">
								<li>
									<xsl:attribute name="style">
										  <xsl:if test="string-length(@image_path)!=0">background-color: transparent;border:none; background-image: url('<xsl:value-of select="@image_path" />'); </xsl:if>
										  <xsl:if test="string-length(text/@font_size)!=0">font-size: <xsl:value-of select="text/@font-size" />px; </xsl:if>
										  <xsl:if test="string-length(text/@font_face)!=0">font-family: '<xsl:value-of select="text/@font_face" />'; </xsl:if>
										  <xsl:if test="string-length(text/@font_color)!=0">color: <xsl:value-of select="text/@font_color" />; </xsl:if>
										  <xsl:if test="string-length(text/@font_bold)!=0">font-weight: <xsl:choose><xsl:when test="text/@font_bold='Y'">bold </xsl:when><xsl:otherwise> normal</xsl:otherwise></xsl:choose>; </xsl:if>
										  <xsl:if test="string-length(text/@font_italic)!=0">font-style: <xsl:choose><xsl:when test="text/@font_italic='Y'">italic </xsl:when><xsl:otherwise> normal</xsl:otherwise></xsl:choose>; </xsl:if>
										  <xsl:if test="string-length(text/@font_underline)!=0">text-decoration: <xsl:choose><xsl:when test="text/@font_underline='Y'">underline </xsl:when><xsl:otherwise> none</xsl:otherwise></xsl:choose>; </xsl:if>
										  <xsl:if test="string-length(text/@font_shadow)!=0">text-shadow: <xsl:choose><xsl:when test="text/@font_shadow='Y'">0px 0px 1px #000000; </xsl:when><xsl:otherwise> none</xsl:otherwise></xsl:choose>; </xsl:if>
									</xsl:attribute>
									<xsl:value-of select="text" />
								</li>
							</xsl:for-each>
						</ul>
					</xsl:if>
					<xsl:if test="translate(name(.), $uppercase, $smallcase)='table'">
						<table>	
							<xsl:attribute name="style">
							  <xsl:if test="string-length(@width)!=0"> width: <xsl:value-of select="@width" />px; </xsl:if>
							  <xsl:if test="string-length(@height)!=0"> height: <xsl:value-of select="@height" />px; </xsl:if>
							  <xsl:if test="string-length(@coordinateX)!=0"> left: <xsl:value-of select="@coordinateX" />px; position: absolute;</xsl:if> 
							  <xsl:if test="string-length(@coordinateY)!=0"> top: <xsl:value-of select="@coordinateY" />px; </xsl:if>
							  <xsl:if test="string-length(@image_path)!=0">background-color: transparent;border:none; background-image: url('<xsl:value-of select="@image_path" />'); </xsl:if>
							</xsl:attribute>
							
						    <xsl:call-template name="tr">
						    	<xsl:with-param name="r" select="0"/>
						    	<xsl:with-param name="row" select="row"/>
						    	<xsl:with-param name="col" select="col"/>
						    </xsl:call-template>
						</table>
					</xsl:if>
				</xsl:for-each>
			</body>
		</html>
	</xsl:template>
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