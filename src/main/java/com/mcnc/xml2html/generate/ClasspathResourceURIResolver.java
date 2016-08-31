package com.mcnc.xml2html.generate;

import javax.xml.transform.Source;
import javax.xml.transform.TransformerException;
import javax.xml.transform.URIResolver;
import javax.xml.transform.stream.StreamSource;

public class ClasspathResourceURIResolver implements URIResolver {
	@Override
	public Source resolve(String href, String base) throws TransformerException {
		return new StreamSource(getClass().getClassLoader()
				.getResourceAsStream(href));
	}
}