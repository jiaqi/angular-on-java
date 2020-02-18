package org.cyclopsgroup.aoj.server;

import java.util.concurrent.TimeUnit;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.CacheControl;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@EnableWebMvc
@ComponentScan({"org.cyclopsgroup.aoj.server"})
public class ApplicationRootConfig implements WebMvcConfigurer {

  @Override
  public void configureViewResolvers(ViewResolverRegistry registry) {
    registry.jsp("/WEB-INF/jsp/", ".jsp");
  }

  @Override
  public void addResourceHandlers(ResourceHandlerRegistry registry) {
    registry
        .addResourceHandler("*.css", "*.js", ".ico")
        .addResourceLocations("/", "classpath:/webapp/aoj/")
        .setCacheControl(CacheControl.maxAge(5, TimeUnit.SECONDS).cachePublic());
  }
}
