package org.cyclopsgroup.aoj.server;

import com.google.common.flogger.FluentLogger;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class ApplicationServletInitializer extends
    AbstractAnnotationConfigDispatcherServletInitializer {

  private static final FluentLogger logger = FluentLogger.forEnclosingClass();

  @Override
  protected Class<?>[] getRootConfigClasses() {
    return new Class[]{ApplicationRootConfig.class};
  }

  @Override
  protected Class<?>[] getServletConfigClasses() {
    return null;
  }

  @Override
  protected String[] getServletMappings() {
    return new String[]{"/"};
  }
}
