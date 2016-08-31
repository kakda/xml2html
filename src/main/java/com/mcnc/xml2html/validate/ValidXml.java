package com.mcnc.xml2html.validate;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.METHOD, ElementType.FIELD})
@Constraint(validatedBy=ValidXmlValidator.class)
@Documented
public @interface ValidXml {

	String message() default "XML file is not well format.";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
}
