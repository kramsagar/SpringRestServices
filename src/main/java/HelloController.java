
package com.mkyong;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

// @Controller
// @ResponseBody
@RestController
public class HelloController {

    @RequestMapping("/")
    String hello() {
        return "Ram and Team SRE group SpringBoot Api!";
    }

}
