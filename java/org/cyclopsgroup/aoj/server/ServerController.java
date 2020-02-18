package org.cyclopsgroup.aoj.server;

import com.google.common.flogger.FluentLogger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
public class ServerController {
  @GetMapping
  public ModelAndView showIndex() {
    return new ModelAndView("index");
  }
}
