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
@Constraint(validatedBy=AllowFileTypeValidator.class)
@Documented
public @interface AllowFileType {

    String message() default "You must enter a correct file type";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
    String[]extension() default "";
}
